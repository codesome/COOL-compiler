(* Test rules of methods *)

class A {
    a : Int;
    f1(x : Int, y : String) : Int {
        0
    };
};

class B inherits A {
    b : Int;
    f1(a : Int, b : String) : Int {
        1
    };
};

class C {
    b : B <- new B;
    f1(x : Int, y : String) : Int {
        0
    };
    f2() : A {
        b
    };
};

class D {
    a : Int;
    f1(a : String) : String {
        a.concat("Hello")
    };
};

class Main {
    main() : Int {
        0
    };
};
