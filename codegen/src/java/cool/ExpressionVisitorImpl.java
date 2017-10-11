package cool;


abstract class ExpressionVisitorImpl implements Visitor {
    /* NOTE: to know about the individual visit functions
             Check Visitor.java 
    */

    public String visit(AST.no_expr expr) {
        return null;
    }

    public String visit(AST.assign expr) {
        String retVal = expr.e1.accept(this);
        String castVal = retVal;
        if(Global.methodParams.contains(expr.name)) {
            if((Global.Constants.STRING_TYPE.equals(expr.e1.type)
            || Global.Constants.INT_TYPE.equals(expr.e1.type)
            || Global.Constants.BOOL_TYPE.equals(expr.e1.type)) && !expr.type.equals(expr.e1.type)) {
                castVal = IRPrinter.createConvertInst(retVal, Utils.getBasicType(expr.e1.type), 
                                                    expr.type, IRPrinter.BITCAST);
            }
            else if(!expr.e1.type.equals(expr.type)) {
                castVal = IRPrinter.createConvertInst(retVal, expr.e1.type, expr.type, IRPrinter.BITCAST);
            }
            IRPrinter.createStoreInst(castVal, expr.name, expr.type);
        }
        if(!expr.e1.type.equals(expr.type)) {
            castVal = IRPrinter.createConvertInst(retVal, expr.e1.type, expr.type, IRPrinter.BITCAST);
        }
        if(Global.Constants.STRING_TYPE.equals(expr.type)
            || Global.Constants.INT_TYPE.equals(expr.type)
            || Global.Constants.BOOL_TYPE.equals(expr.type)) {
            String objectPointer = IRPrinter.createClassAttrGEP(expr.type,"%this",expr.name);
            String args = Utils.convertTypeWithPtr(expr.type) + " " 
                        + objectPointer + ", " + Utils.getBasicTypePtr(expr.type) + " " + castVal;
            IRPrinter.createVoidCallInst(expr.type, Utils.getMangledName(expr.name,"set"), args);
        }
        else {
            IRPrinter.createStoreInst(castVal, expr.name, expr.type);  
        }
        return castVal;
    }

    public String visit(AST.static_dispatch expr) {
        String caller = expr.caller.accept(this);
        StringBuilder builder = new StringBuilder();
        for(AST.expression argument : expr.actuals) {
            builder.append(Utils.convertTypeWithPtr(argument.type));
            builder.append(" ");
            builder.append(argument.accept(this));
            builder.append(", ");
        }
        // TODO type or typeid?
        String returnValue = IRPrinter.createCallInst(expr.type, Utils.getMangledName(Global.currentClass, 
                            expr.name), builder.toString());
        return returnValue;
    }

    public String visit(AST.cond expr) { // incomplete
        String ifThenLabel = IRPrinter.getLabel("if.then",false);
        String ifElseLabel = IRPrinter.getLabel("if.else",false);
        String ifEndLabel = IRPrinter.getLabel("if.end",false);
        String cmpInst = expr.predicate.accept(this);
        String truncVar = IRPrinter.createConvertInst(cmpInst,"i8","i1",IRPrinter.TRUNC);
        IRPrinter.createCondBreak(truncVar, ifThenLabel, ifElseLabel);
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
        String whilePredicate = expr.predicate.accept(this);
        String truncVar = IRPrinter.createConvertInst(whilePredicate,"i8","i1",IRPrinter.TRUNC);
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
        String storeRegisterForCall = IRPrinter.createMallocInst("32"); // TODO - set the correct size
        String returnValue = IRPrinter.createConvertInst(storeRegisterForCall, "i8*", 
                                        expr.type, IRPrinter.BITCAST);
        IRPrinter.createVoidCallInst("void", Utils.getMangledName(expr.type, expr.type), 
                                Utils.convertTypeWithPtr(expr.type)+ " " + returnValue);
        return returnValue; // FIXME - fixed?
    }

    public String visit(AST.isvoid expr) {
        String op = expr.e1.accept(this);
        // TODO - is this correct?
        return IRPrinter.createBinaryInst(IRPrinter.EQ, op, IRPrinter.UNDEF, expr.type, false, false);
    }

    public String visit(AST.plus expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        return IRPrinter.createBinaryInst(IRPrinter.ADD, op1, op2, expr.type, false, true); // TODO - set flags correctly
    }

    public String visit(AST.sub expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        return IRPrinter.createBinaryInst(IRPrinter.SUB, op1, op2, expr.type, false, true); // TODO - set flags correctly
    }
    
    public String visit(AST.mul expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        return IRPrinter.createBinaryInst(IRPrinter.MUL, op1, op2, expr.type, false, true); // TODO - set flags correctly
    }
    
    public String visit(AST.divide expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        return IRPrinter.createBinaryInst(IRPrinter.DIV, op1, op2, expr.type, false, true); // TODO - set flags correctly
    }
    
    public String visit(AST.comp expr) {
        String op = expr.e1.accept(this);
        return IRPrinter.createBinaryInst(IRPrinter.XOR, op, "true", expr.type, false, false);
    }
    
    public String visit(AST.lt expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        return IRPrinter.createBinaryInst(IRPrinter.SLT, op1, op2, expr.type, false, false);   
    }
    
    public String visit(AST.leq expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        return IRPrinter.createBinaryInst(IRPrinter.SLE, op1, op2, expr.type, false, false);    
    }
    
    public String visit(AST.eq expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        return IRPrinter.createBinaryInst(IRPrinter.EQ, op1, op2, expr.type, false, false);    
    }
    
    public String visit(AST.neg expr) {
        String op = expr.e1.accept(this);
        return IRPrinter.createBinaryInst(IRPrinter.SUB, "0", op, expr.type, false, true); // TODO - set flags correctly    
    }
    
    public String visit(AST.object expr) {
        // INCOMPLETE, TODO - need to check scope, etc. here, and may need GEP
        if(Global.methodParams.contains(expr.name)) {
            return IRPrinter.createLoadInst(expr.name, expr.type);
        }
        if(Global.Constants.STRING_TYPE.equals(expr.type)
            || Global.Constants.INT_TYPE.equals(expr.type)
            || Global.Constants.BOOL_TYPE.equals(expr.type)) {
            String objectPointer = IRPrinter.createClassAttrGEP(expr.type,"%this",expr.name);
            String getVal = IRPrinter.createCallInst(Utils.getBasicType(expr.type),
                        Utils.getMangledName(expr.type,"get"),Utils.convertTypeWithPtr(expr.type) 
                        + " " + objectPointer);
            return getVal;
        }
        return IRPrinter.createLoadInst(expr.name, expr.type);    
    }
    
    public String visit(AST.int_const expr) {
        return ""+expr.value;
        // String loadReg = IRPrinter.createLoadInst(""+expr.value, expr.type);
        // return loadReg;
    /*    String objectPointer = IRPrinter.createClassAttrGEP(expr.type,"%this",expr.name);
        String getInt = IRPrinter.createCallInst("i32",Utils.getMangledName(expr.type,"get"),objectPointer);
        return getInt; */

    }
    
    public String visit(AST.string_const expr) {
        return IRPrinter.createStringGEP(expr.value);    
    }
    
    public String visit(AST.bool_const expr) {
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
