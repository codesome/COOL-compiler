(* Type annotations for new and isvoid *)

class A {
    a : Int;
};

class B inherits A {
    b : Int;
};

class C {
    a : A <- new A;
    b : B <- new B;
    c : A <- new B;
    d : Object <- new Int;
    e : Int <- new Int;
    f : String <- new String;
    g : Bool <- new Bool;
    h : Object <- new Object;
    i : IO <- new IO;
};

class D {
    a : A;
    f1() : Bool {
        isvoid a
    };
};

class Main {
    main() : Int {
        0
    };
};
