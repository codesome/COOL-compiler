package cool;

import java.util.Map;
import java.util.HashMap;
import java.util.Set;
import java.util.HashSet;
import java.lang.StringBuilder;

class VisitorImpl extends ExpressionVisitorImpl {

    private void programVisitorDepthFirstHelper(InheritanceGraph.Node node) {

        // enter scope
        Global.scopeTable.enterScope();
        Global.methodDefinitionScopeTable.enterScope();

        // visit the node
        node.getAstClass().accept(this);

        // iterate through all the child nodes
        for(InheritanceGraph.Node child: node.getChildren()) {
            programVisitorDepthFirstHelper(child);
        }

        // exit scope
        Global.methodDefinitionScopeTable.exitScope();
        Global.scopeTable.exitScope();
    }


    // TODO: for a class, decide whether same functions can be repeated
    private void updateMangledNames() {
        for(InheritanceGraph.Node node: Global.inheritanceGraph.getNodeList()) {
            AST.class_ cl = node.getAstClass();
            for(AST.feature f: cl.features) {
                if(f instanceof AST.method) {
                    AST.method m = (AST.method) f;
                    Global.mangledNameMap.put(Global.getMangledNameWithoutType(cl.name, m.name, m.formals), m.typeid);
                }
            }
        }        
    }

    public void visit(AST.program prog) {

        // preparing inheritance graph
        Global.inheritanceGraph = new InheritanceGraph();

        for(AST.class_ cl: prog.classes) {
            Global.filename = cl.filename;
            Global.inheritanceGraph.addClass(cl);
        }

        if(Global.inheritanceGraph.analyze()) {
            // errors in inheritance graph
            return;
        }

        updateMangledNames();

        InheritanceGraph.Node rootNode = Global.inheritanceGraph.getRootNode();

        programVisitorDepthFirstHelper(rootNode);

    }

    public void visit(AST.class_ cl) {
        Global.currentClass = cl.name;

        // adding variables to the scope
        // TODO: check if declared already
        for(AST.feature f: cl.features) {
            if(f instanceof AST.attr) { // Its a variable
                AST.attr a = (AST.attr) f;
                checkAttr(a);
            } else { // Its a method
                AST.method m = (AST.method) f;
                checkMethod(m);
            }
        }

        // visiting all features
        if(!"Object".equals(cl.name) && !"IO".equals(cl.name) && !"String".equals(cl.name))
            for(AST.feature f: cl.features) {
                f.accept(this);
            }

    }

    private void checkAttr(AST.attr a) {
        if(Global.scopeTable.lookUpGlobal(a.name) == null) {
            // not defined earlier, all clear
            Global.scopeTable.insert(a.name, a.typeid);
        } else {
            // already defined
            StringBuilder errorMessage = new StringBuilder();
            errorMessage.append("Attribute '").append(a.name).append("'");
            if(Global.scopeTable.lookUpLocal(a.name) == null) {
                // defined in parent classes
                errorMessage.append(" has been already defined in inherited tree.");
            } else {
                // defined in current class
                errorMessage.append(" has multiple definitions in the class '")
                    .append(Global.currentClass).append("'");
            }
            Global.errorReporter.report(Global.filename, a.getLineNo(), errorMessage.toString());
        }
    }
    
    private void checkMethod(AST.method m) {
        if(Global.methodDefinitionScopeTable.lookUpLocal(m.name)!=null) {
            // Already present in the current class
            Global.errorReporter.report(Global.filename, m.getLineNo(), 
                new StringBuilder().append("Method '").append(m.name).append("' has multiple definitions in the class '")
                .append(Global.currentClass).append("'").toString());
        } else {
            // className = null, because we will check mangled name with parent classes
            String mangledName = Global.getMangledNameWithType(null, m.name, m.typeid, m.formals);
            
            String scopeMangledName;
            if((scopeMangledName=Global.methodDefinitionScopeTable.lookUpGlobal(m.name))!=null
                && !scopeMangledName.equals(mangledName)) {
                // it has been defined in parent class
                // and the method signatures does not match
                Global.errorReporter.report(Global.filename, m.getLineNo(), 
                    new StringBuilder().append("Redefined method '").append(m.name).append("' in class '")
                    .append(Global.currentClass).append("' doesn't follow method signature of inherited class.").toString());
            }

            Global.methodDefinitionScopeTable.insert(m.name, mangledName);
        }
    }

    public void visit(AST.attr at) {
        if(!Global.inheritanceGraph.hasClass(at.typeid)) {
            // using undefined type
            Global.errorReporter.report(Global.filename, at.getLineNo(), 
                new StringBuilder().append("Type '").append(at.typeid).append("' for attribute '")
                .append(at.name).append("' has not been defined").toString());

            at.value.accept(this);
        } else { 
            at.value.accept(this);
            if(!(at.value instanceof AST.no_expr)) { // assignment exists

                // checking type of variable and assignment
                if(!Global.inheritanceGraph.isConforming(at.typeid, at.value.type)) {
                    Global.errorReporter.report(Global.filename, at.getLineNo(), 
                        new StringBuilder().append("Expression doesn't conform to the declared type of attribute '")
                        .append(at.name).append(":").append(at.typeid).append("'").toString());
                }
            }
        }
    }

    public void visit(AST.method mthd) {
        Global.scopeTable.enterScope();
        // visiting all the formals
        Set<String> formalSet = new HashSet<>();
        for(AST.formal fm: mthd.formals) {
            if(formalSet.contains(fm.name)) {
                Global.errorReporter.report(Global.filename, fm.getLineNo(), 
                    new StringBuilder().append("Formal '").append(fm.name)
                    .append("' has be redeclared in the method '").append(mthd.name).append("'").toString());
            } else {
                formalSet.add(fm.name);
            }
            fm.accept(this);
        }

        mthd.body.accept(this);
        if(!Global.inheritanceGraph.isConforming(mthd.typeid, mthd.body.type)) {
            Global.errorReporter.report(Global.filename, mthd.getLineNo(), 
                new StringBuilder().append("Return type of method '").append(mthd.name)
                .append("' doesn't match with return type of its body.").toString());
        }
        Global.scopeTable.exitScope();
    }

    public void visit(AST.formal fm) {
        if(!Global.inheritanceGraph.hasClass(fm.typeid)) {
            // using undefined type
            Global.errorReporter.report(Global.filename, fm.getLineNo(), 
                new StringBuilder().append("Type '").append(fm.typeid).append("' for formal '")
                .append(fm.name).append("' has not been defined").toString());
        } else {
            Global.scopeTable.insert(fm.name, fm.typeid);
        }
    }

}
