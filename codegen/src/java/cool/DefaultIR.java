package cool;

public class DefaultIR {

	public static void addDefaultStrings() {
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
        if(!Global.stringConstantToRegisterMap.containsKey(Global.Constants.ABORT_MESSAGE)) {
            Global.stringConstantToRegisterMap.put(Global.Constants.ABORT_MESSAGE, "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
        if(!Global.stringConstantToRegisterMap.containsKey(Global.Constants.ROOT_TYPE)) {
            Global.stringConstantToRegisterMap.put(Global.Constants.ROOT_TYPE, "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
        if(!Global.stringConstantToRegisterMap.containsKey(Global.Constants.IO_TYPE)) {
            Global.stringConstantToRegisterMap.put(Global.Constants.IO_TYPE, "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
        if(!Global.stringConstantToRegisterMap.containsKey(Global.Constants.STRING_TYPE)) {
            Global.stringConstantToRegisterMap.put(Global.Constants.STRING_TYPE, "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
        if(!Global.stringConstantToRegisterMap.containsKey(Global.Constants.INT_TYPE)) {
            Global.stringConstantToRegisterMap.put(Global.Constants.INT_TYPE, "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
        if(!Global.stringConstantToRegisterMap.containsKey(Global.Constants.BOOL_TYPE)) {
            Global.stringConstantToRegisterMap.put(Global.Constants.BOOL_TYPE, "@.str."+Global.stringRegisterCounter);
            Global.stringRegisterCounter++;
        }
	}
	
    private static void generateCDeclarations() {
        
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
        Global.out.println("\n; C strcpy declaration");
        Global.out.println("declare i8* @strcpy(i8*, i8*)");

        Global.out.println("\n; C strcat declaration");
        Global.out.println("declare i8* @strcat(i8*, i8*)");

        Global.out.println("\n; C strncpy declaration");
        Global.out.println("declare i8* @strncpy(i8*, i8*, i64)");        

    }

    private static void generateObjectMethods() {
        
        // abort method of Object
        Global.registerCounter = 0;
        Global.out.println("\n; Class: Object, Method: abort");
        Global.out.println("define "+Utils.getStructName(Global.Constants.ROOT_TYPE)+"* @"+ 
            Utils.getMangledName(Global.Constants.ROOT_TYPE, "abort") 
            +"("+Utils.getStructName(Global.Constants.ROOT_TYPE)+"* %this) {");
        Global.out.println("entry:");

        // Printing message for abort
        String typenameGEP = IRPrinter.createTypeNameGEP("%this");
        String loadNameReg = IRPrinter.createLoadInst(typenameGEP, "i8*");
        String arg1 = IRPrinter.createStringGEP("%s");
        String arg2 = IRPrinter.createStringGEP(Global.Constants.ABORT_MESSAGE);
        Global.out.println(IRPrinter.INDENT+"%"+Global.registerCounter+" = call i32 (i8*, ...) @printf(i8* "+arg1+", i8* "+arg2+")");
        Global.registerCounter++;
        Global.out.println(IRPrinter.INDENT+"%"+Global.registerCounter+" = call i32 (i8*, ...) @printf(i8* "+arg1+", i8* "+loadNameReg+")");
        Global.registerCounter++;
        arg2 = IRPrinter.createStringGEP("\n");
        Global.out.println(IRPrinter.INDENT+"%"+Global.registerCounter+" = call i32 (i8*, ...) @printf(i8* "+arg1+", i8* "+arg2+")");
        Global.registerCounter++;

        // calling exit
        Global.out.println(IRPrinter.INDENT+"call void @exit(i32 0)");
        
        // creating dummy Object for return
        String bytesToAllocate = ""+Global.classSizeMap.get(Global.Constants.ROOT_TYPE);
        String storeRegisterForCall = IRPrinter.createMallocInst(bytesToAllocate);
        String returnValue = IRPrinter.createConvertInst(storeRegisterForCall, "i8*", 
                                        Global.Constants.ROOT_TYPE, IRPrinter.BITCAST);
        IRPrinter.createVoidCallInst(Utils.getMangledName(Global.Constants.ROOT_TYPE, Global.Constants.ROOT_TYPE), 
                                Utils.getStructName(Global.Constants.ROOT_TYPE)+ "* " + returnValue);
        Global.out.println(IRPrinter.INDENT+"ret "+Utils.getStructName(Global.Constants.ROOT_TYPE)+"* "+returnValue);
        Global.out.println("}");


        // type_name method of Object
        Global.registerCounter = 0;
        Global.out.println("\n; Class: Object, Method: type_name");
        Global.out.println("define i8* @"+ 
            Utils.getMangledName(Global.Constants.ROOT_TYPE, "type_name") 
            +"("+Utils.getStructName(Global.Constants.ROOT_TYPE)+"* %this) {");
        Global.out.println("entry:");
        typenameGEP = IRPrinter.createTypeNameGEP("%this");
        String loadReg = IRPrinter.createLoadInst(typenameGEP, "i8*");
        Global.out.println(IRPrinter.INDENT+"ret i8* "+loadReg);
        Global.out.println("}");


    }

    private static void generateIOMethods() {
        
        // out_string method of IO
        Global.registerCounter = 0;
        Global.out.println("\n; Class: IO, Method: out_string");
        Global.out.println("define "+Utils.getStructName(Global.Constants.IO_TYPE)+"* @"+ 
            Utils.getMangledName(Global.Constants.IO_TYPE, "out_string") +"("+Utils.getStructName(Global.Constants.IO_TYPE)+"* %this, i8* %s) {");
        Global.out.println("entry:");
        String arg1 = IRPrinter.createStringGEP("%s");
        Global.out.println(IRPrinter.INDENT+"%call = call i32 (i8*, ...) @printf(i8* "+arg1+", i8* %s)");
        String bytesToAllocate = ""+Global.classSizeMap.get(Global.Constants.IO_TYPE);
        String storeRegisterForCall = IRPrinter.createMallocInst(bytesToAllocate);
        String returnValue = IRPrinter.createConvertInst(storeRegisterForCall, "i8*", 
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
        arg1 = IRPrinter.createStringGEP("%d");
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

    }

    private static void generateStringMethods() {
        
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

        // substr method of String
        Global.registerCounter = 0;
        Global.out.println("\n; Class: String, Method: substr");
        Global.out.println("define i8* @"+ 
            Utils.getMangledName(Global.Constants.STRING_TYPE, "substr") +"(i8* %s1, i32 %index, i32 %len) {");
        Global.out.println("entry:");
    //    String destPtr = IRPrinter.createAlloca("String");
        // String lenPtr = IRPrinter.createAlloca("Int");
      //  IRPrinter.createStoreInst("%len", lenPtr, "i32");
      //  String loadLen = IRPrinter.createLoadInst(lenPtr, "i32");
        String convert = IRPrinter.createConvertInst("%len", "i32", "i64", IRPrinter.ZEXT);
        String mallocInst = IRPrinter.createMallocInst(convert);
        // String lenS1 = IRPrinter.createCallInst("i64", "strlen", "i8* %s1");
        String gepRegister = "%"+Global.registerCounter;
        Global.registerCounter++;
        StringBuilder builder = new StringBuilder(IRPrinter.INDENT);
        builder.append(gepRegister).append(" = ").append("getelementptr inbounds ");
        builder.append("i8, i8* %s1, i32 %index");
        Global.out.println(builder.toString());
        String callCopy = IRPrinter.createCallInst(Global.Constants.STRING_TYPE, "strncpy", "i8* "
                +mallocInst+", i8* "+gepRegister+", i64 "+convert);
    //    IRPrinter.createStoreInst(mallocInst, destPtr, "i8*");
        Global.out.println(IRPrinter.INDENT+"ret i8* "+mallocInst);
        Global.out.println("}");

    }

    private static void generateCMainMethod() {

        // main method of C
        Global.registerCounter = 0;
        Global.out.println("\n; C main() function");
        Global.out.println("define i32 @main() {");
        Global.out.println("entry:");
        Global.out.println(IRPrinter.INDENT+"%main = alloca %class.Main, align 8");
        Global.out.println(IRPrinter.INDENT+"call void @"+Utils.getMangledName("Main","Main")+"(%class.Main* %main)");
        if(Global.Constants.INT_TYPE.equals(Global.mainReturnType)) {
            Global.out.println(IRPrinter.INDENT+"%retval = call i32 @"+Utils.getMangledName("Main","main")+"(%class.Main* %main)");
            Global.out.println(IRPrinter.INDENT+"ret i32 %retval");
        } else {
            Global.out.println(IRPrinter.INDENT+"%dummyretval = call "+Utils.getBasicTypeOrPointer(Global.mainReturnType)+" @"+Utils.getMangledName("Main","main")+"(%class.Main* %main)");
            Global.out.println(IRPrinter.INDENT+"ret i32 0");
        }
        Global.out.println("}");

    }

    private static void generateOtherMethods() {

        // to print divide by 0 error
        Global.registerCounter = 0;
        Global.out.println("define void @"+Global.Constants.DIVIDE_BY_ZERO_FUNCTION+"(i32 %lineNo) {");
        Global.out.println("entry:");
        String arg1 = IRPrinter.createStringGEP("%s");
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

    }

    public static void generateDefaultMethods() {
    	generateCDeclarations();
    	generateObjectMethods();
    	generateIOMethods();
    	generateStringMethods();
    	generateOtherMethods();
    	generateCMainMethod();
    }

}