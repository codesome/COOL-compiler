package cool;

import java.lang.StringBuilder;
import java.util.Map;
import java.util.HashMap;

class VisitorImpl extends ExpressionVisitorImpl {
    /* NOTE: to know about the individual visit functions
             Check Visitor.java */

    // Prints all the global string constants with their registers
    private void printStringConstants() {
        Global.out.println("; String constant declarations");
        DefaultIR.addDefaultStrings();
        StringBuilder structBuilder = new StringBuilder();
        for(Map.Entry<String,String> entry: Global.stringConstantToRegisterMap.entrySet()) {
            structBuilder.setLength(0);
            structBuilder.append(entry.getValue()).append(" = private unnamed_addr constant [")
            .append(entry.getKey().length()+1).append(" x i8] c\"").append(entry.getKey()).append("\\00\", align 1");
            Global.out.println(structBuilder.toString());
        }
    }

    // Prints structs for all the class and calculates the size of the struct
    private void generateStructsAndCalculateSize() {
        Global.out.println();
        Global.out.println("; Struct declarations");
        InheritanceGraph.Node rootNode = Global.inheritanceGraph.getRootNode();
        Global.out.println(Utils.getStructName(Global.Constants.ROOT_TYPE) + " = type {i8*}");
        Global.classToVariableToIndexListMap.put(Global.Constants.ROOT_TYPE, new HashMap<>());

        for(InheritanceGraph.Node child: rootNode.getChildren()) {
            generateStructsAndCalculateSizeDFS(child);
        }
        Global.out.println();
    }

    // DFS helper for generateStructsAndCalculateSize
    private void generateStructsAndCalculateSizeDFS(InheritanceGraph.Node node) {
        AST.class_ cl = node.getAstClass();
        int size = 8; // initial 8 bytes for the type name in Object
        
        // Primitive types are i32, i8, i8*. No need of structs
        if(Utils.isPrimitiveType(cl.name))
            return;
        
        StringBuilder builder = new StringBuilder(Utils.getStructName(cl.name));
        size += Global.classSizeMap.get(node.getParent().getAstClass().name);
        builder.append(" = type { ").append(Utils.getStructName(node.getParent().getAstClass().name));
        
        // Updating the index map for the varaibles
        Map<String, String> variableToIndexListMap = new HashMap<>();
        
        // variables present in the parent
        Map<String, String> parentMap = Global.classToVariableToIndexListMap.get(node.getParent().getAstClass().name);
        for(Map.Entry<String, String> entry : parentMap.entrySet()) {
            variableToIndexListMap.put(entry.getKey(), " i32 0,"+entry.getValue());
        }

        // variables declared inside the class
        int index = 0;
        for(AST.feature f : cl.features) {
            if(f instanceof AST.attr) {
                index++;
                AST.attr a = (AST.attr) f;
                size += Utils.getSizeForStruct(a.typeid);
                builder.append(", ").append(Utils.getBasicTypeOrPointer(a.typeid));
                variableToIndexListMap.put(a.name, " i32 0, i32 "+index);
            } else {
                // updating the function mangled names
                AST.method m = (AST.method) f;
                Global.functionMangledNames.add(Utils.getMangledName(cl.name, m.name));
            }
        }

        builder.append(" }");
        Global.out.println(builder.toString());

        Global.classToVariableToIndexListMap.put(cl.name, variableToIndexListMap);
        Global.classSizeMap.put(cl.name, size);
        
        // Depth first call        
        for(InheritanceGraph.Node child: node.getChildren()) {
            generateStructsAndCalculateSizeDFS(child);
        }
    }

    // prints constructors of all the classes, except primitive types
    private void generateConstructors() {
        InheritanceGraph.Node rootNode = Global.inheritanceGraph.getRootNode();
        generateConstructorsDFS(rootNode);
    }

    // Calls constructor of parent by taking child class register
    private void createCallForParentConstructor(String className, String childReg) {
        String parentType = Global.inheritanceGraph.getParentClassName(className);
        if(parentType!=null) {
            String bitcastRegister = IRPrinter.createConvertInst(childReg, Global.currentClass, 
                parentType, IRPrinter.BITCAST);
            IRPrinter.createCallForConstructor(parentType, bitcastRegister);
        }
    }

    // DFS helper for generateConstructors
    private void generateConstructorsDFS(InheritanceGraph.Node node) {
        AST.class_ cl = node.getAstClass();

        if(Utils.isPrimitiveType(cl.name)) 
            return;

        Global.out.println("\n; Constructor of class '" + cl.name + "'");
        Global.labelToCountMap.clear();
        Global.registerCounter = 0;
        Global.currentClass = cl.name;
        Global.out.println("define void @" + Utils.getMangledName(cl.name, cl.name) + "(" + Utils.getStructName(cl.name) + "* %this) {");
        IRPrinter.createLabel("entry");
        createCallForParentConstructor(Global.currentClass, "%this");

        // Individual attributes of constructor are taken care in visit of AST.attr
        for(AST.feature f : cl.features) {
            if(f instanceof AST.attr) {
                AST.attr a = (AST.attr) f;
                a.accept(this);
            }
        }

        Global.out.println(IRPrinter.INDENT+"ret void");
        Global.out.println("}");
        for(InheritanceGraph.Node child: node.getChildren()) {
            generateConstructorsDFS(child);
        }
    }

    // Used to visit classes in depth first manner
    // Depth first is used to preserve the parent class member variable
    // and method info while we go into depth
    private void programVisitorDFS(InheritanceGraph.Node node) {

        // enter scope for the new class
        Global.scopeTable.enterScope();

        // visit the class
        if(!Utils.isDefaultClass(node.getAstClass().name))
            node.getAstClass().accept(this);

        // iterate through all the child nodes
        for(InheritanceGraph.Node child: node.getChildren()) {
            programVisitorDFS(child);
        }

        // exit scope
        Global.scopeTable.exitScope();
    }

    // Updates mangled names for all the functions
    private void updateDefaultFunctionNamesAndSize(AST.program prog) {
        // These are not defined in AST
        Global.classSizeMap.put("Int",4);
        Global.classSizeMap.put("Bool",1);
        Global.classSizeMap.put("String",8);
        Global.classSizeMap.put("Object",0);
        Global.classSizeMap.put("IO",0);
        Global.functionMangledNames.add(Utils.getMangledName("Object", "type_name"));
        Global.functionMangledNames.add(Utils.getMangledName("Object", "abort"));
        Global.functionMangledNames.add(Utils.getMangledName("IO", "out_int"));
        Global.functionMangledNames.add(Utils.getMangledName("IO", "out_string"));
        Global.functionMangledNames.add(Utils.getMangledName("IO", "in_int"));
        Global.functionMangledNames.add(Utils.getMangledName("IO", "in_string"));
        Global.functionMangledNames.add(Utils.getMangledName("String", "length"));
        Global.functionMangledNames.add(Utils.getMangledName("String", "concat"));
        Global.functionMangledNames.add(Utils.getMangledName("String", "substr"));
    }

    public void visit(AST.program prog) {
        // preparing inheritance graph
        Global.inheritanceGraph = new InheritanceGraph();
        for(AST.class_ cl: prog.classes) {
            if(!Global.stringConstantToRegisterMap.containsKey(cl.name)) {
                Global.stringConstantToRegisterMap.put(cl.name, "@.str."+Global.stringRegisterCounter);
                Global.stringRegisterCounter++;
            }
            Global.inheritanceGraph.addClass(cl);
        }

        Global.inheritanceGraph.update();

        // size of default classes
        updateDefaultFunctionNamesAndSize(prog);
        printStringConstants();
        generateStructsAndCalculateSize();

        programVisitorDFS(Global.inheritanceGraph.getRootNode());

        // generateConstructors();
        DefaultIR.generateDefaultMethods();

    }

    public void visit(AST.class_ cl) {
        Global.currentClass = cl.name;
        for(AST.feature f : cl.features) {
            if(f instanceof AST.attr) {
                AST.attr at = ((AST.attr) f);
                Global.scopeTable.insert(at.name, at.typeid);
            }
        }
        for(AST.feature f : cl.features) {
            if(f instanceof AST.method) {
                ((AST.method) f).accept(this);
            }
        }

        // constructor
        if(Utils.isPrimitiveType(cl.name)) 
            return;

        Global.out.println("\n; Constructor of class '" + cl.name + "'");
        Global.labelToCountMap.clear();
        Global.registerCounter = 0;
        Global.currentClass = cl.name;
        Global.out.println("define void @" + Utils.getMangledName(cl.name, cl.name) + "(" + Utils.getStructName(cl.name) + "* %this) {");
        IRPrinter.createLabel("entry");
        createCallForParentConstructor(Global.currentClass, "%this");

        // Individual attributes of constructor are taken care in visit of AST.attr
        for(AST.feature f : cl.features) {
            if(f instanceof AST.attr) {
                AST.attr a = (AST.attr) f;
                a.accept(this);
            }
        }

        Global.out.println(IRPrinter.INDENT+"ret void");
        Global.out.println("}");
    }

    public void visit(AST.attr at) {
        String gepRegister = IRPrinter.createClassAttrGEP(Global.currentClass, "%this", at.name);
        String valueRegister = at.value.accept(this);

        if(Utils.isPrimitiveType(at.typeid)) {
            // gep is single pointer
            if(valueRegister==null) {
                // no assignment, hence store the default value
                IRPrinter.createStoreInst(Utils.getDefaultValue(at.typeid), gepRegister, Utils.getBasicType(at.typeid));
            } else {
                IRPrinter.createStoreInst(valueRegister, gepRegister, Utils.getBasicType(at.typeid));
            }
        } else {
            // gep is double pointer
            if(valueRegister==null) {
                // no assignment, hence store null for the pointer
                IRPrinter.createDoublePointerStoreInst("null", gepRegister, at.typeid);
            } else {
                if(!at.typeid.equals(at.value.type)) {
                    if(Global.Constants.ROOT_TYPE.equals(at.typeid) && Utils.isPrimitiveType(at.value.type)) {
                        // creating new object, as primitive cant be stored in object struct directly
                        AST.new_ newObj = new AST.new_(Global.Constants.ROOT_TYPE, 0);
                        newObj.type = Global.Constants.ROOT_TYPE;
                        valueRegister = this.visit(newObj);
                        // fixing the typename
                        String typenameGEP = IRPrinter.createTypeNameGEP(valueRegister);
                        String typenameString = IRPrinter.createStringGEP(at.value.type);
                        IRPrinter.createStoreInst(typenameString, typenameGEP, "i8*");
                    } else {
                        String oldClass = at.value.type;
                        String pClass = Global.inheritanceGraph.getParentClassName(at.value.type);
                        while(!pClass.equals(at.typeid)) {
                            valueRegister = IRPrinter.createConvertInst(valueRegister, oldClass, pClass, IRPrinter.BITCAST);
                            oldClass = pClass;
                            pClass = Global.inheritanceGraph.getParentClassName(pClass);
                        }
                        valueRegister = IRPrinter.createConvertInst(valueRegister, oldClass, at.typeid, IRPrinter.BITCAST);
                    }
                }
                IRPrinter.createDoublePointerStoreInst(valueRegister, gepRegister, at.typeid);
            }
        }
    }

    public void visit(AST.method mthd) {
        Global.scopeTable.enterScope();
        Global.registerCounter = 0;
        if(Global.currentClass.equals("Main") && mthd.name.equals("main")) {
           Global.mainReturnType = mthd.typeid;
        }
        Global.methodParams.clear();
        Global.out.println("\n; Class: "+Global.currentClass+", Method: "+mthd.name);
        Global.out.print("define " + Utils.getBasicTypeOrPointer(mthd.typeid) + " @" + 
            Utils.getMangledName(Global.currentClass, mthd.name) + "(");
        Global.out.print(Utils.getStructName(Global.currentClass)+"* %this");

        // accepting the formals
        for(AST.formal fm: mthd.formals) {
            Global.out.print(", ");
            fm.accept(this);
        }

        Global.out.println(") {");
        IRPrinter.createLabel("entry");

        // Allocating address for formal parameters as it can be changed 
        // in the function body
        for(AST.formal fm: mthd.formals) {
            IRPrinter.createAlloca(Utils.getBasicTypeOrPointer(fm.typeid), fm.name+".addr");
            IRPrinter.createStoreInst("%"+fm.name, "%"+fm.name+".addr", Utils.getBasicTypeOrPointer(fm.typeid));
        }

        // bit casting return value if types are not same
        String returnReg = mthd.body.accept(this);
        if(!mthd.typeid.equals(mthd.body.type)) {
            returnReg = IRPrinter.createConvertInst(returnReg, mthd.body.type, 
                mthd.typeid, IRPrinter.BITCAST);
        }
        Global.out.println(IRPrinter.INDENT + "ret " + Utils.getBasicTypeOrPointer(mthd.typeid) + " " + returnReg);
        Global.out.println("}");

        Global.scopeTable.exitScope();
    }

    public void visit(AST.formal fm) {
        // function paramaters
        Global.scopeTable.insert(fm.name, fm.typeid);
        Global.methodParams.add(fm.name);
        Global.out.print(Utils.getBasicTypeOrPointer(fm.typeid) + " %" + fm.name);
    }

}
