package cool;

abstract class ExpressionVisitorImpl implements Visitor {
    /* NOTE: to know about the individual visit functions
             Check Visitor.java */

    public String visit(AST.no_expr expr) {
        return null;
    }

    public String visit(AST.assign expr) {
        // first generating IR to calculate value for assignment
        String retVal = expr.e1.accept(this);
        String castVal = retVal;
        String storeID;
        String variableType = Global.scopeTable.lookUpGlobal(expr.name);
        if(!variableType.equals(expr.e1.type)) {
            if(Utils.isPrimitiveType(expr.e1.type)) {
                // creating new object, as primitive cant be stored in object struct directly
                AST.new_ newObj = new AST.new_(Global.Constants.ROOT_TYPE, 0);
                newObj.type = Global.Constants.ROOT_TYPE;
                castVal = this.visit(newObj);
                // fixing the typename
                String typenameGEP = IRPrinter.createTypeNameGEP(castVal);
                String typenameString = IRPrinter.createStringGEP(expr.e1.type);
                IRPrinter.createStoreInst(typenameString, typenameGEP, "i8*");
            } else {
                // bitcast if type of assignment is not same as object
                castVal = IRPrinter.createConvertInst(retVal, expr.e1.type, variableType, IRPrinter.BITCAST);
            }
        }
        if(Global.methodParams.contains(expr.name)) {
            // Function parameter can be directly got
            storeID = "%" + expr.name + ".addr";
        } else {
            // GEP to get object from class struct
            storeID = IRPrinter.createClassAttrGEP(Global.currentClass, "%this", expr.name);
        }
        IRPrinter.createStoreInst(castVal, storeID, Utils.getBasicTypeOrPointer(variableType));
        return retVal;
    }

    // handles few selected methods differently, rest all default methods
    // are handled by static_dispatch in normal way
    private String handleDefaultMethod(AST.static_dispatch expr) {
        String def = null;
        if("length".equals(expr.name) && Global.Constants.STRING_TYPE.equals(expr.typeid)) {
            // directly using strlen of C, no separate function written in IR
            String stringReg = expr.caller.accept(this);
            String strlenReg = IRPrinter.createCallInst("i64", "strlen", "i8* " + stringReg);
            def = IRPrinter.createConvertInst(strlenReg,"i64","i32",IRPrinter.TRUNC);
        } else if(Utils.isPrimitiveType(expr.caller.type) && "abort".equals(expr.name)) {
            expr.caller.accept(this);
            def = IRPrinter.createAbortForPrimitive(expr.caller.type);
        } else if(Utils.isPrimitiveType(expr.caller.type) && "type_name".equals(expr.name)) {
            expr.caller.accept(this);
            def = IRPrinter.createStringGEP(expr.caller.type);
        }
        return def;
    }

    public String visit(AST.static_dispatch expr) {

        String def = handleDefaultMethod(expr);
        if(def!=null) {
            // default method got handled
            return def;
        }

        String caller = expr.caller.accept(this);
        if(!Utils.isPrimitiveType(expr.caller.type)) {
            // Adding check for dispatch on void
            String ifThenLabel = IRPrinter.getLabel("if.then",false);
            String ifElseLabel = IRPrinter.getLabel("if.else",false);
            String ifEndLabel = IRPrinter.getLabel("if.end",false);

            // checking for null
            String cmpInst = IRPrinter.createBinaryInst(IRPrinter.EQ, caller, "null", expr.caller.type, false, false);
            IRPrinter.createCondBreak(cmpInst, ifThenLabel, ifElseLabel);

            // exit if null
            IRPrinter.createLabel(ifThenLabel);
            IRPrinter.createVoidCallInst(Global.Constants.VOID_CALL_FUNCTION, "i32 "+expr.lineNo);
            Global.out.println(IRPrinter.INDENT+"call void @exit(i32 1)");

            IRPrinter.createBreakInst(ifEndLabel);

            IRPrinter.createLabel(ifElseLabel);
            IRPrinter.createBreakInst(ifEndLabel);

            IRPrinter.createLabel(ifEndLabel);
        }

        String mthdClass = Utils.getNearestParentWithMethod(expr.typeid, expr.name);

        if(!mthdClass.equals(expr.caller.type)) {
            // bitcast caller if method is not from same class
            caller = IRPrinter.createConvertInst(caller, expr.caller.type, mthdClass, IRPrinter.BITCAST);
        }

        // building parameters
        StringBuilder builder = new StringBuilder();
        builder.append(Utils.getBasicTypeOrPointer(mthdClass)).append(" ").append(caller);
        for(AST.expression argument : expr.actuals) {
            builder.append(", ").append(Utils.getBasicTypeOrPointer(argument.type))
            .append(" ").append(argument.accept(this));
        }
        // calling function
        String returnValue = IRPrinter.createCallInst(expr.type, Utils.getMangledName(mthdClass, 
                            expr.name), builder.toString());
        return returnValue;
    }

    public String visit(AST.cond expr) {
        String ifThenLabel = IRPrinter.getLabel("if.then",false);
        String ifElseLabel = IRPrinter.getLabel("if.else",false);
        String ifEndLabel = IRPrinter.getLabel("if.end",false);
        String resultType = Global.inheritanceGraph.getJoinOf(expr.ifbody.type,expr.elsebody.type);
        
        // result of if.then and if.else will be stored in this register
        String retVal = IRPrinter.createAlloca(resultType);

        String cmpInst = expr.predicate.accept(this);
        String truncVar = IRPrinter.createConvertInst(cmpInst, "i8", "i1", IRPrinter.TRUNC);
        
        IRPrinter.createCondBreak(truncVar, ifThenLabel, ifElseLabel);
        
        // if then
        IRPrinter.createLabel(ifThenLabel);
        String ifBody = expr.ifbody.accept(this);
        if(!resultType.equals(expr.ifbody.type)) {
            ifBody = IRPrinter.createConvertInst(ifBody, expr.ifbody.type, resultType, IRPrinter.BITCAST);
        }
        if(Utils.isPrimitiveType(resultType)) {
            IRPrinter.createStoreInst(ifBody, retVal, Utils.getBasicType(resultType));
        } else {
            String loadVal = IRPrinter.createLoadInst(ifBody, Utils.getBasicType(resultType));
            IRPrinter.createStoreInst(loadVal, retVal, Utils.getBasicType(resultType));
        }
        IRPrinter.createBreakInst(ifEndLabel);
        
        // if else
        IRPrinter.createLabel(ifElseLabel);
        String ifElse = expr.elsebody.accept(this);
        if(!resultType.equals(expr.elsebody.type)) {
            ifElse = IRPrinter.createConvertInst(ifElse, expr.elsebody.type, resultType, IRPrinter.BITCAST);
        }
        if(Utils.isPrimitiveType(resultType)) {
            IRPrinter.createStoreInst(ifElse, retVal, Utils.getBasicType(resultType));
        } else {
            String loadVal = IRPrinter.createLoadInst(ifElse, Utils.getBasicType(resultType));
            IRPrinter.createStoreInst(loadVal, retVal, Utils.getBasicType(resultType));
        }
        
        IRPrinter.createBreakInst(ifEndLabel);
        IRPrinter.createLabel(ifEndLabel);

        if(Utils.isPrimitiveType(resultType)) {
            return IRPrinter.createLoadInst(retVal, Utils.getBasicType(resultType));
        } else {
            return retVal;
        }
    }

    public String visit(AST.loop expr) {
        String whileCondLabel = IRPrinter.getLabel("while.cond",false);
        String whileBodyLabel = IRPrinter.getLabel("while.body",false);
        String whileEndLabel = IRPrinter.getLabel("while.end",false);
        IRPrinter.createBreakInst(whileCondLabel);

        IRPrinter.createLabel(whileCondLabel);

        String whilePredicate = expr.predicate.accept(this);
        String truncVar = IRPrinter.createConvertInst(whilePredicate, "i8", "i1", IRPrinter.TRUNC);

        IRPrinter.createCondBreak(truncVar,whileBodyLabel,whileEndLabel);

        IRPrinter.createLabel(whileBodyLabel);
        String whileBody = expr.body.accept(this);
        IRPrinter.createBreakInst(whileCondLabel);

        IRPrinter.createLabel(whileEndLabel);
        return "null";

    }

    public String visit(AST.block expr) {
        String returnValue = null;
        for(AST.expression exprInBlock : expr.l1) {
            returnValue = exprInBlock.accept(this);
        }
        return returnValue;
    }   

    public String visit(AST.new_ expr) {
        if(Utils.isPrimitiveType(expr.typeid)) {
            // default values for primitive types
            return Utils.getDefaultValue(expr.typeid);
        }
        // allocating using malloc
        String bytesToAllocate = ""+Global.classSizeMap.get(expr.typeid);
        String storeRegisterForCall = IRPrinter.createMallocInst(bytesToAllocate);
        String returnValue = IRPrinter.createConvertInst(storeRegisterForCall, "i8*", 
                                        expr.typeid, IRPrinter.BITCAST);
        // calling constructor
        IRPrinter.createVoidCallInst(Utils.getMangledName(expr.typeid, expr.typeid), 
                                Utils.getStructName(expr.typeid)+ "* " + returnValue);

        // store the name here
        String objBitcast = returnValue;
        if(!Global.Constants.ROOT_TYPE.equals(expr.typeid))
            objBitcast = IRPrinter.createConvertInst(returnValue, expr.typeid, 
                            Global.Constants.ROOT_TYPE, IRPrinter.BITCAST);
        String typenameGEP = IRPrinter.createTypeNameGEP(objBitcast);
        String typenameString = IRPrinter.createStringGEP(expr.typeid);
        IRPrinter.createStoreInst(typenameString, typenameGEP, "i8*");
        return returnValue;
    }

    public String visit(AST.isvoid expr) {
        String op = expr.e1.accept(this);
        if(Utils.isPrimitiveType(expr.e1.type)) {
            return "0";
        }
        String binResult = IRPrinter.createBinaryInst(IRPrinter.EQ, op, "null", expr.e1.type, false, false);
        return IRPrinter.createConvertInst(binResult, "i1", "i8", IRPrinter.ZEXT);
    }

    public String visit(AST.plus expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        return IRPrinter.createBinaryInst(IRPrinter.ADD, op1, op2, expr.type, false, true);
    }

    public String visit(AST.sub expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        return IRPrinter.createBinaryInst(IRPrinter.SUB, op1, op2, expr.type, false, true);
    }
    
    public String visit(AST.mul expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        return IRPrinter.createBinaryInst(IRPrinter.MUL, op1, op2, expr.type, false, true);
    }
    
    public String visit(AST.divide expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        
        // divide by 0 check
        String ifThenLabel = IRPrinter.getLabel("if.then",false);
        String ifElseLabel = IRPrinter.getLabel("if.else",false);
        String ifEndLabel = IRPrinter.getLabel("if.end",false);

        String cmpInst = IRPrinter.createBinaryInst(IRPrinter.EQ, op2, "0", Global.Constants.INT_TYPE, false, false);;
        IRPrinter.createCondBreak(cmpInst, ifThenLabel, ifElseLabel);
        
        // if divide by 0.then
        IRPrinter.createLabel(ifThenLabel);
        IRPrinter.createVoidCallInst(Global.Constants.DIVIDE_BY_ZERO_FUNCTION, "i32 "+expr.lineNo);
        Global.out.println(IRPrinter.INDENT+"call void @exit(i32 1)");
        IRPrinter.createBreakInst(ifEndLabel);
 
        // else jump to end
        IRPrinter.createLabel(ifElseLabel);
        IRPrinter.createBreakInst(ifEndLabel);
        
        IRPrinter.createLabel(ifEndLabel);

        return IRPrinter.createBinaryInst(IRPrinter.DIV, op1, op2, expr.type, false, false);
    }
    
    public String visit(AST.comp expr) {
        String op = expr.e1.accept(this);
        return IRPrinter.createBinaryInst(IRPrinter.XOR, op, "1", expr.e1.type, false, false);
    }
    
    public String visit(AST.lt expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        String binResult = IRPrinter.createBinaryInst(IRPrinter.SLT, op1, op2, expr.e1.type, false, false);
        return IRPrinter.createConvertInst(binResult, "i1", "i8", IRPrinter.ZEXT);
    }
    
    public String visit(AST.leq expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        String binResult = IRPrinter.createBinaryInst(IRPrinter.SLE, op1, op2, expr.e1.type, false, false);
        return IRPrinter.createConvertInst(binResult, "i1", "i8", IRPrinter.ZEXT);
    }
    
    public String visit(AST.eq expr) {
        String op1 = expr.e1.accept(this);
        String op2 = expr.e2.accept(this);
        String binResult = IRPrinter.createBinaryInst(IRPrinter.EQ, op1, op2, expr.e1.type, false, false);
        return IRPrinter.createConvertInst(binResult, "i1", "i8", IRPrinter.ZEXT);
    }
    
    public String visit(AST.neg expr) {
        String op = expr.e1.accept(this);
        return IRPrinter.createBinaryInst(IRPrinter.SUB, "0", op, expr.type, false, true);
    }
    
    public String visit(AST.object expr) {
        if("self".equals(expr.name)) {
            return "%this";
        }
        if(Global.methodParams.contains(expr.name)) {
            return IRPrinter.createLoadInst("%"+expr.name+".addr", Utils.getBasicTypeOrPointer(expr.type));
        } else {
            String objectPointer = IRPrinter.createClassAttrGEP(Global.currentClass,"%this",expr.name);
            if(Utils.isPrimitiveType(expr.type)) {
                objectPointer = IRPrinter.createLoadInst(objectPointer, Utils.getBasicType(expr.type));
            }
            else {
                objectPointer = IRPrinter.createLoadInst(objectPointer, Utils.getBasicType(expr.type)+"*");
            }
            return objectPointer;
        }
    }
    
    public String visit(AST.int_const expr) {
        return String.valueOf(expr.value);
    }
    
    public String visit(AST.string_const expr) {
        return IRPrinter.createStringGEP(expr.value);
    }
    
    public String visit(AST.bool_const expr) {
        if(expr.value) return "1";
        else return "0";
    }

    /* Functions below this are meant to be empty, will not be used */

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
