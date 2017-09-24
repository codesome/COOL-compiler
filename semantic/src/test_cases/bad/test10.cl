(* Type of method body does not conform to declared return type *)

class A {
    a : Int;
};

class B inherits A {
    b : Int;
};

class C inherits B {
    c : Int;
};

class D {
    d : Int;
};

class E {
    f1() : B {
        new B    
    };
    f2() : B {
        new A
    };
    f3() : B {
        new C
    };
    f4() : B {
        new D
    };
};

class Main {
    main() : Int {
        0
    };
};
