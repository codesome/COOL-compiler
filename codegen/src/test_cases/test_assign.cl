class A {
    a : Int <- 1;
    f1(x : Int) : Int {
        {
            x <- x + a;
        }
    };
};

class B {
    a1 : A;
    a2 : A <- new A;
    f2(x : Int, y : A) : A {
        {
            y <- a1;
            y <- new A;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
