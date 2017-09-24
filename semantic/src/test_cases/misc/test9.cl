(* Redefining parent's attribute works? *)

class A {
    a : Int;
};

class B inherits A {
    b : Int <- a;
    f() : Int {
        {
            b <- 1;
            a <- b;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
