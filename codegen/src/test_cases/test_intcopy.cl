class A {
    a : Int;
    getA() : Int {
        a
    };
    setA(x : Int) : Int {
        a <- x
    };
};

class B {
    f2(a : A) : Int {
        {
            a <- new A;
            0;
        }
    };
};

class Main inherits IO {
    b : B <- new B;
    a : A <- new A;
    main() : Int {
        {
            a.setA(1);
            out_int(a.getA());
            b.f2(a);
            out_int(a.getA());  
            0; 
        }
    };
};
