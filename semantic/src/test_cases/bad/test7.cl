(* Function redefinition with different signature or return type *)

class A {
    f1() : Int {
        0
    };
};

class B inherits A {
    f1() : String {
        "Hello"
    };
};

class C {
    f2(x : Int) : Int {
        0
    };
};

class D inherits C {
    f2(x : String) : Int {
        0
    };
};

class E {
    f3(x : Int, y : Int) : Bool {
        true
    };
};

class F inherits E {
    f3(x : Int) : Bool {
        true
    };
};

class Main {
    main() : Int {
        0
    };
};
