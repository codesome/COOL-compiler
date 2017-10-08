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
        if(expr.e1.type != expr.type) {
            retVal = IRPrinter.createConvertInst(retVal, expr.e1.type, expr.type, IRPrinter.BITCAST);
        }
        IRPrinter.createStoreInst(retVal, expr.name, expr.type);
        return retVal;
    }

    public String visit(AST.static_dispatch expr) {
        return null;
    }

    public String visit(AST.cond expr) { // incomplete
        String ifThenLabel = IRPrinter.getLabel("if.then");
        String ifElseLabel = IRPrinter.getLabel("if.else");
        String ifEndLabel = IRPrinter.getLabel("if.end");
        String cmpInst = expr.predicate.accept(this);
        IRPrinter.createCondBreak(cmpInst, ifThenLabel, ifElseLabel);
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
        String whileCondLabel = IRPrinter.getLabel("while.cond");
        String whileBodyLabel = IRPrinter.getLabel("while.body");
        String whileEndLabel = IRPrinter.getLabel("while.end");
        IRPrinter.createBreakInst(whileCondLabel);
        IRPrinter.createLabel(whileCondLabel);
        String whilePredicate = expr.predicate.accept(this);
        IRPrinter.createCondBreak(whilePredicate,whileBodyLabel,whileEndLabel);
        IRPrinter.createLabel(whileBodyLabel);
        String whileBody = expr.body.accept(this);
        IRPrinter.createBreakInst(whileCondLabel);
        IRPrinter.createLabel(whileEndLabel);
        String objectClass = Utils.getStructName("Object");
        String voidReturn = IRPrinter.createLoadInst(IRPrinter.UNDEF, objectClass);
        return voidReturn;
    }

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

    public String visit(AST.block expr) {
        return null;
    }   

    public String visit(AST.new_ expr) {
        return null;
    }

    public String visit(AST.isvoid expr) {
        return null;
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
        return null;    
    }
    
    public String visit(AST.int_const expr) {
        String loadReg = IRPrinter.createLoadInst(""+expr.value, expr.type);
        return loadReg;    
    }
    
    public String visit(AST.string_const expr) {
        return null;    
    }
    
    public String visit(AST.bool_const expr) {
        String loadReg = IRPrinter.createLoadInst(""+expr.value, expr.type);
        return loadReg;    
    }

}
