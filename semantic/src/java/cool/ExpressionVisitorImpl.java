package cool;

import java.util.List;

abstract class ExpressionVisitorImpl implements Visitor {

    private boolean nonIntegerExpression(AST.expression e1, AST.expression e2) {
        // both should be int
        return !GlobalData.INT_TYPE.equals(e1.type) || !GlobalData.INT_TYPE.equals(e2.type);
    }

    public void visit(AST.no_expr expr) {
        expr.type = "_no_type";
    }

    // TODO
    public void visit(AST.assign expr) {
        // get type of n - say, idtype
        String idtype = "Some type";
        expr.e1.accept(this);
        if(!GlobalData.inheritanceGraph.isConforming(idtype, expr.e1.type)) {
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

    public void visit(AST.cond expr) {
        expr.predicate.accept(this);
        expr.ifbody.accept(this);
        expr.elsebody.accept(this);
        if(!expr.predicate.type.equals(GlobalData.BOOL_TYPE)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Predicate of condition must be of Bool type"));
        }
        expr.type = GlobalData.inheritanceGraph.getJoinOf(expr.ifbody.type, expr.elsebody.type);
    }

    public void visit(AST.loop expr) {
        expr.predicate.accept(this);
        expr.body.accept(this);
        if(!GlobalData.BOOL_TYPE.equals(expr.predicate.type)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Predicate of while must be of Bool type"));
        }
        expr.type = "Object";
    }

    // TODO FIXME
    public void visit(AST.block expr) {
        int lastexpr = expr.l1.size()-1;
        expr.l1.get(lastexpr).accept(this);
        expr.type = expr.l1.get(lastexpr).type;
    }

    // TODO FIXME
    // TODO enter and exit scope
    // TODO check for no_expr
    public void visit(AST.let expr) {
        expr.value.accept(this);
        if(!GlobalData.inheritanceGraph.isConforming(expr.typeid, expr.value.type)) {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "The type of of the expression does not conform to the declared type of the identifier"));
        }
        expr.body.accept(this);
        expr.type = expr.body.type;
    }

    // TODO FIXME
    public void visit(AST.typcase expr) {
        expr.predicate.accept(this);
        expr.type = expr.branches.get(0).type; // branches have at least one element always
        for(AST.branch b : expr.branches) {
            b.accept(this);
            expr.type = GlobalData.inheritanceGraph.getJoinOf(expr.type, b.type);
        }
    }

    public void visit(AST.branch expr) {
        if(!GlobalData.inheritanceGraph.hasClass(expr.type)){
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Undefined type: " + expr.type));
            expr.type = "Object";
        }
        GlobalData.scopeTable.enterScope();
        GlobalData.scopeTable.insert(expr.name, expr.type);
        expr.value.accept(this);
        GlobalData.scopeTable.exitScope();
    }

    public void visit(AST.new_ expr) {
        if(GlobalData.inheritanceGraph.hasClass(expr.typeid)) {
            expr.type = expr.typeid;
        } else {
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Undefined type: " + expr.typeid));
            expr.type = "Object";
        }
    }

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
        String type = GlobalData.scopeTable.lookUpGlobal(expr.name);
        if(type==null) {
            expr.type = "Object";
            GlobalData.errors.add(new Error(GlobalData.filename, expr.getLineNo(), "Attribute '"+expr.name+"' is not defined"));
        } else {
            expr.type = type;
        }
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
