class Main inherits IO {
    a : Int;
    b : Int;
    c : String;
    g : String;
    e : A;
    f : A <- new A;
    h : B <- new B;
    i : A;
    main() : Int {
        {
(*            a <- 1;
            out_int(a);
            b <- a;
            out_int(b);
            b <- 2;
            out_int(a);
            f.setA(1);
            out_int(f.getA());
            e <- f;
            out_int(e.getA());
            e.setA(2);
            out_int(f.getA());
            out_int(e.getA());
            c <- "AAA";
            g <- c;
            out_string(g);
            g <- "BBB";
            out_string(c); *)
            i <- h.getA();
            out_int(i.getA());
            h.setAVal();
            out_int(i.getA());
            0;
        }
    };
};

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
    a : A <- new A;
    getA() : A {
        {
            a.setA(1);
            a; 
        }
    };
    setAVal() : Int {
        {
            a.setA(2);
            0;
        }
    };
};
