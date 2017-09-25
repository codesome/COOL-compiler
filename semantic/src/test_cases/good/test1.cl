(* Illustrates inheritance *)

class A {
    a : Int;
};

class B inherits A {
    b : Int;
    f1(x : Int) : Int {
        0
    };
};

class C inherits B {
    f1(x : Int) : Int {
        1
    };
};

class Main {
    main() : Int {
        0
    };
};
