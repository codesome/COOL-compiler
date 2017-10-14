package cool;

import java.lang.StringBuilder;
import java.util.Map;
import java.util.HashMap;

class VisitorImpl extends ExpressionVisitorImpl {
    /* NOTE: to know about the individual visit functions
             Check Visitor.java 
    */

    private String mainReturnType;

    private void printStringConstants() {
        StringBuilder structBuilder = new StringBuilder();
        if(!Global.stringConstantToRegisterMap.containsKey("")) {
            Global.stringConstantToRegisterMap.put("", "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
        if(!Global.stringConstantToRegisterMap.containsKey("\n")) {
            Global.stringConstantToRegisterMap.put("\n", "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
        if(!Global.stringConstantToRegisterMap.containsKey("%s")) {
            Global.stringConstantToRegisterMap.put("%s", "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
        if(!Global.stringConstantToRegisterMap.containsKey("%1024[^\n]")) {
            Global.stringConstantToRegisterMap.put("%1024[^\n]", "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
        if(!Global.stringConstantToRegisterMap.containsKey("%d")) {
            Global.stringConstantToRegisterMap.put("%d", "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
        if(!Global.stringConstantToRegisterMap.containsKey("%d\n")) {
            Global.stringConstantToRegisterMap.put("%d\n", "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
        if(!Global.stringConstantToRegisterMap.containsKey(Global.Constants.DIVIDE_BY_ZERO_ERROR)) {
            Global.stringConstantToRegisterMap.put(Global.Constants.DIVIDE_BY_ZERO_ERROR, "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
        if(!Global.stringConstantToRegisterMap.containsKey(Global.Constants.VOID_CALL_ERROR)) {
            Global.stringConstantToRegisterMap.put(Global.Constants.VOID_CALL_ERROR, "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
        for(Map.Entry<String,String> entry: Global.stringConstantToRegisterMap.entrySet()) {
            structBuilder.setLength(0);
            structBuilder.append(entry.getValue()).append(" = private unnamed_addr constant [")
            .append(entry.getKey().length()+1).append(" x i8] c\"").append(entry.getKey()).append("\\00\", align 1");
            Global.out.println(structBuilder.toString());
        }
    }

    private void generateStructsAndCalculateSize() {
        Global.out.println();
        InheritanceGraph.Node rootNode = Global.inheritanceGraph.getRootNode();
        Global.out.println(Utils.getStructName(Global.Constants.ROOT_TYPE) + " = type {}");
        Global.classToVariableToIndexListMap.put(Global.Constants.ROOT_TYPE, new HashMap<>());

        for(InheritanceGraph.Node child: rootNode.getChildren()) {
            generateStructsAndCalculateSizeDFS(child);
        }
        // Global.out.println("%class.Int = type { %class.Object, i32 }");
        // Global.out.println("%class.String = type { %class.Object, i8* }");
        // Global.out.println("%class.Bool = type { %class.Object, i8 }");
        Global.out.println();
    }

    private void generateStructsAndCalculateSizeDFS(InheritanceGraph.Node node) {
        AST.class_ cl = node.getAstClass();
        int size = 0;
        
        if(Utils.isPrimitiveType(cl.name)) 
            return;
        
        StringBuilder builder = new StringBuilder(Utils.getStructName(cl.name));
        size += Global.classSizeMap.get(node.getParent().getAstClass().name);
        builder.append(" = type { ").append(Utils.getStructName(node.getParent().getAstClass().name));
        
        Map<String, String> variableToIndexListMap = new HashMap<>();
        Map<String, String> parentMap = Global.classToVariableToIndexListMap.get(node.getParent().getAstClass().name);
        for(Map.Entry<String, String> entry : parentMap.entrySet()) {
            variableToIndexListMap.put(entry.getKey(), " i32 0,"+entry.getValue());
        }


        int index = 0;
        for(AST.feature f : cl.features) {
            if(f instanceof AST.attr) {
                index++;
                AST.attr a = (AST.attr) f;
                size += Utils.getSizeForStruct(a.typeid);
                builder.append(", ").append(Utils.getBasicTypeOrPointer(a.typeid));
                variableToIndexListMap.put(a.name, " i32 0, i32 "+index);
            }
        }

        builder.append(" }");
        Global.out.println(builder.toString());

        Global.classToVariableToIndexListMap.put(cl.name, variableToIndexListMap);
        Global.classSizeMap.put(cl.name, size);
        
        for(InheritanceGraph.Node child: node.getChildren()) {
            generateStructsAndCalculateSizeDFS(child);
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
        // malloc declaration - see https://groups.google.com/forum/#!topic/llvm-dev/QElg-R1CqNg
        Global.out.println("\n; C malloc declaration");
        Global.out.println("declare noalias i8* @malloc(i64)");
        
        // exit declaration for abort
        Global.out.println("\n; C exit declaration");
        Global.out.println("declare void @exit(i32)");
        
        // printf declaration for out_string and out_int
        Global.out.println("\n; C printf declaration");
        Global.out.println("declare i32 @printf(i8*, ...)");

        // scanf declaration for in_string and in_int
        Global.out.println("\n; C scanf declaration");
        Global.out.println("declare i32 @scanf(i8*, ...)");

        // strlen declaration for length
        Global.out.println("\n; C strlen declaration");
        Global.out.println("declare i64 @strlen(i8*)");

        // for concat
        Global.out.println("\n; C strlen declaration");
        Global.out.println("declare i8* @strcpy(i8*, i8*)");

        Global.out.println("\n; C strlen declaration");
        Global.out.println("declare i8* @strcat(i8*, i8*)");

        // abort method of Object
        Global.registerCounter = 0;
        Global.out.println("\n; Class: Object, Method: abort");
        Global.out.println("define "+Utils.getStructName(Global.Constants.ROOT_TYPE)+"* @"+ 
            Utils.getMangledName(Global.Constants.ROOT_TYPE, "abort") +"() {");
        Global.out.println("entry:");
        Global.out.println(IRPrinter.INDENT+"call void @exit(i32 0)");
        String bytesToAllocate = ""+Global.classSizeMap.get(Global.Constants.ROOT_TYPE);
        String storeRegisterForCall = IRPrinter.createMallocInst(bytesToAllocate);
        String returnValue = IRPrinter.createConvertInst(storeRegisterForCall, "i8*", 
                                        Global.Constants.ROOT_TYPE, IRPrinter.BITCAST);
        IRPrinter.createVoidCallInst(Utils.getMangledName(Global.Constants.ROOT_TYPE, Global.Constants.ROOT_TYPE), 
                                Utils.getStructName(Global.Constants.ROOT_TYPE)+ "* " + returnValue);
        Global.out.println(IRPrinter.INDENT+"ret "+Utils.getStructName(Global.Constants.ROOT_TYPE)+"* "+returnValue);
        Global.out.println("}");

        // out_string method of IO
        Global.registerCounter = 0;
        Global.out.println("\n; Class: IO, Method: out_string");
        Global.out.println("define "+Utils.getStructName(Global.Constants.IO_TYPE)+"* @"+ 
            Utils.getMangledName(Global.Constants.IO_TYPE, "out_string") +"("+Utils.getStructName(Global.Constants.IO_TYPE)+"* %this, i8* %s) {");
        Global.out.println("entry:");
        String arg1 = IRPrinter.createStringGEP("%s");
        Global.out.println(IRPrinter.INDENT+"%call = call i32 (i8*, ...) @printf(i8* "+arg1+", i8* %s)");
        bytesToAllocate = ""+Global.classSizeMap.get(Global.Constants.IO_TYPE);
        storeRegisterForCall = IRPrinter.createMallocInst(bytesToAllocate);
        returnValue = IRPrinter.createConvertInst(storeRegisterForCall, "i8*", 
                                        Global.Constants.IO_TYPE, IRPrinter.BITCAST);
        IRPrinter.createVoidCallInst(Utils.getMangledName(Global.Constants.IO_TYPE, Global.Constants.IO_TYPE), 
                                Utils.getStructName(Global.Constants.IO_TYPE)+ "* " + returnValue);
        Global.out.println(IRPrinter.INDENT+"ret "+Utils.getStructName(Global.Constants.IO_TYPE)+"* "+returnValue);
        Global.out.println("}");

        // out_int method of IO
        Global.registerCounter = 0;
        Global.out.println("\n; Class: IO, Method: out_int");
        Global.out.println("define "+Utils.getStructName(Global.Constants.IO_TYPE)+"* @"+ 
            Utils.getMangledName(Global.Constants.IO_TYPE, "out_int") +"("+Utils.getStructName(Global.Constants.IO_TYPE)+"* %this, i32 %d) {");
        Global.out.println("entry:");
        arg1 = IRPrinter.createStringGEP("%d");
        Global.out.println(IRPrinter.INDENT+"%call = call i32 (i8*, ...) @printf(i8* "+arg1+", i32 %d)");
        bytesToAllocate = ""+Global.classSizeMap.get(Global.Constants.IO_TYPE);
        storeRegisterForCall = IRPrinter.createMallocInst(bytesToAllocate);
        returnValue = IRPrinter.createConvertInst(storeRegisterForCall, "i8*", 
                                        Global.Constants.IO_TYPE, IRPrinter.BITCAST);
        IRPrinter.createVoidCallInst(Utils.getMangledName(Global.Constants.IO_TYPE, Global.Constants.IO_TYPE), 
                                Utils.getStructName(Global.Constants.IO_TYPE)+ "* " + returnValue);
        Global.out.println(IRPrinter.INDENT+"ret "+Utils.getStructName(Global.Constants.IO_TYPE)+"* "+returnValue);
        Global.out.println("}");

        // in_int method of IO
        Global.registerCounter = 0;
        Global.out.println("\n; Class: IO, Method: in_int");
        Global.out.println("define i32 @"+ 
            Utils.getMangledName(Global.Constants.IO_TYPE, "in_int") +"("+Utils.getStructName(Global.Constants.IO_TYPE)+"* %this) {");
        Global.out.println("entry:");
        String allocaReg = IRPrinter.createAlloca(Global.Constants.INT_TYPE);
        arg1 = IRPrinter.createStringGEP("%d\n");
        Global.out.println(IRPrinter.INDENT+"%call = call i32 (i8*, ...) @scanf(i8* "+arg1+", i32* "+allocaReg+")");
        returnValue = IRPrinter.createLoadInst(allocaReg, "i32");
        Global.out.println(IRPrinter.INDENT+"ret i32 "+returnValue);
        Global.out.println("}");

        // in_string method of IO
        Global.registerCounter = 0;
        Global.out.println("\n; Class: IO, Method: in_string");
        Global.out.println("define i8* @"+ 
            Utils.getMangledName(Global.Constants.IO_TYPE, "in_string") +"("+Utils.getStructName(Global.Constants.IO_TYPE)+"* %this) {");
        Global.out.println("entry:");
        allocaReg = IRPrinter.createAlloca(Global.Constants.STRING_TYPE);
        arg1 = IRPrinter.createStringGEP("%1024[^\n]");
        String loadVal = IRPrinter.createLoadInst(allocaReg, "i8*");
        Global.out.println(IRPrinter.INDENT+"%call = call i32 (i8*, ...) @scanf(i8* "+arg1+", i8* "+loadVal+")");
        returnValue = IRPrinter.createLoadInst(allocaReg, "i8*");
        Global.out.println(IRPrinter.INDENT+"ret i8* "+returnValue);
        Global.out.println("}");

        // concat method of String
        Global.registerCounter = 0;
        Global.out.println("\n; Class: String, Method: concat");
        Global.out.println("define i8* @"+ 
            Utils.getMangledName(Global.Constants.STRING_TYPE, "concat") +"(i8* %s1, i8* %s2) {");
        Global.out.println("entry:");
        String lenS1 = IRPrinter.createCallInst("i64", "strlen", "i8* %s1");
        String lenS2 = IRPrinter.createCallInst("i64", "strlen", "i8* %s2");
        String addReg = IRPrinter.createBinaryInst(IRPrinter.ADD, lenS1, lenS2, "i64", false, true);
        addReg = IRPrinter.createBinaryInst(IRPrinter.ADD, addReg, "1", "i64", false, true);
        String newStringReg = IRPrinter.createMallocInst(addReg);
        IRPrinter.createCallInst(Global.Constants.STRING_TYPE, "strcpy", "i8* "+newStringReg+", i8* %s1");
        IRPrinter.createCallInst(Global.Constants.STRING_TYPE, "strcat", "i8* "+newStringReg+", i8* %s2");
        Global.out.println(IRPrinter.INDENT+"ret i8* "+newStringReg);
        Global.out.println("}");

        // to print divide by 0 error
        Global.registerCounter = 0;
        Global.out.println("define void @"+Global.Constants.DIVIDE_BY_ZERO_FUNCTION+"(i32 %lineNo) {");
        Global.out.println("entry:");
        arg1 = IRPrinter.createStringGEP("%s");
        String arg2 = IRPrinter.createStringGEP(Global.Constants.DIVIDE_BY_ZERO_ERROR);
        Global.out.println(IRPrinter.INDENT+"%"+Global.registerCounter+" = call i32 (i8*, ...) @printf(i8* "+arg1+", i8* "+arg2+")");
        Global.registerCounter++;
        String arg1d = IRPrinter.createStringGEP("%d");
        Global.out.println(IRPrinter.INDENT+"%"+Global.registerCounter+" = call i32 (i8*, ...) @printf(i8* "+arg1d+", i32 %lineNo)");
        Global.registerCounter++;
        arg2 = IRPrinter.createStringGEP("\n");
        Global.out.println(IRPrinter.INDENT+"%"+Global.registerCounter+" = call i32 (i8*, ...) @printf(i8* "+arg1+", i8* "+arg2+")");
        Global.registerCounter++;
        Global.out.println(IRPrinter.INDENT+"ret void");
        Global.out.println("}");

        // to print dispatch on void error
        Global.registerCounter = 0;
        Global.out.println("define void @"+Global.Constants.VOID_CALL_FUNCTION+"(i32 %lineNo) {");
        Global.out.println("entry:");
        arg1 = IRPrinter.createStringGEP("%s");
        arg2 = IRPrinter.createStringGEP(Global.Constants.VOID_CALL_ERROR);
        Global.out.println(IRPrinter.INDENT+"%"+Global.registerCounter+" = call i32 (i8*, ...) @printf(i8* "+arg1+", i8* "+arg2+")");
        Global.registerCounter++;
        arg1d = IRPrinter.createStringGEP("%d");
        Global.out.println(IRPrinter.INDENT+"%"+Global.registerCounter+" = call i32 (i8*, ...) @printf(i8* "+arg1d+", i32 %lineNo)");
        Global.registerCounter++;
        arg2 = IRPrinter.createStringGEP("\n");
        Global.out.println(IRPrinter.INDENT+"%"+Global.registerCounter+" = call i32 (i8*, ...) @printf(i8* "+arg1+", i8* "+arg2+")");
        Global.registerCounter++;
        Global.out.println(IRPrinter.INDENT+"ret void");
        Global.out.println("}");

        // main method of C
        Global.registerCounter = 0;
        Global.out.println("\n; C main() function");
        Global.out.println("define i32 @main() {");
        Global.out.println("entry:");
        Global.out.println(IRPrinter.INDENT+"%main = alloca %class.Main, align 8");
        Global.out.println(IRPrinter.INDENT+"call void @"+Utils.getMangledName("Main","Main")+"(%class.Main* %main)");
        if(Global.Constants.INT_TYPE.equals(mainReturnType)) {
            Global.out.println(IRPrinter.INDENT+"%retval = call i32 @"+Utils.getMangledName("Main","main")+"(%class.Main* %main)");
            Global.out.println(IRPrinter.INDENT+"ret i32 %retval");
        } else {
            Global.out.println(IRPrinter.INDENT+"%dummyretval = call "+Utils.getBasicTypeOrPointer(mainReturnType)+" @"+Utils.getMangledName("Main","main")+"(%class.Main* %main)");
            Global.out.println(IRPrinter.INDENT+"ret i32 0");
        }
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
            if(!Global.stringConstantToRegisterMap.containsKey(cl.name)) {
                Global.stringConstantToRegisterMap.put(cl.name, "@.str."+Global.stringRegisterCounter);
                Global.stringRegisterCounter++;
            }
            Global.inheritanceGraph.addClass(cl);
        }

        Global.inheritanceGraph.update();
        
        Global.classSizeMap.put("Int",4);
        Global.classSizeMap.put("Bool",1);
        Global.classSizeMap.put("String",8);
        Global.classSizeMap.put("Object",0);
        Global.classSizeMap.put("IO",0);
        
        printStringConstants();
        generateStructsAndCalculateSize();

        // TODO - check above
        // TODO - what to do when user does new Int, etc.

        Global.functionMangledNames.add(Utils.getMangledName("Object", "type_name"));
        Global.functionMangledNames.add(Utils.getMangledName("Object", "abort"));
        Global.functionMangledNames.add(Utils.getMangledName("Object", "copy"));
        Global.functionMangledNames.add(Utils.getMangledName("IO", "out_int"));
        Global.functionMangledNames.add(Utils.getMangledName("IO", "out_string"));
        Global.functionMangledNames.add(Utils.getMangledName("IO", "in_int"));
        Global.functionMangledNames.add(Utils.getMangledName("IO", "in_string"));
        Global.functionMangledNames.add(Utils.getMangledName("String", "length"));
        Global.functionMangledNames.add(Utils.getMangledName("String", "concat"));
        Global.functionMangledNames.add(Utils.getMangledName("String", "substr"));

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
                
                // IRPrinter.createVoidCallInst(Utils.getMangledName(at.typeid, "set"), argsBuilder.toString());
                IRPrinter.createStoreInst(valueRegister, gepRegister, Utils.getBasicType(at.typeid));
            }
            // IRPrinter.createDoublePointerStoreInst(bitcastReg, gepRegister, at.typeid);
        } else {
            // gep is double pointer
            if(valueRegister==null) {
                // no assignment
                // IRPrinter.createStoreInst("undef", gepRegister, at.typeid);
                // TODO : store 0 in the register
                IRPrinter.createDoublePointerStoreInst("null", gepRegister, at.typeid);
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
        Global.functionMangledNames.add(Utils.getMangledName(Global.currentClass, mthd.name));
        Global.registerCounter = 0;
        if(Global.currentClass.equals("Main") && mthd.name.equals("main")) {
           mainReturnType = mthd.typeid;
        }
        Global.methodParams.clear();
        Global.out.println("\n; Class: "+Global.currentClass+", Method: "+mthd.name);
        Global.out.print("define " + Utils.getBasicTypeOrPointer(mthd.typeid) + " @" + 
            Utils.getMangledName(Global.currentClass, mthd.name) + "(");
        Global.out.print(Utils.getStructName(Global.currentClass)+"* %this");

        for(AST.formal fm: mthd.formals) {
            Global.out.print(", ");
            fm.accept(this);
        }

        Global.out.println(") {");
        IRPrinter.createLabel("entry");
        for(AST.formal fm: mthd.formals) {
            IRPrinter.createAlloca(Utils.getBasicTypeOrPointer(fm.typeid), fm.name+".addr");
            IRPrinter.createStoreInst("%"+fm.name, "%"+fm.name+".addr", Utils.getBasicTypeOrPointer(fm.typeid));
        }
        String returnReg = mthd.body.accept(this);
        if(!mthd.typeid.equals(mthd.body.type)) {
            returnReg = IRPrinter.createConvertInst(returnReg, mthd.body.type, 
                mthd.typeid, IRPrinter.BITCAST);
        }
        // String loadReturnReg = IRPrinter.createLoadInst(returnReg, mthd.typeid);
        Global.out.println(IRPrinter.INDENT + "ret " + Utils.getBasicTypeOrPointer(mthd.typeid) + " " + returnReg);
        Global.out.println("}");

    }

    public void visit(AST.formal fm) {
        Global.methodParams.add(fm.name);
        Global.out.print(Utils.getBasicTypeOrPointer(fm.typeid) + " %" + fm.name);
    }

}
