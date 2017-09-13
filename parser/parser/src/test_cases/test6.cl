(* Verifies rules: expr    : CASE expr OF (OBJECTID COLON TYPEID DARROW expr SEMICOLON)+ ESAC             
	                       | ISVOID expr
	                       | <assoc=right>OBJECTID ASSIGN expr
*)

class A {
    a : Int;
    
    func1() : Int {
        {
            case a of -- CASE expr OF OBJECTID COLON TYPEID DARROW expr SEMICOLON ESAC
                b : Int => a+b;
            esac;
            0;  
        }        
    };    
};

class B inherits A {
    
};

class C {
    b : B <- new B;
    
    func() : Int {
        {
            case b of -- CASE expr OF (OBJECTID COLON TYPEID DARROW expr SEMICOLON)+ ESAC
                var1 : A => var1;
                var2 : B => b;
            esac;
            0;
        } 
    };
};

class SomeClass {
    a : A;
    
    v1 : Int;
    v2 : Int; 
    v3 : Int;
    
    func1() : Bool {
        if isvoid a then true else false fi -- ISVOID expr
    };
    
    func2() : Int {
        {
            v1 <- 0; -- <assoc=right>OBJECTID ASSIGN expr
            v1 <- v2 <- v3 <- 0; -- <assoc=right>OBJECTID ASSIGN expr
        }
    };
};
