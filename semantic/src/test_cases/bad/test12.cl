(* Use identifier that does not exist, or refer to one in higher scope that makes it illegal *)

class A {
    a : Int;
};

class B {
    b : Int;
    f1() : Int {
        b <- a
    };
};

class C {
    c : Int;
    f2(c : String) : Int {
        {
            c <- 1;
            0;
        }
    };
};

class D {
    d : String;
    f3() : String {
        d
    };
    f4(d : Bool) : Bool {
        let d : Int <- 1 in 
        {
            d;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
