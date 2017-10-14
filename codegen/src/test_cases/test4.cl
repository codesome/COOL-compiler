class A {
    f() : Int {
        99
    };
};

class Main inherits IO {
    a : Int <- 10;
    b : Int <- 0;
    x : A;
    main() : Int {
        {
            self@IO.out_string("Yesss");
            x@A.f();
        }
    };
};
