(* Predicate of a conditional or a loop not Bool *)

class A {
    f1(x : Int, y : String) : Int {
        {
            if x then 0 else 1 fi;
            if y then 0 else 1 fi;
            0;
        }
    };
};

class B {
    f2(x : Int, y : String, z : Int) : Int {
        {
            while x loop z <- z+1 pool;
            while y loop z <- z+1 pool;
            0;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
