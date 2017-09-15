package cool;

import java.util.List;

class VisitorImpl implements Visitor {

    private boolean notIntegerExpression(AST.expression e1, AST.expression e2) {
        return !GlobalData.INT_TYPE.equals(e1.type) || !GlobalData.INT_TYPE.equals(e2.type);
    }

    // TODO
    public void visit(AST.no_expr expr, List<Error> errors) {}

    // TODO
    public void visit(AST.assign expr, List<Error> errors) {}

    // TODO
    public void visit(AST.static_dispatch expr, List<Error> errors) {}

    // TODO
    public void visit(AST.dispatch expr, List<Error> errors) {}

    // TODO
    public void visit(AST.cond expr, List<Error> errors) {}

    // TODO
    public void visit(AST.loop expr, List<Error> errors) {}

    // TODO
    public void visit(AST.block expr, List<Error> errors) {}

    // TODO
    public void visit(AST.let expr, List<Error> errors) {}

    // TODO
    public void visit(AST.typcase expr, List<Error> errors) {}

    // TODO
    public void visit(AST.new_ expr, List<Error> errors) {

        // TODO: check if the typeid is valid

        expr.type = expr.typeid;
    }

    // TODO
    public void visit(AST.isvoid expr, List<Error> errors) {}

    public void visit(AST.plus expr, List<Error> errors) {
        expr.e1.accept(this, errors);
        expr.e2.accept(this, errors);
        if(notIntegerExpression(expr.e1, expr.e2)) {
            errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Addition of non int type"));
        }
        expr.type = GlobalData.INT_TYPE;
    }

    public void visit(AST.sub expr, List<Error> errors) {
        expr.e1.accept(this, errors);
        expr.e2.accept(this, errors);
        if(notIntegerExpression(expr.e1, expr.e2)) {
            errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Subtraction of non int type"));
        }
        expr.type = GlobalData.INT_TYPE;
    }

    public void visit(AST.mul expr, List<Error> errors) {
        expr.e1.accept(this, errors);
        expr.e2.accept(this, errors);
        if(notIntegerExpression(expr.e1, expr.e2)) {
            errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Multiplication of non int type"));
        }
        expr.type = GlobalData.INT_TYPE;
    }

    public void visit(AST.divide expr, List<Error> errors) {
        expr.e1.accept(this, errors);
        expr.e2.accept(this, errors);
        if(notIntegerExpression(expr.e1, expr.e2)) {
            errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Division of non int type"));
        }
        expr.type = GlobalData.INT_TYPE;
    }

    // TODO
    public void visit(AST.comp expr, List<Error> errors) {}

    public void visit(AST.lt expr, List<Error> errors) {
        expr.e1.accept(this, errors);
        expr.e2.accept(this, errors);
        if(notIntegerExpression(expr.e1, expr.e2)) {
            errors.add(new Error(GlobalData.filename, expr.getLineNo(), "< of non int types"));
        }
        expr.type = GlobalData.BOOL_TYPE;
    }

    public void visit(AST.leq expr, List<Error> errors) {
        expr.e1.accept(this, errors);
        expr.e2.accept(this, errors);
        if(notIntegerExpression(expr.e1, expr.e2)) {
            errors.add(new Error(GlobalData.filename, expr.getLineNo(), "<= of non int types"));
        }
        expr.type = GlobalData.BOOL_TYPE;
    }

    public void visit(AST.eq expr, List<Error> errors) {
        expr.e1.accept(this, errors);
        expr.e2.accept(this, errors);
        if(!expr.e1.type.equals(expr.e2.type)) {
            boolean e1p = GlobalData.INT_TYPE.equals(expr.e1.type) || GlobalData.BOOL_TYPE.equals(expr.e1.type) 
                || GlobalData.STRING_TYPE.equals(expr.e1.type);
            boolean e2p = GlobalData.INT_TYPE.equals(expr.e2.type) 
                || GlobalData.BOOL_TYPE.equals(expr.e2.type) || GlobalData.STRING_TYPE.equals(expr.e2.type);  
            if(e1p || e2p) {
                if(e1p && e2p) {
                    errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Equality of different primitive types"));
                } else {
                    errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Equality of primitive types with non primitive type"));
                }
            }
        }
        expr.type = GlobalData.BOOL_TYPE;
    }

    public void visit(AST.neg expr, List<Error> errors) {
        if(!GlobalData.BOOL_TYPE.equals(expr.type)) {
            errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Negation of non bool type"));
        }
        expr.type = GlobalData.BOOL_TYPE;
    }

    public void visit(AST.object expr, List<Error> errors) {
        // TODO: get from scope/context data
    }

    public void visit(AST.int_const expr, List<Error> errors) {
        expr.type = GlobalData.INT_TYPE;
    }

    public void visit(AST.string_const expr, List<Error> errors) {
        expr.type = GlobalData.STRING_TYPE;
    }

    public void visit(AST.bool_const expr, List<Error> errors) {
        expr.type = GlobalData.BOOL_TYPE;
    }
	
}