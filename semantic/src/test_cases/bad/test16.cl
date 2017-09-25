(* Breaking rules for dispatch *)

class A {
    a : Int;
    f4() : Int {
        0
    };
};

class B inherits A {
    b : Int;
    f4() : Int {
        1
    };
};

class C {
    b : B;
    f1(x : Int, y : String) : B {
        b
    };
    f2() : Int {
        let c : A in
        {
            c <- f1(1,"A");
            c <- f3();
            c <- f1("A");
            c <- f1("A",1);
            0;
        }
    };
};

class D {
    a : A;
    c : C;
    f3() : Int {
        {
            a <- c.f1(1,"A");
            c <- a.f1();
            a <- c.f1("A");
            a <- c.f1("A",1);
            0;
        }
    };
};

class E {
    a : B <- new B;
    b : Int;
    c : Int;
    f5() : Int{
        {
            b <- a@A.f4();
            c <- a@B.f4();
            c <- a@C.f2();
            c <- a@K.f4();
            c <- a@A.f4(1);
            0;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
