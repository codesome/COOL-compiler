(* Verifies rules: expr    : LET OBJECTID COLON TYPEID ( ASSIGN expr )? ( COMMA OBJECTID COLON TYPEID ( ASSIGN expr )?)* IN expr
	                       | expr STAR expr
	                       | expr SLASH expr   
	                       | expr PLUS expr
	                       | expr MINUS expr
	                       | expr LT expr
	                       | expr LE expr
	                       | LPAREN expr RPAREN
	                       ;
*)

class A {
    
    func1() : Int {
        let a : Int in -- LET OBJECTID COLON TYPEID IN expr
        {
            0;
        }
    };
    
    func2() : Int {
        let a : Int <- 1 in 0 -- LET OBJECTID COLON TYPEID ASSIGN expr IN expr
    };
    
    func3() : Bool {
        let a : Int, b : Bool <- true, c : String in -- LET OBJECTID COLON TYPEID ( COMMA OBJECTID COLON TYPEID ( ASSIGN expr )?)* IN expr 
        {
            a;
            true;
        }
    };
    
    func4() : String {
        let a : Int <- 1, b : String, c : String <- "A" in -- LET OBJECTID COLON TYPEID ( ASSIGN expr )? ( COMMA OBJECTID COLON TYPEID ( ASSIGN expr )?)* IN expr
        {
            c;
        }
    };
};

class B {
    a : Int;
    b : Int;
    
    func1() : Int {
        a + b -- expr PLUS expr
    };
    
    func2() : Int {
        a - b -- expr MINUS expr
    };
    
    func3() : Int {
        a * b -- expr STAR expr
    };
    
    func4() : Int {
        a / b -- expr SLASH expr
    };
    
    func5() : Bool {
        a < b -- expr LT expr  
    };
    
    func6() : Bool {
        a <= b -- expr LE expr  
    };
    
    func7() : Bool {
        (a+b) * (a-b) < a -- LPAREN expr RPAREN
    };
};


