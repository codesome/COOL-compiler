parser grammar CoolParser;

options {
    tokenVocab = CoolLexer;
}

@header{
    import java.util.List;
}

@members{
    String filename;
    public void setFilename(String f){
        filename = f;
    }

/*
    DO NOT EDIT THE FILE ABOVE THIS LINE
    Add member functions, variables below.
*/

}

/*
    Add appropriate actions to grammar rules for building AST below.
*/

program returns [AST.program value] : 
    cl=class_list EOF {
        $value = new AST.program($cl.value, $cl.value.get(0).lineNo);
    };                    

class_list returns [List<AST.class_> value] 
    @init {
        $value = new ArrayList<>();
    }
    : (cl = class_ SEMICOLON { $value.add($cl.value); })*;

class_ returns [AST.class_ value] 
    : 
    cl=CLASS t=TYPEID LBRACE fl=feature_list RBRACE {
        $value = new AST.class_($t.getText(), filename, null, 
                $fl.value, $cl.getLine());
    }
    |
    cl=CLASS t=TYPEID (INHERITS pcl=TYPEID) LBRACE fl=feature_list RBRACE {
        $value = new AST.class_($t.getText(), filename, $pcl.getText(),
                $fl.value, $cl.getLine());
    };

feature_list returns [List<AST.feature> value] 
    @init {
        $value = new ArrayList<>();
    }
    : (f = feature SEMICOLON { $value.add($f.value); })*;

feature returns [AST.feature value]: 
    // method without formal_list
    m=OBJECTID LPAREN RPAREN COLON t=TYPEID LBRACE b=expr RBRACE {
        $value = new AST.method($m.getText(), new ArrayList<AST.formal>(), 
            $t.getText(), $b.value, $m.getLine());
    }
    |
    // method with formal_list
    m=OBJECTID LPAREN f=formal_list RPAREN COLON t=TYPEID LBRACE b=expr RBRACE {
        $value = new AST.method($m.getText(), $f.value, $t.getText(), 
            $b.value, $m.getLine());
    }
    // attr without assignment
    | v=OBJECTID COLON t=TYPEID {
        $value = new AST.attr($v.getText(), $t.getText(), new AST.no_expr($v.getLine()),
            $v.getLine());
    }
    |
    // attr with assignment
    | v=OBJECTID COLON t=TYPEID ( ASSIGN e=expr ) {
        $value = new AST.attr($v.getText(), $t.getText(), $e.value, $v.getLine());
    };

formal_list returns [List<AST.formal> value]
    @init {
        $value = new ArrayList<>();
    }
    : f=formal { $value.add($f.value); } 
    (COMMA f2=formal { $value.add($f2.value); })*;

formal returns [AST.formal value] : 
    o=OBJECTID COLON t=TYPEID {
        $value = new AST.formal($o.getText(), $t.getText(), $o.getLine());
    };

branch_list returns [List<AST.branch> value]
    @init {
        $value = new ArrayList<>();
    }
    : (b=branch { $value.add($b.value); })+;

branch returns [AST.branch value] :
    o=OBJECTID COLON t=TYPEID DARROW e=expr SEMICOLON {
        $value = new AST.branch($o.getText(), $t.getText(), $e.value, $o.getLine());
    };

block_expression_list returns [List<AST.expression> value] 
    @init {
        $value = new ArrayList<>();
    }
    : (e=expr SEMICOLON { $value.add($e.value); } )*;

expr_list returns [List<AST.expression> value]
    @init {
        $value = new ArrayList<>();
    }
    : 
    (
        e1=expr { $value.add($e1.value); }
                (COMMA e2=expr { $value.add($e2.value); })*
    )?;

let_assignment_list returns [List<AST.attr> value]
    @init {
        $value = new ArrayList<>();
    }
    : 
    f=first_let_assignment { $value.add($f.value); }
    ( la=next_let_assignment { $value.add($la.value); } )*;

first_let_assignment returns [AST.attr value]
    :
    o=OBJECTID COLON t=TYPEID {
        $value = new AST.attr($o.getText(), $t.getText(), new AST.no_expr($o.getLine()), $o.getLine());
    }
    |
    o=OBJECTID COLON t=TYPEID ASSIGN e=expr {
        $value = new AST.attr($o.getText(), $t.getText(), $e.value, $o.getLine());
    };

next_let_assignment returns [AST.attr value]
    :
    c=COMMA o=OBJECTID COLON t=TYPEID {
        $value = new AST.attr($o.getText(), $t.getText(), new AST.no_expr($c.getLine()), $c.getLine());
    }
    |
    c=COMMA o=OBJECTID COLON t=TYPEID ASSIGN e=expr{
        $value = new AST.attr($o.getText(), $t.getText(), $e.value, $c.getLine());
    };
    


expr returns [AST.expression value]: 
        
        // dispatch
        e1=expr DOT o=OBJECTID LPAREN el=expr_list RPAREN {
            $value = new AST.dispatch($e1.value, $o.getText(), $el.value, $e1.value.lineNo);
        }
        | 
        // static dispatch
        e1=expr ATSYM t=TYPEID DOT o=OBJECTID LPAREN el=expr_list RPAREN {
            $value = new AST.static_dispatch($e1.value, $t.getText(), $o.getText(), 
                $el.value, $e1.value.lineNo);
        }
        | 
        o=OBJECTID LPAREN el=expr_list RPAREN {
            $value = new AST.dispatch(new AST.no_expr($o.getLine()), $o.getText(),
                $el.value, $o.getLine());
        }
        | 
        // if e2 then e2 else e3 fi
        i=IF e1=expr THEN e2=expr ELSE e3=expr FI {
            $value = new AST.cond($e1.value, $e2.value, $e3.value, $i.getLine());
        }
        | 
        // while e1 loop e2 pool
        wh=WHILE e1=expr LOOP e2=expr POOL {
            $value = new AST.loop($e1.value, $e2.value, $wh.getLine());
        }
        | 
        // { e1; e2; e3; ... }
        lb=LBRACE bel=block_expression_list RBRACE {
            $value = new AST.block($bel.value, $lb.getLine());
        }
        | 
        l=LET lal=let_assignment_list IN e=expr {
            int size = $lal.value.size();
            for(int i=size-1; i>=0; i--) {
                AST.attr let_attr = $lal.value.get(i);
                $value = new AST.let(let_attr.name, let_attr.typeid, let_attr.value, $e.value, $l.getLine());
                break;
            }
        }
        | 
        // case e of bl esac
        c=CASE e=expr OF bl=branch_list ESAC {
            $value = new AST.typcase($e.value, $bl.value, $c.getLine());
        }
        | 
        // new t
        nw=NEW t=TYPEID {
            $value = new AST.new_($t.getText(), $nw.getLine());
        }
        | 
        // ~ e
        tl=TILDE e=expr {
            $value = new AST.comp($e.value, $tl.getLine());
        }
        | 
        // isvoid expression
        iv=ISVOID e1=expr {
            $value = new AST.isvoid($e1.value, $iv.getLine());
        }
        | 
        // multiplication
        e1=expr STAR e2=expr {
            $value = new AST.mul($e1.value, $e2.value, $e1.value.lineNo);
        }
        | 
        // division
        e1=expr SLASH e2=expr {
            $value = new AST.divide($e1.value, $e2.value, $e1.value.lineNo);
        }
        | 
        // addition
        e1=expr PLUS e2=expr {
            $value = new AST.plus($e1.value, $e2.value, $e1.value.lineNo);
        }
        | 
        // e1 - e2
        e1=expr MINUS e2=expr {
            $value = new AST.sub($e1.value, $e2.value, $e1.value.lineNo);
        }
        | 
        // e1 < e2
        e1=expr LT e2=expr {
            $value = new AST.lt($e1.value, $e2.value, $e1.value.lineNo);
        }
        | 
        // e1 <= e2
        e1=expr LE e2=expr {
            $value = new AST.leq($e1.value, $e2.value, $e1.value.lineNo);
        }
        | 
        // e1 = e2
        e1=expr EQUALS e2=expr {
            $value = new AST.eq($e1.value, $e2.value, $e1.value.lineNo);
        }
        | 
        // not expr
        nt=NOT e1=expr {
            $value = new AST.neg($e1.value, $nt.getLine());
        }
        | 
        // o <- e
        <assoc=right>o=OBJECTID ASSIGN e=expr {
            $value = new AST.assign($o.getText(), $e.value, $o.getLine());
        }
        | 
        // (e)
        LPAREN e=expr RPAREN {
            $value = $e.value;
        }
        | 
        // object
        o=OBJECTID {
            $value = new AST.object($o.getText(), $o.getLine());
        }
        | 
        // integer constant
        i=INT_CONST {
            $value = new AST.int_const(Integer.parseInt($i.getText()), $i.getLine());
        }
        | 
        // string constant
        s=STR_CONST {
            $value = new AST.string_const($s.getText(), $s.getLine());
        }
        | 
        // bool constant
        b=BOOL_CONST {
            $value = new AST.bool_const("true".equalsIgnoreCase($b.getText()), $b.getLine());
        }
        ;
