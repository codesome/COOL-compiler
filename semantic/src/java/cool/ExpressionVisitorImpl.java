package cool;

import java.util.List;

class ExpressionVisitorImpl implements ExpressionVisitor {

    private boolean nonIntegerExpression(AST.expression e1, AST.expression e2) {
        return !GlobalData.INT_TYPE.equals(e1.type) || !GlobalData.INT_TYPE.equals(e2.type);
    }

    // TODO
    public void visit(AST.no_expr expr) {}

    // TODO
    public void visit(AST.assign expr) {}

    // TODO
    public void visit(AST.static_dispatch expr) {}

    // TODO
    public void visit(AST.dispatch expr) {}

    // TODO
    public void visit(AST.cond expr) {}

    // TODO
    public void visit(AST.loop expr) {}

    // TODO
    public void visit(AST.block expr) {}

    // TODO
    public void visit(AST.let expr) {}

    // TODO
    public void visit(AST.typcase expr) {}

    // TODO
    public void visit(AST.new_ expr) {

        // TODO: check if the typeid is valid

        expr.type = expr.typeid;
    }

    // TODO
    public void visit(AST.isvoid expr) {
        expr.e1.accept(this);
        expr.type = GlobalData.BOOL_TYPE;
    }

    public void visit(AST.plus expr) {
        expr.e1.accept(this);
        expr.e2.accept(this);
        if(nonIntegerExpression(expr.e1, expr.e2)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Addition of non int type"));
        }
        expr.type = GlobalData.INT_TYPE;
    }

    public void visit(AST.sub expr) {
        expr.e1.accept(this);
        expr.e2.accept(this);
        if(nonIntegerExpression(expr.e1, expr.e2)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Subtraction of non int type"));
        }
        expr.type = GlobalData.INT_TYPE;
    }

    public void visit(AST.mul expr) {
        expr.e1.accept(this);
        expr.e2.accept(this);
        if(nonIntegerExpression(expr.e1, expr.e2)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Multiplication of non int type"));
        }
        expr.type = GlobalData.INT_TYPE;
    }

    public void visit(AST.divide expr) {
        expr.e1.accept(this);
        expr.e2.accept(this);
        if(nonIntegerExpression(expr.e1, expr.e2)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Division of non int type"));
        }
        expr.type = GlobalData.INT_TYPE;
    }

    public void visit(AST.comp expr) {
        expr.e1.accept(this);
        if(!GlobalData.INT_TYPE.equals(expr.e1.type)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Cannot do compliment of non int type"));
        }
        expr.type = GlobalData.INT_TYPE;
    }

    public void visit(AST.lt expr) {
        expr.e1.accept(this);
        expr.e2.accept(this);
        if(nonIntegerExpression(expr.e1, expr.e2)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "< of non int types"));
        }
        expr.type = GlobalData.BOOL_TYPE;
    }

    public void visit(AST.leq expr) {
        expr.e1.accept(this);
        expr.e2.accept(this);
        if(nonIntegerExpression(expr.e1, expr.e2)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "<= of non int types"));
        }
        expr.type = GlobalData.BOOL_TYPE;
    }

    public void visit(AST.eq expr) {
        expr.e1.accept(this);
        expr.e2.accept(this);
        if(!expr.e1.type.equals(expr.e2.type)) {
            boolean e1p = GlobalData.INT_TYPE.equals(expr.e1.type) || GlobalData.BOOL_TYPE.equals(expr.e1.type) 
                || GlobalData.STRING_TYPE.equals(expr.e1.type);
            boolean e2p = GlobalData.INT_TYPE.equals(expr.e2.type) 
                || GlobalData.BOOL_TYPE.equals(expr.e2.type) || GlobalData.STRING_TYPE.equals(expr.e2.type);  
            if(e1p || e2p) {
                if(e1p && e2p) {
                    GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Equality of different primitive types"));
                } else {
                    GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Equality of primitive types with non primitive type"));
                }
            }
        }
        expr.type = GlobalData.BOOL_TYPE;
    }

    public void visit(AST.neg expr) {
        if(!GlobalData.BOOL_TYPE.equals(expr.type)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Negation of non bool type"));
        }
        expr.type = GlobalData.BOOL_TYPE;
    }

    public void visit(AST.object expr) {
        // TODO: get from scope/context data
    }

    public void visit(AST.int_const expr) {
        expr.type = GlobalData.INT_TYPE;
    }

    public void visit(AST.string_const expr) {
        expr.type = GlobalData.STRING_TYPE;
    }

    public void visit(AST.bool_const expr) {
        expr.type = GlobalData.BOOL_TYPE;
    }
	
}