class A {
    a : Int;
};

class B inherits A {
    b : Int;
    f1() : Int {
        0
    };
};

class Main {
    a : A <- new B;
    main() : Int {
        {
            a@B.f1();
            0;
        }
    };
};
