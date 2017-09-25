package cool;

interface Visitor {

    // Non-Expression visitors

    // Visits a program (which contains the classes)
    public void visit(AST.program prog);

    // Visits a single class
    public void visit(AST.class_ cl);

    // Visits the attributes of the class
    public void visit(AST.attr at);

    // Visits the method of the class
    public void visit(AST.method mthd);

    // Visits the formals of the method
    public void visit(AST.formal fm);

    // Expression visitors

    // Used for no_expression
    public void visit(AST.no_expr expr);

    // Visits 'ID <- expr' expression
    public void visit(AST.assign expr);

    // Visits 'expr@TYPE.ID([expr [[, expr]]∗])' expression
    public void visit(AST.static_dispatch expr);

    // Visits 'expr.ID([expr [[, expr]]∗])' expression
    // NOTE: 'ID(expr ...)' is converted to 'expr.ID(expr ...)' by parser
    public void visit(AST.dispatch expr);

    // Visits 'if expr then expr else expr fi' expression
    public void visit(AST.cond expr);

    // Visits 'while expr loop expr pool' expression
    public void visit(AST.loop expr);

    // Visits '{ [expr;]+ }' expression
    public void visit(AST.block expr);

    // Visits 'let ID : TYPE [<-expr] in expr' expression
    // NOTE: muliple ID declaration is converted to nested let by parser
    public void visit(AST.let expr);

    // Visits 'case expr of [ID : TYPE => expr;]+ esac' expression
    public void visit(AST.typcase expr);

    // Visits 'ID : TYPE => expr;'
    // This is not an expression, but used inside case
    public void visit(AST.branch br);

    // Visits 'new TYPE' expression
    public void visit(AST.new_ expr);

    // Visits 'isvoid expr' expression
    public void visit(AST.isvoid expr);

    // Visits 'expr + expr' expression
    public void visit(AST.plus expr);

    // Visits 'expr - expr' expression
    public void visit(AST.sub expr);
    
    // Visits 'expr * expr' expression
    public void visit(AST.mul expr);
    
    // Visits 'expr / expr' expression
    public void visit(AST.divide expr);
    
    // Visits 'not expr' expression
    public void visit(AST.comp expr);
    
    // Visits 'expr < expr' expression
    public void visit(AST.lt expr);
    
    // Visits 'expr <= expr' expression
    public void visit(AST.leq expr);
    
    // Visits 'expr = expr' expression
    public void visit(AST.eq expr);
    
    // Visits '~expr' expression
    public void visit(AST.neg expr);
    
    // Visits 'ID' expression
    public void visit(AST.object expr);
    
    // Visits integer expression
    public void visit(AST.int_const expr);
    
    // Visits string expression
    public void visit(AST.string_const expr);
    
    // Visits bool expression
    public void visit(AST.bool_const expr);

}