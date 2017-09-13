(* Verifies rules : expr	: expr (ATSYM TYPEID)? DOT OBJECTID LPAREN (expr (COMMA expr)* )? RPAREN
	                    	| OBJECTID LPAREN (expr (COMMA expr)* )? RPAREN
	                    	| NEW TYPEID
	                    	| OBJECTID
	                        | INT_CONST
	                        | STR_CONST
	                        | BOOL_CONST
	                    	;
*)

class A {
    
    func1() : Int {
        var1 -- OBJECTID   
    };
    func2(arg : Bool) : Int {
        0 -- INT_CONST
    };
    func3(arg1 : Int, arg2 : Bool) : Bool {
        true -- BOOL_CONST
    };
    var1 : Int;
          
};

class C inherits A {
    
    func1() : Int {
        0
    };
    func2(arg : Bool) : Int {
        0
    };
    func3(arg1 : Int, arg2 : Bool) : Bool {
        false
    };
    var2 : Int;
};

class B {
    a : A <- new A; -- NEW TYPEID
    c : C <- new C;
    functionexample() : Int {
        {
            a.func1(); -- expr DOT OBJECTID LPAREN RPAREN
            c@A.func1(); -- expr ATSYM TYPEID DOT OBJECTID LPAREN RPAREN
            a.func2(true); -- expr DOT OBJECTID LPAREN expr RPAREN 
            c@A.func2(false); -- expr ATSYM TYPEID DOT OBJECTID LPAREN expr RPAREN
            a.func3(1,false); -- expr DOT OBJECTID LPAREN (expr (COMMA expr)* )? RPAREN
            c@A.func3(0,true); -- expr ATSYM TYPEID DOT OBJECTID LPAREN (expr (COMMA expr)* )? RPAREN
            func1(); -- OBJECTID LPAREN RPAREN
            func2(1); -- OBJECTID LPAREN expr RPAREN
            func3(1,true); -- OBJECTID LPAREN (expr (COMMA expr)* )? RPAREN
        }  
    };
    
    func1() : Int {
        0
    };
    func2(arg : Int) : String {
        "Hello" -- STR_CONST
    };
    func3(arg1 : Int, arg2 : Bool) : Int {
        0
    };
    
};
