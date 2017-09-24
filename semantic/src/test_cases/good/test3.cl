(* Attributes and initialization *)

class A {
    a : Int;
};

class B inherits A {
    b : Int;
};

class C {
    a : A <- new A;
    b : B <- new B;
    c : Int;
    d : Int <- 1;
    e : Int <- c;
    f : String;
    g : String <- "A";
    h : String <- f;
    i : Bool;
    j : Bool <- true;
    k : Bool <- i;
    l : A <- a;
    m : A <- b;
};

class Main {
    main() : Int {
        0
    };
};
