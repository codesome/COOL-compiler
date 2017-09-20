package cool;

import java.util.Map;
import java.util.HashMap;
import java.util.Set;
import java.util.HashSet;
import java.lang.StringBuilder;

class VisitorImpl extends ExpressionVisitorImpl {

    private void programVisitorDepthFirstHelper(InheritanceGraph.Node node) {

        // enter scope
        GlobalData.scopeTable.enterScope();
        GlobalData.methodDefinitionScopeTable.enterScope();

        // visit the node
        node.getAstClass().accept(this);

        // iterate through all the child nodes
        for(InheritanceGraph.Node child: node.getChildren()) {
            programVisitorDepthFirstHelper(child);
        }

        // exit scope
        GlobalData.methodDefinitionScopeTable.exitScope();
        GlobalData.scopeTable.exitScope();
    }


    // TODO: for a class, decide whether same functions can be repeated
    private void updateMangledNames() {
        for(InheritanceGraph.Node node: GlobalData.inheritanceGraph.getNodeList()) {
            AST.class_ cl = node.getAstClass();
            for(AST.feature f: cl.features) {
                if(f instanceof AST.method) {
                    AST.method m = (AST.method) f;
                    GlobalData.mangledNameMap.put(GlobalData.getMangledNameWithoutType(cl.name, m.name, m.formals), m.typeid);
                }
            }
        }        
    }

    public void visit(AST.program prog) {

        // preparing inheritance graph
        GlobalData.inheritanceGraph = new InheritanceGraph();

        for(AST.class_ cl: prog.classes) {
            GlobalData.filename = cl.filename;
            GlobalData.inheritanceGraph.addClass(cl);
        }
        GlobalData.inheritanceGraph.analyze();

        if(GlobalData.errors.size() > 0) {
            // errors in inheritance graph
            return;
        }

        updateMangledNames();

        InheritanceGraph.Node rootNode = GlobalData.inheritanceGraph.getRootNode();

        programVisitorDepthFirstHelper(rootNode);

    }


    public void visit(AST.class_ cl) {
        GlobalData.currentClass = cl.name;

        // adding variables to the scope
        // TODO: check if declared already
        for(AST.feature f: cl.features) {
            if(f instanceof AST.attr) { // Its a variable
                AST.attr a = (AST.attr) f;
                if(GlobalData.scopeTable.lookUpGlobal(a.name) == null) {
                    // not defined earlier, all clear
                    GlobalData.scopeTable.insert(a.name, a.typeid);
                } else {
                    // already defined
                    StringBuilder errorMessage = new StringBuilder();
                    errorMessage.append("Attribute '").append(a.name).append("'");
                    if(GlobalData.scopeTable.lookUpLocal(a.name) == null) {
                        // defined in parent classes
                        errorMessage.append(" has been already defined in inherited tree.");
                    } else {
                        // defined in current class
                        errorMessage.append(" has multiple definitions in the class '")
                            .append(cl.name).append("'");
                    }
                    GlobalData.errors.add(new Error(GlobalData.filename, a.getLineNo(), errorMessage.toString()));
                }
            } else { // Its a method
                AST.method m = (AST.method) f;
                if(GlobalData.methodDefinitionScopeTable.lookUpLocal(m.name)!=null) {
                    // Already present in the current class
                    GlobalData.errors.add(new Error(GlobalData.filename, m.getLineNo(), 
                        new StringBuilder().append("Method '").append(m.name).append("' has multiple definitions in the class '")
                        .append(cl.name).append("'").toString()));
                } else {
                    // className = null, because we will check mangled name with parent classes
                    String mangledName = GlobalData.getMangledNameWithType(null, m.name, m.typeid, m.formals);
                    
                    String scopeMangledName;
                    if((scopeMangledName=GlobalData.methodDefinitionScopeTable.lookUpGlobal(m.name))!=null
                        && !scopeMangledName.equals(mangledName)) {
                        // it has been defined in parent class
                        // and the method signatures does not match
                        GlobalData.errors.add(new Error(GlobalData.filename, m.getLineNo(), 
                            new StringBuilder().append("Redefined method '").append(m.name).append("' in class '")
                            .append(cl.name).append("' doesn't follow method signature of inherited class.").toString()));
                    }

                    GlobalData.methodDefinitionScopeTable.insert(m.name, mangledName);
                }
            }
        }

        // visiting all features
        if(!"Object".equals(cl.name) && !"IO".equals(cl.name) && !"String".equals(cl.name))
            for(AST.feature f: cl.features) {
                f.accept(this);
            }

    }

    public void visit(AST.attr at) {
        if(!GlobalData.inheritanceGraph.hasClass(at.typeid)) {
            // using undefined type
            GlobalData.errors.add(new Error(GlobalData.filename, at.getLineNo(), 
                new StringBuilder().append("Type '").append(at.typeid).append("' for attribute '")
                .append(at.name).append("' has not been defined").toString()));
        } else if(!(at.value instanceof AST.no_expr)) { // assignment exists
            // visiting expression
            at.value.accept(this);

            // checking type of variable and assignment
            if(!GlobalData.inheritanceGraph.isConforming(at.typeid, at.value.type)) {
                GlobalData.errors.add(new Error(GlobalData.filename, at.getLineNo(), 
                    new StringBuilder().append("Expression doesn't conform to the declared type of attribute '")
                    .append(at.name).append(":").append(at.typeid).append("'").toString()));
            }
        }
    }

    public void visit(AST.method mthd) {
        GlobalData.scopeTable.enterScope();
        // visiting all the formals
        Set<String> formalSet = new HashSet<>();
        for(AST.formal fm: mthd.formals) {
            if(formalSet.contains(fm.name)) {
                GlobalData.errors.add(new Error(GlobalData.filename, fm.getLineNo(), 
                    new StringBuilder().append("Formal '").append(fm.name)
                    .append("' has be redeclared in the method '").append(mthd.name).append("'").toString()));
            } else {
                formalSet.add(fm.name);
            }
            fm.accept(this);
        }

        mthd.body.accept(this);
        if(!mthd.typeid.equals(mthd.body.type)) {
            GlobalData.errors.add(new Error(GlobalData.filename, mthd.getLineNo(), 
                new StringBuilder().append("Return type of method '").append(mthd.name)
                .append("' doesn't match with return type of its body.").toString()));
        }
        GlobalData.scopeTable.exitScope();
    }

    public void visit(AST.formal fm) {
        if(!GlobalData.inheritanceGraph.hasClass(fm.typeid)) {
            // using undefined type
            StringBuilder errorMessage = new StringBuilder();
            errorMessage.append("Type '").append(fm.typeid).append("' for formal '")
            .append(fm.name).append("' has not been defined");
            GlobalData.errors.add(new Error(GlobalData.filename, fm.getLineNo(), 
                new StringBuilder().append("Type '").append(fm.typeid).append("' for formal '")
                .append(fm.name).append("' has not been defined").toString()));
        } else {
            GlobalData.scopeTable.insert(fm.name, fm.typeid);
        }
    }

}