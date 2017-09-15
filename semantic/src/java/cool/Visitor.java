package cool;

import java.util.List;

/*
 * Instructions:
 *     1) Use GlobalData to get data of the scope and context
 *     2) And error found should be appended to the List<Error> errors
 *     3) Expressions must return a type so that it can be used in other visit
 *     4) Annotate the type for expressions insde the visit
 **/

interface Visitor {

    /*
     * Non-Expression visitors
     **/

    // public void visit(AST.class_ expr, List<Error> errors);

    
    // This method should add the feature declaration to global context data
    // public void visit(AST.feature expr, List<Error> errors);


    /*
     * Expression visitors
     *
     * For the following functions, the function should
     * return the type of the expression
     **/

    public void visit(AST.no_expr expr, List<Error> errors);
    public void visit(AST.assign expr, List<Error> errors);
    public void visit(AST.static_dispatch expr, List<Error> errors);
    public void visit(AST.dispatch expr, List<Error> errors);
    public void visit(AST.cond expr, List<Error> errors);
    public void visit(AST.loop expr, List<Error> errors);
    public void visit(AST.block expr, List<Error> errors);
    public void visit(AST.let expr, List<Error> errors);
    public void visit(AST.typcase expr, List<Error> errors);
    public void visit(AST.new_ expr, List<Error> errors);
    public void visit(AST.isvoid expr, List<Error> errors);
    public void visit(AST.plus expr, List<Error> errors);
    public void visit(AST.sub expr, List<Error> errors);
    public void visit(AST.mul expr, List<Error> errors);
    public void visit(AST.divide expr, List<Error> errors);
    public void visit(AST.comp expr, List<Error> errors);
    public void visit(AST.lt expr, List<Error> errors);
    public void visit(AST.leq expr, List<Error> errors);
    public void visit(AST.eq expr, List<Error> errors);
    public void visit(AST.neg expr, List<Error> errors);
    public void visit(AST.object expr, List<Error> errors);
    public void visit(AST.int_const expr, List<Error> errors);
    public void visit(AST.string_const expr, List<Error> errors);
    public void visit(AST.bool_const expr, List<Error> errors);

}