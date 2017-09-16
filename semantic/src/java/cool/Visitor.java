package cool;

/*
 * Instructions:
 *     1) Use GlobalData to get data of the scope and context
 *     2) And error found should be appended to the List<Error> errors
 *     3) Annotate the type for expressions insde the visit
 *     4) Don't forget to visit all the nodes originating from the current class before analysing it.
 **/

interface Visitor {

    // Non-Expression visitors
    public void visit(AST.program prog);
    public void visit(AST.class_ cl);
    public void visit(AST.attr at);
    public void visit(AST.method mthd);
    public void visit(AST.formal fm);

    // Expression visitors
    public void visit(AST.no_expr expr);
    public void visit(AST.assign expr);
    public void visit(AST.static_dispatch expr);
    public void visit(AST.dispatch expr);
    public void visit(AST.cond expr);
    public void visit(AST.loop expr);
    public void visit(AST.block expr);
    public void visit(AST.let expr);
    public void visit(AST.typcase expr);
    public void visit(AST.branch br); // This is not an expression, but used inside an expression
    public void visit(AST.new_ expr);
    public void visit(AST.isvoid expr);
    public void visit(AST.plus expr);
    public void visit(AST.sub expr);
    public void visit(AST.mul expr);
    public void visit(AST.divide expr);
    public void visit(AST.comp expr);
    public void visit(AST.lt expr);
    public void visit(AST.leq expr);
    public void visit(AST.eq expr);
    public void visit(AST.neg expr);
    public void visit(AST.object expr);
    public void visit(AST.int_const expr);
    public void visit(AST.string_const expr);
    public void visit(AST.bool_const expr);

}