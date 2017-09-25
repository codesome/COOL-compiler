package cool;

import java.util.Map;
import java.util.HashMap;
import java.util.Set;
import java.util.HashSet;
import java.lang.StringBuilder;

class VisitorImpl extends ExpressionVisitorImpl {
    /* NOTE: to know about the individual visit functions
             Check Visitor.java 
    */

    public void visit(AST.program prog) {

        // preparing inheritance graph
        Global.inheritanceGraph = new InheritanceGraph();
        for(AST.class_ cl: prog.classes) {
            Global.filename = cl.filename;
            Global.inheritanceGraph.addClass(cl);
        }

        // Analyze the updated graph
        if(Global.inheritanceGraph.analyze()) {
            // errors in inheritance graph
            return;
        }

        // We need to update mangled names before visiting
        // because any method can have use of methods of other classes
        updateMangledNames();

        InheritanceGraph.Node rootNode = Global.inheritanceGraph.getRootNode();
        programVisitorDepthFirstHelper(rootNode);
    }

    // Updates Global.mangledNameMap with 
    // mangled_name_with_class -> return_type
    // For all the methods in all the classes
    private void updateMangledNames() {
        for(InheritanceGraph.Node node: Global.inheritanceGraph.getNodeList()) {
            AST.class_ cl = node.getAstClass();
            for(AST.feature f: cl.features) {
                if(f instanceof AST.method) {
                    AST.method m = (AST.method) f;
                    Global.mangledNameMap.put(Global.getMangledNameWithClass(cl.name, m.name, m.formals), m.typeid);
                }
            }
        }        
    }

    // Used to visit classes in depth first manner
    // Depth first is used to preserve the parent class member variable
    // and method info while we go into depth
    private void programVisitorDepthFirstHelper(InheritanceGraph.Node node) {

        // enter scope for the new class
        // (both variable and methods scope)
        Global.scopeTable.enterScope();
        Global.methodDefinitionScopeTable.enterScope();

        // visit the class
        node.getAstClass().accept(this);

        // iterate through all the child nodes
        for(InheritanceGraph.Node child: node.getChildren()) {
            programVisitorDepthFirstHelper(child);
        }

        // exit scope
        Global.methodDefinitionScopeTable.exitScope();
        Global.scopeTable.exitScope();
    }

    public void visit(AST.class_ cl) {
        Global.currentClass = cl.name;

        // checking all its features for semantics
        for(AST.feature f: cl.features) {
            if(f instanceof AST.attr) { // Its a variable
                AST.attr a = (AST.attr) f;
                checkAttr(a);
            } else { // Its a method
                AST.method m = (AST.method) f;
                checkMethod(m);
            }
        }

        if(Global.Constants.MAIN_TYPE.equals(cl.name)) {
            // This is a Main class
            String mainMangled = Global.methodDefinitionScopeTable.lookUpLocal("main");
            if(mainMangled==null) {
                // main method is missing
                Global.errorReporter.report(Global.filename, cl.getLineNo(), "'main' method is missing in 'Main' class");
            } else if(Global.hasArguments(mainMangled)) {
                // main method contains arguments
                Global.errorReporter.report(Global.filename, cl.getLineNo(), "'main' method cannot have arguments");
            }
        }
        if(Global.Constants.ROOT_TYPE.equals(cl.name) || Global.Constants.IO_TYPE.equals(cl.name) 
            || Global.Constants.STRING_TYPE.equals(cl.name)) {
            // No need to check semantics for default functions
            // They are generate in the code with proper semantics
            return;
        }
        
        // visiting all features
        for(AST.feature f: cl.features) {
            f.accept(this);
        }

    }

    // Used to check an attribute of a class
    //  * checks for redefinition
    private void checkAttr(AST.attr a) {
        if(Global.scopeTable.lookUpGlobal(a.name) == null) {
            // not defined earlier, all clear
            Global.scopeTable.insert(a.name, a.typeid);
        } else {
            // already defined in the scope
            StringBuilder errorMessage = new StringBuilder();
            errorMessage.append("Attribute '").append(a.name).append("'");
            if(Global.scopeTable.lookUpLocal(a.name) == null) {
                // defined in parent classes
                errorMessage.append(" has been already defined in the parent class tree.");
            } else {
                // defined in current class
                errorMessage.append(" has multiple definitions in the class '")
                    .append(Global.currentClass).append("'");
            }
            Global.errorReporter.report(Global.filename, a.getLineNo(), errorMessage.toString());
        }
    }
    
    // Used to check a method of a class
    //  * checks for redefinition and correct redefinition from parent
    private void checkMethod(AST.method m) {

        if(Global.methodDefinitionScopeTable.lookUpLocal(m.name)!=null) {
            // Already present in the current class
            Global.errorReporter.report(Global.filename, m.getLineNo(), 
                new StringBuilder().append("Method '").append(m.name).append("' has multiple definitions in the class '")
                .append(Global.currentClass).append("'").toString());
        } else {

            if(!Global.inheritanceGraph.hasClass(m.typeid)) {
                // using undefined type
                Global.errorReporter.report(Global.filename, m.getLineNo(), 
                    new StringBuilder().append("Return type '").append(m.typeid).append("' for method '")
                    .append(m.name).append("' has not been defined").toString());
                m.typeid = Global.Constants.ROOT_TYPE;
            }

            // className = null, because we will check mangled name with parent classes
            String mangledName = Global.getMangledNameWithType(m.name, m.typeid, m.formals);
            
            String scopeMangledName;
            if((scopeMangledName=Global.methodDefinitionScopeTable.lookUpGlobal(m.name))!=null
                && !scopeMangledName.equals(mangledName)) {
                // it has been defined in parent class
                // and the method signatures does not match
                Global.errorReporter.report(Global.filename, m.getLineNo(), 
                    new StringBuilder().append("Redefined method '").append(m.name).append("' in class '")
                    .append(Global.currentClass).append("' doesn't follow the return type and/or argument order of parent class.").toString());
            }

            Global.methodDefinitionScopeTable.insert(m.name, mangledName);
        }
    }

    public void visit(AST.attr at) {
        if("self".equals(at.name)) {
            Global.scopeTable.remove(at.name);
            Global.errorReporter.report(Global.filename, at.getLineNo(), "Cannot define attribute with name 'self'");
            at.value.accept(this);
        } else if(!Global.inheritanceGraph.hasClass(at.typeid)) {
            // using undefined type
            Global.errorReporter.report(Global.filename, at.getLineNo(), 
                new StringBuilder().append("Type '").append(at.typeid).append("' for attribute '")
                .append(at.name).append("' has not been defined").toString());

            // Setting it to root type to continue compilation
            Global.scopeTable.insert(at.name, Global.Constants.ROOT_TYPE);
            at.value.accept(this);
        } else {
            // attribute is valid
            at.value.accept(this);
            if(!(at.value instanceof AST.no_expr)) { // assignment exists

                // checking conformance of type of variable and assignment
                if(!Global.inheritanceGraph.isConforming(at.typeid, at.value.type)) {
                    Global.errorReporter.report(Global.filename, at.getLineNo(), 
                        new StringBuilder().append("Expression doesn't conform to the declared type of attribute '")
                        .append(at.name).append(":").append(at.typeid).append("'").toString());
                }
            }
        }
    }

    public void visit(AST.method mthd) {
        // new scope because variables in a method
        // hides member variables of the class 
        Global.scopeTable.enterScope();

        // visiting all the formals
        Set<String> formalSet = new HashSet<>();
        for(AST.formal fm: mthd.formals) {
            if("self".equals(fm.name)) {
                Global.errorReporter.report(Global.filename, fm.getLineNo(), "Cannot define formal with name 'self'");
            } if(formalSet.contains(fm.name)) {
                // formal name used multiple times
                Global.errorReporter.report(Global.filename, fm.getLineNo(), 
                    new StringBuilder().append("Formal '").append(fm.name)
                    .append("' has be redeclared in the method '").append(mthd.name).append("'").toString());
            } else {
                // valid formal name
                formalSet.add(fm.name);
            }
            fm.accept(this);
        }

        mthd.body.accept(this);
        
        // checking conformance of type of method return type and method body
        if(!Global.inheritanceGraph.isConforming(mthd.typeid, mthd.body.type)) {
            Global.errorReporter.report(Global.filename, mthd.getLineNo(), 
                new StringBuilder().append("Return type of its body doesn't conform with return type of method '").append(mthd.name)
                .append("'").toString());
        }

        // exiting function scope
        Global.scopeTable.exitScope();
    }

    public void visit(AST.formal fm) {
        if(!Global.inheritanceGraph.hasClass(fm.typeid)) {
            // using undefined type
            Global.errorReporter.report(Global.filename, fm.getLineNo(), 
                new StringBuilder().append("Type '").append(fm.typeid).append("' for formal '")
                .append(fm.name).append("' has not been defined").toString());
        } else {
            // valid type
            Global.scopeTable.insert(fm.name, fm.typeid);
        }
    }

}
