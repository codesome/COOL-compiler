(* Type annotations for assignments *)

class A {
    a : Int;
};

class B inherits A {
    b : Int;
};

class C {
    a : A;
    b : B;
    c : B;
    d : Int;
    e : String;
    f : Bool;
    f1() : Int {
        {
            a <- b;
            b <- c;
            e <- "A";
            f <- true;
            d <- 1;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
