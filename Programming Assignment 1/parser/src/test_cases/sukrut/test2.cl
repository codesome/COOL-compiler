(* Verifies rules : feature : OBJECTID LPAREN ( formal (COMMA formal)* )? RPAREN COLON TYPEID LBRACE expr RBRACE 
		                    | OBJECTID COLON TYPEID ( ASSIGN expr )?
		                    ;
		            formal	: OBJECTID COLON TYPEID ;        
*)

class A {
    a() : Int { -- feature with no formal
        {
            0;
        }
    };
    
    b(c : Int) : IO { -- feature with one formal
        new IO.out_string("Hello World!\n")
    };
    
    func(arg1 : String, arg2: Bool, arg3 : Int) : Object { -- feature with multiple formal
        {
            new IO.out_int(arg3);
            self;
        }    
    };
};

class B {
  a : Int; -- feature with no assignment
  b : Bool <- true; -- feature with assignment
  c : String <- "Hello";
  d : Int <- 0;  
};
