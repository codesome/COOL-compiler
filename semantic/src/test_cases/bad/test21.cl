(* Redefine attributes or methods in the same scope *)

class A {
    a : Int;
    a : Int;
};

class B {
    b : Int;
    b : String;
};

class C {
    f1() : Int {
        0
    };
    f1(x : Int) : Int {
        0
    };
};

class D {
    f2() : Int {
        0
    };
    f2() : Int {
        0
    };
};

class Main {
    main() : Int {
        0
    };
};
