(* Repeat attribute in inherited class *)

class A {
    a : Int;
};

class B inherits A {
    a : Int;
};

class C {
    c : Int;
};

class D inherits C {
    c : String;
};

class Main {
    main() : Int {
        0
    };
};
