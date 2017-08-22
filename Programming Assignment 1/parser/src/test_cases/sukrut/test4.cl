(* Verifies rules : expr    : IF expr THEN expr ELSE expr FI
	                        | WHILE expr LOOP expr POOL
	                        | LBRACE (expr SEMICOLON)+ RBRACE
	                        | TILDE expr
	                        | expr EQUALS expr
	                        | NOT expr
	                        ;
*)

class A {
    a : Int;
    b : Bool;

    func1() : Int {
        {
          if b then a else 0 fi; -- IF expr THEN expr ELSE expr FI
          if a=~1 then -- TILDE expr
          { -- LBRACE expr SEMICOLON RBRACE
             1; 
          }
          else
          {
             0;
          }
          fi;
        }      
    };
    func2() : Int {
        {
          while not b loop a pool; -- WHILE expr LOOP expr POOL, NOT expr
          while a=1 -- expr EQUALS expr
          loop { -- LBRACE (expr SEMICOLON)* RBRACE
              1;
              0;
              2;
          }
          pool;
        }    
    };
  
    
};
