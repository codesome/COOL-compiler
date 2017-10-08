package cool;


abstract class ExpressionVisitorImpl implements Visitor {
    /* NOTE: to know about the individual visit functions
             Check Visitor.java 
    */

    public String visit(AST.no_expr expr) {

    }

    public String visit(AST.assign expr) {
        String retVal = visit(expr.e1);
        if(expr.e1.type != expr.type) {
            retVal = createConvertInst(retVal, expr.e1.type, expr.type, IRPrinter.BITCAST);
        }
        IRPrinter.createStoreInst(retVal, expr.name, expr.type);
    }

    public void visit(AST.static_dispatch expr) {
        
    }

    public void visit(AST.cond expr) { // incomplete
        String ifThenLabel = IRPrinter.getLabel("if.then");
        String ifElseLabel = IRPrinter.getLabel("if.else");
        String ifEndLabel = IRPrinter.getLabel("if.end");
        String cmpInst = visit(expr.predicate);
        IRPrinter.createCondBreak(cmpInst, ifThenLabel, ifElseLabel);
        IRPrinter.createLabel(ifThenLabel);
        String ifBody = visit(expr.ifbody);
        IRPrinter.createBreakInst(ifEndLabel);
        IRPrinter.createLabel(ifElseLabel);
        String ifElse = visit(expr.elsebody);
        IRPrinter.createBreakInst(ifEndLabel);
        IRPrinter.createLabel(ifEndLabel);
    }

    public void visit(AST.loop expr) { // incomplete
        String whileCond = IRPrinter.getLabel("while.cond");
        String whileBody = IRPrinter.getLabel("while.body");
        String whileEnd = IRPrinter.getLabel("while.end");
        IRPrinter.createBreakInst(whileCond);
        IRPrinter.createLabel(whileCond);
        String whilePredicate = visit(expr.predicate);
        IRPrinter.createCondBreak(whilePredicate,whileBody,whileEnd);
        IRPrinter.createLabel(whileBody);
        String whileBody = visit(expr.body);
        IRPrinter.createBreakInst(whileCond);
        IRPrinter.createLabel(whileEnd);
    }

    public void visit(AST.block expr) {
        
    }

    public void visit(AST.new_ expr) {
        
    }

    public void visit(AST.isvoid expr) {
        
    }

    public void visit(AST.plus expr) {
        String op1 = visit(expr.e1);
        String op2 = visit(expr.e2);
        IRPrinter.createBinaryInst("add", op1, op2, expr.type, false, true); // TODO - set flags correctly
    }

    public void visit(AST.sub expr) {
        String op1 = visit(expr.e1);
        String op2 = visit(expr.e2);
        IRPrinter.createBinaryInst("sub", op1, op2, expr.type, false, true); // TODO - set flags correctly
    }
    
    public void visit(AST.mul expr) {
        String op1 = visit(expr.e1);
        String op2 = visit(expr.e2);
        IRPrinter.createBinaryInst("mul", op1, op2, expr.type, false, true); // TODO - set flags correctly
    }
    
    public void visit(AST.divide expr) {
        String op1 = visit(expr.e1);
        String op2 = visit(expr.e2);
        IRPrinter.createBinaryInst("div", op1, op2, expr.type, false, true); // TODO - set flags correctly
    }
    
    public void visit(AST.comp expr) {
        
    }
    
    public void visit(AST.lt expr) {
        
    }
    
    public void visit(AST.leq expr) {
        
    }
    
    public void visit(AST.eq expr) {
        
    }
    
    public void visit(AST.neg expr) {
        
    }
    
    public void visit(AST.object expr) {
        
    }
    
    public void visit(AST.int_const expr) {
        
    }
    
    public void visit(AST.string_const expr) {
        
    }
    
    public void visit(AST.bool_const expr) {
        
    }

}
