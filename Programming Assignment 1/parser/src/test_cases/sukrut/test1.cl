(* Verifies rules : program : class_list EOF;
                    class_list (class_list SEMICOLON)+;
                    class_ : CLASS TYPEID (INHERITS TYPEID)? LBRACE (feature SEMICOLON)* RBRACE;
*)

-- program
-- the following is the list of classes

class A { -- class not inheriting with one feature
    a : Int;
};

class B inherits IO { -- class inheriting with one feature
    func() : Int {
      {
        0;
      }  
    };
};

class C { -- class not inheriting with no feature
    
};

class D inherits A { -- class inheriting with no feature
    
};
