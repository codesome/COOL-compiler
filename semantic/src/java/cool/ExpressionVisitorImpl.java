package cool;

import java.util.List;

abstract class ExpressionVisitorImpl implements Visitor {

    private boolean nonIntegerExpression(AST.expression e1, AST.expression e2) {
        // both should be int
        return !Global.INT_TYPE.equals(e1.type) || !Global.INT_TYPE.equals(e2.type);
    }

    public void visit(AST.no_expr expr) {
        expr.type = "_no_type";
    }

    public void visit(AST.assign expr) {

        String type = Global.scopeTable.lookUpGlobal(expr.name);

        expr.e1.accept(this);
        if(type==null) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(),
                "Attribute '"+expr.name+"' is not defined");
        } else if(!Global.inheritanceGraph.isConforming(type, expr.e1.type)) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(),
                "The type of the expression does not conform to the declared type of the attribute: "+expr.name);
        }
            
        expr.type = expr.e1.type;
    }

    public void visit(AST.static_dispatch expr) {
        expr.caller.accept(this);
        String callerClass = expr.caller.type;
        for(AST.expression e: expr.actuals) {
            e.accept(this);
        }

        if(!Global.inheritanceGraph.hasClass(expr.typeid)) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "Undefined type: "+expr.typeid);
            expr.typeid = "Object";
            expr.type = "Object";
        } else if(!Global.inheritanceGraph.isConforming(expr.typeid, callerClass)) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), 
                "Type of caller does not conform to the type '"+expr.typeid+"' in the static dispatch '"+expr.name+"'");
            expr.type = "Object";
        } else {
            String mangledName = Global.getMangledNameWithExpressions(expr.typeid, expr.name, expr.actuals);
            String methodType = Global.mangledNameMap.getOrDefault(mangledName, null);
            if(methodType==null) {
                Global.errorReporter.report(Global.filename, expr.getLineNo(), 
                    "Undefined method '"+expr.name+"' in class '"+expr.typeid+"'");
                expr.type = "Object";
            } else {
                expr.type = methodType;
            }
        }
    }

    public void visit(AST.dispatch expr) {
        expr.caller.accept(this);
        String callerClass = expr.caller.type;
        if(Global.inheritanceGraph.isNoMethodClass(callerClass)) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "Undefined method: "+expr.name);
            return;
        }
        for(AST.expression e: expr.actuals) {
            e.accept(this);
        }
        String mangledName = Global.getMangledNameWithExpressions(callerClass, expr.name, expr.actuals);
        String methodType = Global.mangledNameMap.getOrDefault(mangledName, null);
        while(methodType==null) {
            callerClass = Global.inheritanceGraph.getParentClassName(callerClass);
            if(callerClass==null)
                break;
            mangledName = Global.getMangledNameWithExpressions(callerClass, expr.name, expr.actuals);
            methodType = Global.mangledNameMap.getOrDefault(mangledName, null);
        }
        if(methodType==null) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "Undefined method signature: "+expr.name);
            expr.type = "Object";
        } else {
            expr.type = methodType;
        }
    }

    public void visit(AST.cond expr) {
        expr.predicate.accept(this);
        expr.ifbody.accept(this);
        expr.elsebody.accept(this);
        if(!Global.BOOL_TYPE.equals(expr.predicate.type)) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "Predicate of condition must be of Bool type");
        }
        expr.type = Global.inheritanceGraph.getJoinOf(expr.ifbody.type, expr.elsebody.type);
    }

    public void visit(AST.loop expr) {
        expr.predicate.accept(this);
        expr.body.accept(this);
        if(!Global.BOOL_TYPE.equals(expr.predicate.type)) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "Predicate of while must be of Bool type");
        }
        expr.type = "Object";
    }

    public void visit(AST.block expr) {
        for(AST.expression e: expr.l1) {
            e.accept(this);
        }
        int lastexpr = expr.l1.size()-1;
        expr.type = expr.l1.get(lastexpr).type;
    }

    public void visit(AST.let expr) {
        Global.scopeTable.enterScope();

        if(!Global.inheritanceGraph.hasClass(expr.typeid)){
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "Undefined type: "+expr.typeid);
            expr.typeid = "Object";
        }
        Global.scopeTable.insert(expr.name, expr.typeid);
        
        if(!(expr.value instanceof AST.no_expr)) { // assignment exists
            // visiting expression
            expr.value.accept(this);

            // checking type of variable and assignment
            if(!Global.inheritanceGraph.isConforming(expr.typeid, expr.value.type)) {
                StringBuilder errorMessage = new StringBuilder();
                errorMessage.append("Expression doesn't conform to the declared type of attribute ")
                .append(expr.name).append(":").append(expr.typeid);
                Global.errorReporter.report(Global.filename, expr.getLineNo(), errorMessage.toString());
            }
        }

        expr.body.accept(this);
        expr.type = expr.body.type;

        Global.scopeTable.exitScope();
    }

    public void visit(AST.typcase expr) {
        expr.predicate.accept(this);
        expr.branches.get(0).accept(this); // branches have at least one element always
        expr.type = expr.branches.get(0).value.type;
        int size = expr.branches.size();
        for(int i=1; i<size; i++) {
            expr.branches.get(i).accept(this);
            expr.type = Global.inheritanceGraph.getJoinOf(expr.type, expr.branches.get(i).value.type);
        }
    }

    // This is not an expression, but used inside an expression
    public void visit(AST.branch br) {
        if(!Global.inheritanceGraph.hasClass(br.type)){
            Global.errorReporter.report(Global.filename, br.getLineNo(), "Undefined type: "+br.type);
            br.type = "Object";
        }
        Global.scopeTable.enterScope();
        Global.scopeTable.insert(br.name, br.type);
        br.value.accept(this);
        Global.scopeTable.exitScope();
    }

    public void visit(AST.new_ expr) {
        if(Global.inheritanceGraph.hasClass(expr.typeid)) {
            expr.type = expr.typeid;
        } else {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "Undefined type: "+expr.typeid);
            expr.type = "Object";
        }
    }

    public void visit(AST.isvoid expr) {
        expr.e1.accept(this);
        expr.type = Global.BOOL_TYPE;
    }

    public void visit(AST.plus expr) {
        expr.e1.accept(this);
        expr.e2.accept(this);
        if(nonIntegerExpression(expr.e1, expr.e2)) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "Addition of non int type");
        }
        expr.type = Global.INT_TYPE;
    }

    public void visit(AST.sub expr) {
        expr.e1.accept(this);
        expr.e2.accept(this);
        if(nonIntegerExpression(expr.e1, expr.e2)) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "Subtraction of non int type");
        }
        expr.type = Global.INT_TYPE;
    }

    public void visit(AST.mul expr) {
        expr.e1.accept(this);
        expr.e2.accept(this);
        if(nonIntegerExpression(expr.e1, expr.e2)) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "Multiplication of non int type");
        }
        expr.type = Global.INT_TYPE;
    }

    public void visit(AST.divide expr) {
        expr.e1.accept(this);
        expr.e2.accept(this);
        if(nonIntegerExpression(expr.e1, expr.e2)) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "Division of non int type");
        }
        expr.type = Global.INT_TYPE;
    }

    public void visit(AST.comp expr) {
        expr.e1.accept(this);
        if(!Global.BOOL_TYPE.equals(expr.e1.type)) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "Negation of non bool type");
        }
        expr.type = Global.BOOL_TYPE;
    }

    public void visit(AST.lt expr) {
        expr.e1.accept(this);
        expr.e2.accept(this);
        if(nonIntegerExpression(expr.e1, expr.e2)) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "< of non int types");
        }
        expr.type = Global.BOOL_TYPE;
    }

    public void visit(AST.leq expr) {
        expr.e1.accept(this);
        expr.e2.accept(this);
        if(nonIntegerExpression(expr.e1, expr.e2)) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "<= of non int types");
        }
        expr.type = Global.BOOL_TYPE;
    }

    public void visit(AST.eq expr) {
        expr.e1.accept(this);
        expr.e2.accept(this);
        // if its equal, doesnt matter if its primary or
        // non primary type. Hence check only if not equal
        if(!expr.e1.type.equals(expr.e2.type)) {
            // e1 is primary
            boolean e1p = Global.INT_TYPE.equals(expr.e1.type) || Global.BOOL_TYPE.equals(expr.e1.type) 
                || Global.STRING_TYPE.equals(expr.e1.type);
            // e2 is primary
            boolean e2p = Global.INT_TYPE.equals(expr.e2.type) 
                || Global.BOOL_TYPE.equals(expr.e2.type) || Global.STRING_TYPE.equals(expr.e2.type);  
            if(e1p && e2p) {
                Global.errorReporter.report(Global.filename, expr.getLineNo(), "Equality of different primitive types");
            } else if(e1p || e2p) {
                Global.errorReporter.report(Global.filename, expr.getLineNo(), "Equality of primitive types with non primitive type");
            }
        }
        expr.type = Global.BOOL_TYPE;
    }

    public void visit(AST.neg expr) {
        expr.e1.accept(this);
        if(!Global.INT_TYPE.equals(expr.e1.type)) {
            Global.errorReporter.report(Global.filename, expr.getLineNo(), "Cannot do complement of non int type");
        }
        expr.type = Global.INT_TYPE;
    }

    public void visit(AST.object expr) {
        if("self".equals(expr.name)) {
            expr.type = Global.currentClass;
        } else {
            String type = Global.scopeTable.lookUpGlobal(expr.name);
            if(type==null) {
                expr.type = "Object";
                Global.errorReporter.report(Global.filename, expr.getLineNo(), "Attribute '"+expr.name+"' is not defined");
            } else {
                expr.type = type;
            }
        }
    }

    public void visit(AST.int_const expr) {
        expr.type = Global.INT_TYPE;
    }

    public void visit(AST.string_const expr) {
        expr.type = Global.STRING_TYPE;
    }

    public void visit(AST.bool_const expr) {
        expr.type = Global.BOOL_TYPE;
    }
    
}
