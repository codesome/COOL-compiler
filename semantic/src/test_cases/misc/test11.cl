(* Using other class object's attribute directly *)

class A {
    a : Int;
};

class B {
    b : A <- new A;
    f() : Int {
        {
            b.a <- 1;
            0;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
