package cool;

class VisitorImpl implements Visitor {

    public void visit(AST.program expr) {}
    public void visit(AST.class_ expr) {}
    public void visit(AST.attr expr) {}
    public void visit(AST.method expr) {}
    public void visit(AST.feature expr) {}
    public void visit(AST.formal expr) {}
    public void visit(AST.branch expr) {}
}