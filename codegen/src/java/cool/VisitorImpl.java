package cool;

import java.lang.StringBuilder;
import java.util.Map;
import java.util.HashMap;

class VisitorImpl extends ExpressionVisitorImpl {
    /* NOTE: to know about the individual visit functions
             Check Visitor.java 
    */

    private String mainReturnType;


    private String getBasicTypeOrPointer(String type) {
        if(Global.Constants.STRING_TYPE.equals(type)) {
            return "i8*";
        }
        else if(Global.Constants.INT_TYPE.equals(type)) {
            return "i32";
        }
        else if(Global.Constants.BOOL_TYPE.equals(type)) {
            return "i8";
        }
        return Utils.getStructName(type) + "*";
    }


    private void printStringConstants() {
        StringBuilder structBuilder = new StringBuilder();
        if(!Global.stringConstantToRegisterMap.containsKey("")) {
            Global.stringConstantToRegisterMap.put("", "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
        for(Map.Entry<String,String> entry: Global.stringConstantToRegisterMap.entrySet()) {
            structBuilder.setLength(0);
            structBuilder.append(entry.getValue()).append(" = private unnamed_addr constant [")
            .append(entry.getKey().length()+1).append(" x i8] c\"").append(entry.getKey()).append("\\00\", align 1");
            Global.out.println(structBuilder.toString());
        }
    }

    private void generateStructs() {
        Global.out.println();
        InheritanceGraph.Node rootNode = Global.inheritanceGraph.getRootNode();
        Global.out.println(Utils.getStructName(Global.Constants.ROOT_TYPE) + " = type {}");
        Global.classToVariableToIndexListMap.put(Global.Constants.ROOT_TYPE, new HashMap<>());

        for(InheritanceGraph.Node child: rootNode.getChildren()) {
            generateStructsDFS(child);
        }
        // Global.out.println("%class.Int = type { %class.Object, i32 }");
        // Global.out.println("%class.String = type { %class.Object, i8* }");
        // Global.out.println("%class.Bool = type { %class.Object, i8 }");
        Global.out.println();
    }

    private void generateStructsDFS(InheritanceGraph.Node node) {
        AST.class_ cl = node.getAstClass();
        
        if(Utils.isPrimitiveType(cl.name)) 
            return;
        
        StringBuilder builder = new StringBuilder(Utils.getStructName(cl.name));
        builder.append(" = type { ").append(Utils.getStructName(node.getParent().getAstClass().name));
        
        Map<String, String> variableToIndexListMap = new HashMap<>();
        Map<String, String> parentMap = Global.classToVariableToIndexListMap.get(node.getParent().getAstClass().name);
        for(Map.Entry<String, String> entry : parentMap.entrySet()) {
            variableToIndexListMap.put(entry.getKey(), " i32 0,"+entry.getValue());
        }


        // if(Global.Constants.STRING_TYPE.equals(cl.name)) {
        //     builder.append(", i8*");
        //     variableToIndexListMap.put("val", " i32 0, i32 1");
        // } else if(Global.Constants.INT_TYPE.equals(cl.name)) {
        //     builder.append(", i32");
        //     variableToIndexListMap.put("val", " i32 0, i32 1");
        // } else if(Global.Constants.BOOL_TYPE.equals(cl.name)) {
        //     builder.append(", i8");
        //     variableToIndexListMap.put("val", " i32 0, i32 1");
        // } else {
            int index = 0;
            for(AST.feature f : cl.features) {
                if(f instanceof AST.attr) {
                    index++;
                    AST.attr a = (AST.attr) f;
                    builder.append(", ").append(getBasicTypeOrPointer(a.typeid));
                    variableToIndexListMap.put(a.name, " i32 0, i32 "+index);
                }
            }
        // }

        builder.append(" }");
        Global.out.println(builder.toString());

        Global.classToVariableToIndexListMap.put(cl.name, variableToIndexListMap);
        
        for(InheritanceGraph.Node child: node.getChildren()) {
            generateStructsDFS(child);
        }
    }

    public void generateConstructors() {
        InheritanceGraph.Node rootNode = Global.inheritanceGraph.getRootNode();
        generateConstructorsDFS(rootNode);
    }

    public void generateConstructorsDFS(InheritanceGraph.Node node) {
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
        
        // if(Global.Constants.STRING_TYPE.equals(cl.name)) {
        //     generateStringConstructBody();
        // } else if(Global.Constants.INT_TYPE.equals(cl.name)) {
        //     generateIntConstructBody();
        // } else if(Global.Constants.BOOL_TYPE.equals(cl.name)) {
        //     generateBoolConstructBody();
        // } else {
            for(AST.feature f : cl.features) {
                if(f instanceof AST.attr) {
                    AST.attr a = (AST.attr) f;
                    a.accept(this);
                }
            }
        // }

        Global.out.println(IRPrinter.INDENT+"ret void");
        Global.out.println("}");
        for(InheritanceGraph.Node child: node.getChildren()) {
            generateConstructorsDFS(child);
        }
    }

    private void generateStringConstructBody() {
        String gepRegister = IRPrinter.createClassAttrGEP(Global.Constants.STRING_TYPE, "%this", "val");
        String emptyStringReg = IRPrinter.createStringGEP("");
        Global.out.println(IRPrinter.INDENT + "store i8* "+ emptyStringReg +", i8** "+ gepRegister +", align 8");
    }

    private void generateIntConstructBody() {
        String gepRegister = IRPrinter.createClassAttrGEP(Global.Constants.INT_TYPE, "%this", "val");
        Global.out.println(IRPrinter.INDENT + "store i32 0, i32* "+ gepRegister +", align 4");
    }

    private void generateBoolConstructBody() {
        String gepRegister = IRPrinter.createClassAttrGEP(Global.Constants.BOOL_TYPE, "%this", "val");
        Global.out.println(IRPrinter.INDENT + "store i8 0, i8* "+ gepRegister +", align 4");
    }

    private void generateDefaultMethods() {
        /*
        // String set method
        Global.out.println("\n; Class: String, Method: set");
        Global.registerCounter = 0;
        Global.out.println("define void @" + Utils.getMangledName(Global.Constants.STRING_TYPE, "set") 
            + "(" + Utils.getStructName(Global.Constants.STRING_TYPE) + "* %this, i8* %s) {");
        Global.out.println("entry:");
        Global.out.println(IRPrinter.INDENT + "%0 = getelementptr inbounds %class.String, %class.String* %this, i32 0, i32 1");
        Global.out.println(IRPrinter.INDENT + "store i8* %s, i8** %0, align 8");
        Global.out.println(IRPrinter.INDENT + "ret void");
        Global.out.println("}");

        // String get method
        Global.out.println("\n; Class: String, Method: get");
        Global.registerCounter = 0;
        Global.out.println("define i8* @" + Utils.getMangledName(Global.Constants.STRING_TYPE, "get") 
            + "(" + Utils.getStructName(Global.Constants.STRING_TYPE) + "* %this) {");
        Global.out.println("entry:");
        Global.out.println(IRPrinter.INDENT + "%0 = getelementptr inbounds %class.String, %class.String* %this, i32 0, i32 1");
        Global.out.println(IRPrinter.INDENT + "%1 = load i8*, i8** %0, align 8");
        Global.out.println(IRPrinter.INDENT + "ret i8* %1");
        Global.out.println("}");

        // Int set method
        Global.out.println("\n; Class: Int, Method: set");
        Global.registerCounter = 0;
        Global.out.println("define void @" + Utils.getMangledName(Global.Constants.INT_TYPE, "set") 
            + "(" + Utils.getStructName(Global.Constants.INT_TYPE) + "* %this, i32 %s) {");
        Global.out.println("entry:");
        Global.out.println(IRPrinter.INDENT + "%0 = getelementptr inbounds %class.Int, %class.Int* %this, i32 0, i32 1");
        Global.out.println(IRPrinter.INDENT + "store i32 %s, i32* %0, align 8");
        Global.out.println(IRPrinter.INDENT + "ret void");
        Global.out.println("}");

        // Int get method
        Global.out.println("\n; Class: Int, Method: get");
        Global.registerCounter = 0;
        Global.out.println("define i32 @" + Utils.getMangledName(Global.Constants.INT_TYPE, "get") 
            + "(" + Utils.getStructName(Global.Constants.INT_TYPE) + "* %this) {");
        Global.out.println("entry:");
        Global.out.println(IRPrinter.INDENT + "%0 = getelementptr inbounds %class.Int, %class.Int* %this, i32 0, i32 1");
        Global.out.println(IRPrinter.INDENT + "%1 = load i32, i32* %0, align 8");
        Global.out.println(IRPrinter.INDENT + "ret i32 %1");
        Global.out.println("}");

        // Bool set method
        Global.out.println("\n; Class: Bool, Method: set");
        Global.registerCounter = 0;
        Global.out.println("define void @" + Utils.getMangledName(Global.Constants.BOOL_TYPE, "set") 
            + "(" + Utils.getStructName(Global.Constants.BOOL_TYPE) + "* %this, i8 %s) {");
        Global.out.println("entry:");
        Global.out.println(IRPrinter.INDENT + "%0 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1");
        Global.out.println(IRPrinter.INDENT + "store i8 %s, i8* %0, align 8");
        Global.out.println(IRPrinter.INDENT + "ret void");
        Global.out.println("}");

        // Bool get method
        Global.out.println("\n; Class: Bool, Method: get");
        Global.registerCounter = 0;
        Global.out.println("define i8 @" + Utils.getMangledName(Global.Constants.BOOL_TYPE, "get") 
            + "(" + Utils.getStructName(Global.Constants.BOOL_TYPE) + "* %this) {");
        Global.out.println("entry:");
        Global.out.println(IRPrinter.INDENT + "%0 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1");
        Global.out.println(IRPrinter.INDENT + "%1 = load i8, i8* %0, align 8");
        Global.out.println(IRPrinter.INDENT + "ret i8 %1");
        Global.out.println("}");
        */
        
        // malloc declaration - see https://groups.google.com/forum/#!topic/llvm-dev/QElg-R1CqNg
        Global.out.println("\n; C malloc declaration");
        Global.out.println("declare noalias i8* @malloc(i64)");
        
        // exit declaration for abort
        Global.out.println("\n; C exit declaration");
        Global.out.println("declare void @exit(i32)");

        // abort method of Object
        Global.out.println("\n; Class: Object, Method: abort");
        Global.out.println("define void @"+ Utils.getMangledName(Global.Constants.ROOT_TYPE, "abort") +"() {");
        Global.out.println(IRPrinter.INDENT+"call void @exit(i32 0)");
        Global.out.println(IRPrinter.INDENT+"ret void");
        Global.out.println("}");

        // main method of C
        Global.out.println("\n; C main() function");
        Global.out.println("define i32 @main() {");
        Global.out.println("entry:");
        Global.out.println(IRPrinter.INDENT+"%retval = alloca i32, align 4");
        Global.out.println(IRPrinter.INDENT+"%main = alloca %class.Main, align 8");
        // String 
        Global.out.println(IRPrinter.INDENT+"ret i32 0");
        Global.out.println("}");

    }

    private boolean isDefaultClass(String name) {
        return Global.Constants.IO_TYPE.equals(name) || Global.Constants.INT_TYPE.equals(name) 
        || Global.Constants.STRING_TYPE.equals(name) || Global.Constants.BOOL_TYPE.equals(name)
        || Global.Constants.ROOT_TYPE.equals(name);
    }

    public void visit(AST.program prog) {

        // preparing inheritance graph
        Global.inheritanceGraph = new InheritanceGraph();
        for(AST.class_ cl: prog.classes) {
            System.out.println(cl.name);
            Global.inheritanceGraph.addClass(cl);
        }

        Global.inheritanceGraph.update();
        
        printStringConstants();
        generateStructs();

        int memNeededByClass;

        for(AST.class_ cl : prog.classes) {
            memNeededByClass = 0;
            for(AST.feature f : cl.features) {
                if(f instanceof AST.attr) {
                    memNeededByClass += Utils.getAttrSize(((AST.attr)f).typeid);
                }
            }
            Global.classSizeMap.put(cl.name, memNeededByClass);
        }

        Global.classSizeMap.put("Int",4);
        Global.classSizeMap.put("Bool",1);
        Global.classSizeMap.put("String",8);
        Global.classSizeMap.put("Object",0);
        Global.classSizeMap.put("IO",0);

        // TODO - check above
        // TODO - what to do when user does new Int, etc.

        for(AST.class_ cl: prog.classes) {
            if(!isDefaultClass(cl.name))
                cl.accept(this);
        }

        generateConstructors();
        generateDefaultMethods();

    }

    public void visit(AST.class_ cl) {
        Global.currentClass = cl.name;

        for(AST.feature f : cl.features) {
            if(f instanceof AST.method) {
                ((AST.method) f).accept(this);
            }
        }
    }

    private void createCallForConstructor(String className, String reg) {
        StringBuilder builder = new StringBuilder(IRPrinter.INDENT);
        builder.append("call void @").append(Utils.getMangledName(className, className))
        .append("(").append(Utils.getStructName(className)).append("* ").append(reg).append(")");
        Global.out.println(builder.toString());
    }

    private void createCallForParentConstructor(String className, String childReg) {
        String parentType = Global.inheritanceGraph.getParentClassName(className);
        if(parentType!=null) {
            String bitcastRegister = IRPrinter.createConvertInst(childReg, Global.currentClass, 
                parentType, IRPrinter.BITCAST);
            createCallForConstructor(parentType, bitcastRegister);
        }
    }

    private String getRegisterForPrimitiveType(String type) {
        if(Global.Constants.INT_TYPE.equals(type)) {
            return "i32";
        } else if(Global.Constants.BOOL_TYPE.equals(type)) {
            return "i8";
        } else if(Global.Constants.STRING_TYPE.equals(type)) {
            return "i8*";
        } else {
            return null;
        }
    }

    public String getDefaultValue(String type) {
        if(Global.Constants.INT_TYPE.equals(type)) {
            return "0";
        } else if(Global.Constants.BOOL_TYPE.equals(type)) {
            return "0";
        } else if(Global.Constants.STRING_TYPE.equals(type)) {
            return IRPrinter.createStringGEP("");
        } else {
            return "undef";
        }
    }

    public void visit(AST.attr at) {
        // this is double pointer
        String gepRegister = IRPrinter.createClassAttrGEP(Global.currentClass, "%this", at.name);
        String valueRegister = at.value.accept(this);

        if(Utils.isPrimitiveType(at.typeid)) {
            // gep is single pointer
            // String mallocRegister = IRPrinter.createMallocInst(""+Global.classSizeMap.get(at.typeid));
            // String bitcastReg = IRPrinter.createConvertInst(mallocRegister, "i8*", 
            //                         at.typeid, IRPrinter.BITCAST);
            if(valueRegister==null) {
                // no assignment
                // createCallForConstructor(at.typeid, bitcastReg);
                IRPrinter.createStoreInst(getDefaultValue(at.typeid), gepRegister, Utils.getBasicType(at.typeid));
            } else {
                // call function
                // valueRegister = IRPrinter.createCallInst(getRegisterForPrimitiveType(at.typeid), 
                //     Utils.getMangledName(at.typeid,"get"), Utils.getStructName(at.typeid) + "* " + valueRegister);
                // StringBuilder argsBuilder = new StringBuilder();
                // argsBuilder.append(Utils.getStructName(at.typeid)).append("* ").append(bitcastReg)
                // .append(", ").append(getRegisterForPrimitiveType(at.value.type)).append(" ").append(valueRegister);
                
                // IRPrinter.createVoidCallInst("void", Utils.getMangledName(at.typeid, "set"), argsBuilder.toString());
                IRPrinter.createStoreInst(valueRegister, gepRegister, Utils.getBasicType(at.typeid));
            }
            // IRPrinter.createDoublePointerStoreInst(bitcastReg, gepRegister, at.typeid);
        } else {
            // gep is double pointer
            if(valueRegister==null) {
                // no assignment
                // IRPrinter.createStoreInst("undef", gepRegister, at.typeid);
                // TODO : store 0 in the register
                IRPrinter.createDoublePointerStoreInst("0", gepRegister, at.typeid);
            } else {
                // String mallocRegister = IRPrinter.createMallocInst(""+Global.classSizeMap.get(at.typeid));
                // String bitcastReg = IRPrinter.createConvertInst(mallocRegister, "i8*", 
                //                         at.typeid, IRPrinter.BITCAST);
                // if(at.typeid.equals(at.value.type)) {
                //     valueRegister = IRPrinter.createLoadInst(valueRegister, at.value.type);
                //     IRPrinter.createStoreInst(valueRegister, bitcastReg, at.typeid);
                // } else {
                //     // TODO : make sure bitcast is for pointer
                //     String convertedReg = IRPrinter.createConvertInst(valueRegister, at.value.type, at.typeid, IRPrinter.BITCAST);
                //     convertedReg = IRPrinter.createLoadInst(convertedReg, at.typeid);
                //     IRPrinter.createStoreInst(convertedReg, bitcastReg, at.typeid);
                // }
                if(!at.typeid.equals(at.value.type)) {
                    valueRegister = IRPrinter.createConvertInst(valueRegister, at.value.type, at.typeid, IRPrinter.BITCAST);
                }
                IRPrinter.createDoublePointerStoreInst(valueRegister, gepRegister, at.typeid);
            }
        }
    }

    public void visit(AST.method mthd) {
        Global.registerCounter = 0;
        if(Global.currentClass.equals("Main") && mthd.name.equals("main")) {
           mainReturnType = mthd.typeid;
        }
        Global.methodParams.clear();
        Global.out.println("\n; Class: "+Global.currentClass+", Method: "+mthd.name);
        Global.out.print("define " + getBasicTypeOrPointer(mthd.typeid) + " @" + 
            Utils.getMangledName(Global.currentClass, mthd.name) + "(");
        Global.out.print(Utils.getStructName(Global.currentClass)+"* %this");

        for(AST.formal fm: mthd.formals) {
            Global.out.print(", ");
            fm.accept(this);
        }

        Global.out.println(") {");
        IRPrinter.createLabel("entry");
        for(AST.formal fm: mthd.formals) {
            IRPrinter.createAlloca(getBasicTypeOrPointer(fm.typeid), fm.name+".addr");
            IRPrinter.createStoreInst("%"+fm.name, "%"+fm.name+".addr", getBasicTypeOrPointer(fm.typeid));
        }
        String returnReg = mthd.body.accept(this);
        if(!mthd.typeid.equals(mthd.body.type)) {
            returnReg = IRPrinter.createConvertInst(returnReg, mthd.body.type, 
                mthd.typeid, IRPrinter.BITCAST);
        }
        // String loadReturnReg = IRPrinter.createLoadInst(returnReg, mthd.typeid);
        Global.out.println(IRPrinter.INDENT + "ret " + getBasicTypeOrPointer(mthd.typeid) + " " + returnReg);
        Global.out.println("}");

    }

    public void visit(AST.formal fm) {
        Global.methodParams.add(fm.name);
        Global.out.print(getBasicTypeOrPointer(fm.typeid) + " %" + fm.name);
    }

}
