package cool;

import java.util.List;

abstract class ExpressionVisitorImpl implements Visitor {

    private boolean nonIntegerExpression(AST.expression e1, AST.expression e2) {
        // both should be int
        return !GlobalData.INT_TYPE.equals(e1.type) || !GlobalData.INT_TYPE.equals(e2.type);
    }

    // TODO
    public void visit(AST.no_expr expr) {
        expr.type = null; // TODO check!
    }

    // TODO
    public void visit(AST.assign expr) {
        // get type of n - say, idtype
        expr.e1.accept(this);
        if(!isConforming(idtype, expr.e1.type)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "The type of of the expression does not conform to the declared type of the identifier"));
        }
        expr.type = expr.e1.type;
    }

    // TODO
    public void visit(AST.static_dispatch expr) {
        // Name mangling?
    }

    // TODO
    public void visit(AST.dispatch expr) {
        // Name mangling?
    }

    // TODO
    public void visit(AST.cond expr) {
        expr.predicate.accept(this);
        expr.ifbody.accept(this);
        expr.elsebody.accept(this);
        if(!expr.predicate.type.equals(GlobalData.BOOL_TYPE)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Predicate of condition must be of Bool type"));
        }
        expr.type = getJoinOf(expr.ifbody.type, expr.elsebody.type);
        
    }

    // TODO
    public void visit(AST.loop expr) {
        expr.predicate.accept(this);
        expr.body.accept(this);
        if(!expr.predicate.type.equals(GlobalData.BOOL_TYPE)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Predicate of while must be of Bool type"));
        }
        expr.type = "Object";
    }

    // TODO
    public void visit(AST.block expr) {
        lastexpr = expr.l1.size()-1;
        expr.l1.get(lastexpr).accept(this);
        expr.type = expr.l1.get(lastexpr).type;
    }

    // TODO
    public void visit(AST.let expr) {
        expr.value.accept(this);
        if(!isConforming(expr.typeid, expr.value.type)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "The type of of the expression does not conform to the declared type of the identifier"));
        }
        expr.body.accept(this);
        expr.type = expr.body.type;
    }

    // TODO
    public void visit(AST.typcase expr) {
        expr.predicate.accept(this);
        expr.type = expr.branches.get(0); // branches have at least one element always
        for(branch b : branches) {
            expr.b.accept(this);
            expr.type = getJoinOf(expr.type, expr.b.type);
        }
    }
    public void visit(AST.branch expr) {
        // TODO add id to scope table, set type of id?
        expr.value.accept(this);
        expr.type = expr.value.type;
    }

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
        // if its equal, doesnt matter if its primary or
        // non primary type. Hence check only if not equal
        if(!expr.e1.type.equals(expr.e2.type)) {
            // e1 is primary
            boolean e1p = GlobalData.INT_TYPE.equals(expr.e1.type) || GlobalData.BOOL_TYPE.equals(expr.e1.type) 
                || GlobalData.STRING_TYPE.equals(expr.e1.type);
            // e2 is primary
            boolean e2p = GlobalData.INT_TYPE.equals(expr.e2.type) 
                || GlobalData.BOOL_TYPE.equals(expr.e2.type) || GlobalData.STRING_TYPE.equals(expr.e2.type);  
            if(e1p && e2p) {
                GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Equality of different primitive types"));
            } else if(e1p || e2p) {
                GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Equality of primitive types with non primitive type"));
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
