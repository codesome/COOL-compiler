package cool;

abstract class ExpressionVisitorImpl implements Visitor {
    /* NOTE: to know about the individual visit functions
             Check Visitor.java 
    */

    private boolean isPrimitiveType(String type) {
        return Global.Constants.STRING_TYPE.equals(type)
                || Global.Constants.INT_TYPE.equals(type)
                || Global.Constants.BOOL_TYPE.equals(type);
    }

    public String visit(AST.no_expr expr) {
        return null;
    }

    public String visit(AST.assign expr) {
        // TODO it is already assumed that its a pointer, verify
        String retVal = expr.e1.accept(this);
        String castVal = retVal;
        String storeID;
        if(!expr.type.equals(expr.e1.type)) {
            // TODO: check if bitcast is for pointers
            castVal = IRPrinter.createConvertInst(retVal, expr.e1.type, expr.type, IRPrinter.BITCAST);
        }
        if(Global.methodParams.contains(expr.name)) {
            storeID = "%" + expr.name + ".addr";
        } else {
            storeID = IRPrinter.createClassAttrGEP(Global.currentClass, "%this", expr.name);
        }
        if(isPrimitiveType(expr.type)) {
            // getting value using get from castVal
            StringBuilder argsBuilder = new StringBuilder();
            argsBuilder.append(Utils.getStructName(expr.type)).append("* ").append(castVal);

            String getVal = IRPrinter.createCallInst(Utils.getBasicType(expr.type),
                        Utils.getMangledName(expr.type,"get"),argsBuilder.toString());

            // using set to store castVal to storeID
            argsBuilder.setLength(0);
            argsBuilder.append(Utils.getStructName(expr.type)).append("* ").append(storeID)
            .append(", ").append(Utils.getBasicType(expr.type)).append(" ").append(getVal);
            
            IRPrinter.createVoidCallInst("void", Utils.getMangledName(expr.type, "set"), argsBuilder.toString());
        } else {
            // Load castVal
            IRPrinter.createStoreInst(castVal, storeID, expr.type);
        }
        return retVal; // TODO - check this
    /*    if(Global.methodParams.contains(expr.name)) {
            if(!expr.type.equals(expr.e1.type)) {
                if(isPrimitiveType(expr.e1.type)) {
                    castVal = IRPrinter.createConvertInst(retVal, Utils.getBasicType(expr.e1.type), 
                                                        expr.type, IRPrinter.BITCAST);
                } else {
                    castVal = IRPrinter.createConvertInst(retVal, expr.e1.type, expr.type, IRPrinter.BITCAST);
                }
            }
            IRPrinter.createStoreInst(castVal, expr.name, expr.type);
        }
        if(!expr.e1.type.equals(expr.type)) {
            castVal = IRPrinter.createConvertInst(retVal, expr.e1.type, expr.type, IRPrinter.BITCAST);
        }
        if(isPrimitiveType(expr.type)) {
            String objectPointer = IRPrinter.createClassAttrGEP(expr.type,"%this",expr.name);
            String args = Utils.convertTypeWithPtr(expr.type) + " " 
                        + objectPointer + ", " + Utils.getBasicTypePtr(expr.type) + " " + castVal;
            IRPrinter.createVoidCallInst(expr.type, Utils.getMangledName(expr.name,"set"), args);
        }
        else {
            IRPrinter.createStoreInst(castVal, expr.name, expr.type);  
        }
        return castVal; */
    }

    public String visit(AST.static_dispatch expr) {
        // TODO FIXEME : pointer to caller should be the first argument in dispatch
        // TODO : bitcast when calling function of parent class
        String caller = expr.caller.accept(this);

        if(!expr.typeid.equals(expr.caller.type)) {
            // TODO : check if the cast is for pointers
            caller = IRPrinter.createConvertInst(caller, expr.caller.type, expr.typeid, IRPrinter.BITCAST);
        }

        StringBuilder builder = new StringBuilder();
        builder.append(Utils.getStructName(expr.typeid)).append("* ").append(caller);
        for(AST.expression argument : expr.actuals) {
            builder.append(", ");
            builder.append(Utils.getStructName(argument.type));
            builder.append(" ");
            String pointerReg = argument.accept(this);
            String loadReg = IRPrinter.createLoadInst(pointerReg, argument.type);
            builder.append(loadReg);
        }
        // TODO : check what to return from the function, pointer or value?
        String returnValue = IRPrinter.createCallInst(expr.type, Utils.getMangledName(expr.typeid, 
                            expr.name), builder.toString());
        return returnValue;
    }

    public String visit(AST.cond expr) { // incomplete TODO: what is incomplete?
        String ifThenLabel = IRPrinter.getLabel("if.then",false);
        String ifElseLabel = IRPrinter.getLabel("if.else",false);
        String ifEndLabel = IRPrinter.getLabel("if.end",false);
        
        // it will be Bool class, get i8 from it
        String cmpInst = expr.predicate.accept(this);
        String cmpVal = IRPrinter.createCallInst("i8", Utils.getMangledName(Global.Constants.BOOL_TYPE,"get"),
            Utils.getStructName(Global.Constants.BOOL_TYPE) + "* " + cmpInst);
        
        String truncVar = IRPrinter.createConvertInst(cmpVal,"i8","i1",IRPrinter.TRUNC);
        IRPrinter.createCondBreak(truncVar, ifThenLabel, ifElseLabel);
        
        // TODO : should we bitcast to join of the return types?
        IRPrinter.createLabel(ifThenLabel);
        String ifBody = expr.ifbody.accept(this);
        IRPrinter.createBreakInst(ifEndLabel);
        
        IRPrinter.createLabel(ifElseLabel);
        String ifElse = expr.elsebody.accept(this);
        
        IRPrinter.createBreakInst(ifEndLabel);
        IRPrinter.createLabel(ifEndLabel);
        
        String returnValue = IRPrinter.createPHINode(expr.type, ifBody, ifThenLabel, ifElse, ifElseLabel);
        return returnValue;
    }

    public String visit(AST.loop expr) { // incomplete
        String whileCondLabel = IRPrinter.getLabel("while.cond",false);
        String whileBodyLabel = IRPrinter.getLabel("while.body",false);
        String whileEndLabel = IRPrinter.getLabel("while.end",false);
        IRPrinter.createBreakInst(whileCondLabel);

        IRPrinter.createLabel(whileCondLabel);

        // it will be Bool class, get i8 from it
        String whilePredicate = expr.predicate.accept(this);
        String whilePredicateVal = IRPrinter.createCallInst("i8", Utils.getMangledName(Global.Constants.BOOL_TYPE,"get"),
            Utils.getStructName(Global.Constants.BOOL_TYPE) + "* " + whilePredicate);

        String truncVar = IRPrinter.createConvertInst(whilePredicateVal,"i8","i1",IRPrinter.TRUNC);
        IRPrinter.createCondBreak(truncVar,whileBodyLabel,whileEndLabel);

        IRPrinter.createLabel(whileBodyLabel);
        String whileBody = expr.body.accept(this);
        IRPrinter.createBreakInst(whileCondLabel);

        IRPrinter.createLabel(whileEndLabel);
        String voidReturn = IRPrinter.createLoadInst(IRPrinter.UNDEF, "Object");
        return voidReturn;
    }

    public String visit(AST.block expr) {
        String returnValue = null;
        for(AST.expression exprInBlock : expr.l1) {
            returnValue = exprInBlock.accept(this);
        }
        return returnValue;
    }   

    public String visit(AST.new_ expr) {
        // TODO - expr.type or expr.typeid?
    //    String storeRegisterForCall = IRPrinter.createCallInst(Global.Constants.PTR_TYPE, 
    //                                Utils.getMangledName(expr.type, expr.type), ""); // INCOMPLETE
        String storeRegisterForCall = IRPrinter.createMallocInst("32"); // TODO - set the correct size, malloc or alloc?
        String returnValue = IRPrinter.createConvertInst(storeRegisterForCall, "i8*", 
                                        expr.typeid, IRPrinter.BITCAST);
        IRPrinter.createVoidCallInst("void", Utils.getMangledName(expr.typeid, expr.typeid), 
                                Utils.getStructName(expr.typeid)+ "* " + returnValue);
        return returnValue;
    }

    // TODO : fix all binary operations
    public String visit(AST.isvoid expr) {
        String op = expr.e1.accept(this);
        // TODO - is this correct?
        return IRPrinter.createBinaryInst(IRPrinter.EQ, op, IRPrinter.UNDEF, expr.type, false, false);
    }

    public String visit(AST.plus expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        String get1 = IRPrinter.createCallInst("i32", Utils.getMangledName(expr.e1.type,"get"),
                    Utils.getStructName(expr.e1.type)+"* "+op1);
        String get2 = IRPrinter.createCallInst("i32", Utils.getMangledName(expr.e2.type,"get"),
                    Utils.getStructName(expr.e2.type)+"* "+op2);
        String resultBasic =  IRPrinter.createBinaryInst(IRPrinter.ADD, get1, get2, expr.type, false, true); // TODO - set flags correctly
        String resultMem = IRPrinter.createAlloca(expr.type);
        StringBuilder argBuilder = new StringBuilder();
        argBuilder.append(Utils.getStructName(expr.type)+"* "+resultMem);
        argBuilder.append(", ").append("i32 "+resultBasic);
        IRPrinter.createVoidCallInst("void", Utils.getMangledName(expr.type,"set"),argBuilder.toString());
        return resultMem;
    }

    public String visit(AST.sub expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        String get1 = IRPrinter.createCallInst("i32", Utils.getMangledName(expr.e1.type,"get"),
                    Utils.getStructName(expr.e1.type)+"* "+op1);
        String get2 = IRPrinter.createCallInst("i32", Utils.getMangledName(expr.e2.type,"get"),
                    Utils.getStructName(expr.e2.type)+"* "+op2);
        String resultBasic =  IRPrinter.createBinaryInst(IRPrinter.SUB, get1, get2, expr.type, false, true); // TODO - set flags correctly
        String resultMem = IRPrinter.createAlloca(expr.type);
        StringBuilder argBuilder = new StringBuilder();
        argBuilder.append(Utils.getStructName(expr.type)+"* "+resultMem);
        argBuilder.append(", ").append("i32 "+resultBasic);
        IRPrinter.createVoidCallInst("void", Utils.getMangledName(expr.type,"set"),argBuilder.toString());
        return resultMem;
    }
    
    public String visit(AST.mul expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        String get1 = IRPrinter.createCallInst("i32", Utils.getMangledName(expr.e1.type,"get"),
                    Utils.getStructName(expr.e1.type)+"* "+op1);
        String get2 = IRPrinter.createCallInst("i32", Utils.getMangledName(expr.e2.type,"get"),
                    Utils.getStructName(expr.e2.type)+"* "+op2);
        String resultBasic =  IRPrinter.createBinaryInst(IRPrinter.MUL, get1, get2, expr.type, false, true); // TODO - set flags correctly
        String resultMem = IRPrinter.createAlloca(expr.type);
        StringBuilder argBuilder = new StringBuilder();
        argBuilder.append(Utils.getStructName(expr.type)+"* "+resultMem);
        argBuilder.append(", ").append("i32 "+resultBasic);
        IRPrinter.createVoidCallInst("void", Utils.getMangledName(expr.type,"set"),argBuilder.toString());
        return resultMem;
    }
    
    public String visit(AST.divide expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        String get1 = IRPrinter.createCallInst("i32", Utils.getMangledName(expr.e1.type,"get"),
                    Utils.getStructName(expr.e1.type)+"* "+op1);
        String get2 = IRPrinter.createCallInst("i32", Utils.getMangledName(expr.e2.type,"get"),
                    Utils.getStructName(expr.e2.type)+"* "+op2);
        String resultBasic =  IRPrinter.createBinaryInst(IRPrinter.DIV, get1, get2, expr.type, false, true); // TODO - set flags correctly
        String resultMem = IRPrinter.createAlloca(expr.type);
        StringBuilder argBuilder = new StringBuilder();
        argBuilder.append(Utils.getStructName(expr.type)+"* "+resultMem);
        argBuilder.append(", ").append("i32 "+resultBasic);
        IRPrinter.createVoidCallInst("void", Utils.getMangledName(expr.type,"set"),argBuilder.toString());
        return resultMem;
    }
    
    public String visit(AST.comp expr) {
        String op = expr.e1.accept(this);
        String get = IRPrinter.createCallInst("i8", Utils.getMangledName(expr.e1.type,"get"),
                    Utils.getStructName(expr.e1.type)+"* "+op);
        String resultBasic = IRPrinter.createBinaryInst(IRPrinter.XOR, get, "true", expr.type, false, false);
        String resultMem = IRPrinter.createAlloca(expr.type);
        StringBuilder argBuilder = new StringBuilder();
        argBuilder.append(Utils.getStructName(expr.type)+"*"+resultMem);
        argBuilder.append(", ").append("i8 "+resultBasic);
        IRPrinter.createVoidCallInst("void", Utils.getMangledName(expr.type,"set"),argBuilder.toString());
        return resultMem;
    }
    
    public String visit(AST.lt expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        String get1 = IRPrinter.createCallInst("i8", Utils.getMangledName(expr.e1.type,"get"),
                    Utils.getStructName(expr.e1.type)+"* "+op1);
        String get2 = IRPrinter.createCallInst("i8", Utils.getMangledName(expr.e2.type,"get"),
                    Utils.getStructName(expr.e2.type)+"* "+op2);
        String resultBasic =  IRPrinter.createBinaryInst(IRPrinter.SLT, get1, get2, expr.type, false, false); // TODO - set flags correctly
        String resultMem = IRPrinter.createAlloca(expr.type);
        StringBuilder argBuilder = new StringBuilder();
        argBuilder.append(Utils.getStructName(expr.type)+"* "+resultMem);
        argBuilder.append(", ").append("i8 "+resultBasic);
        IRPrinter.createVoidCallInst("void", Utils.getMangledName(expr.type,"set"),argBuilder.toString());
        return resultMem;   
    }
    
    public String visit(AST.leq expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        String get1 = IRPrinter.createCallInst("i8", Utils.getMangledName(expr.e1.type,"get"),
                    Utils.getStructName(expr.e1.type)+"* "+op1);
        String get2 = IRPrinter.createCallInst("i8", Utils.getMangledName(expr.e2.type,"get"),
                    Utils.getStructName(expr.e2.type)+"* "+op2);
        String resultBasic =  IRPrinter.createBinaryInst(IRPrinter.SLE, get1, get2, expr.type, false, false); // TODO - set flags correctly
        String resultMem = IRPrinter.createAlloca(expr.type);
        StringBuilder argBuilder = new StringBuilder();
        argBuilder.append(Utils.getStructName(expr.type)+"* "+resultMem);
        argBuilder.append(", ").append("i8 "+resultBasic);
        IRPrinter.createVoidCallInst("void", Utils.getMangledName(expr.type,"set"),argBuilder.toString());
        return resultMem;   
    }
    
    public String visit(AST.eq expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        String get1 = IRPrinter.createCallInst("i8", Utils.getMangledName(expr.e1.type,"get"),
                    Utils.getStructName(expr.e1.type)+"* "+op1);
        String get2 = IRPrinter.createCallInst("i8", Utils.getMangledName(expr.e2.type,"get"),
                    Utils.getStructName(expr.e2.type)+"* "+op2);
        String resultBasic =  IRPrinter.createBinaryInst(IRPrinter.EQ, get1, get2, expr.type, false, false); // TODO - set flags correctly
        String resultMem = IRPrinter.createAlloca(expr.type);
        StringBuilder argBuilder = new StringBuilder();
        argBuilder.append(Utils.getStructName(expr.type)+"* "+resultMem);
        argBuilder.append(", ").append("i8 "+resultBasic);
        IRPrinter.createVoidCallInst("void", Utils.getMangledName(expr.type,"set"),argBuilder.toString());
        return resultMem; 
    }
    
    public String visit(AST.neg expr) {
        String op1 = expr.e1.accept(this);
        String get  = IRPrinter.createCallInst("i32", Utils.getMangledName(expr.e1.type,"get"),
                    Utils.getStructName(expr.e1.type)+"* "+op1);
        String resultBasic =  IRPrinter.createBinaryInst(IRPrinter.SUB, "0", get, expr.type, false, true); // TODO - set flags correctly
        String resultMem = IRPrinter.createAlloca(expr.type);
        StringBuilder argBuilder = new StringBuilder();
        argBuilder.append(Utils.getStructName(expr.type)+"* "+resultMem);
        argBuilder.append(", ").append("i32 "+resultBasic);
        IRPrinter.createVoidCallInst("void", Utils.getMangledName(expr.type,"set"),argBuilder.toString());
        return resultMem; 
    }
    
    public String visit(AST.object expr) {
        // INCOMPLETE, TODO - need to check scope, etc. here, and may need GEP
        // TODO get for method params if they are method params and primitive type
        if(Global.methodParams.contains(expr.name)) {
            return "%"+expr.name+".addr";
            // return IRPrinter.createLoadInst("%"+expr.name+".addr", expr.type);
        }
        String objectPointer = IRPrinter.createClassAttrGEP(Global.currentClass,"%this",expr.name);
        return objectPointer;
        // if(isPrimitiveType(expr.type)) {
        //     // TODO : should primitive type return class object or value? I think object
        //     String getVal = IRPrinter.createCallInst(Utils.getBasicType(expr.type),
        //                 Utils.getMangledName(expr.type,"get"),Utils.getStructName(expr.type) 
        //                 + "* " + objectPointer);
        //     return getVal;
        // }
        // return IRPrinter.createLoadInst(objectPointer, expr.type);
    }
    
    public String visit(AST.int_const expr) {
        // TODO : value or object pointer
        return ""+expr.value;
        // String loadReg = IRPrinter.createLoadInst(""+expr.value, expr.type);
        // return loadReg;
    /*    String objectPointer = IRPrinter.createClassAttrGEP(expr.type,"%this",expr.name);
        String getInt = IRPrinter.createCallInst("i32",Utils.getMangledName(expr.type,"get"),objectPointer);
        return getInt; */

    }
    
    public String visit(AST.string_const expr) {
        // TODO : value or object pointer
        return IRPrinter.createStringGEP(expr.value);    
    }
    
    public String visit(AST.bool_const expr) {
        // TODO : value or object pointer
        if(expr.value) return "1";
        else return "0";
        // String loadReg = IRPrinter.createLoadInst(""+expr.value, expr.type);
        // return loadReg;   
     /*   String objectPointer = IRPrinter.createClassAttrGEP(expr.type,"%this",expr.name);
        String getBool = IRPrinter.createCallInst("i8",Utils.getMangledName(expr.type,"get"),objectPointer);
        return getBool; */
    }

    // Functions below this are meant to be empty, will not be used

    public String visit(AST.typcase expr) {
        return null;
    }

    public String visit(AST.let expr) {
        return null;
    }

    public String visit(AST.branch expr) {
        return null;
    }   

    public String visit(AST.dispatch expr) {
        return null;
    }

}
