(* Cyclic inheritance *)

class A inherits C {
    a : Int;
};

class B inherits A {
    b : Int;
};

class C inherits B {
    c : Int;
};

class Main {
    main() : Int {
        0
    };
};
