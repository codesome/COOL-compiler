(* Type annotations for blocks *)

class A {
    a : Int;
};

class B inherits A {
    b : Int;
};

class C {
    a : A;
    b : B;
    c : A <- new B;
    d : Int;
    e : String;
    f : Bool;
    f1() : Int {
        {
            a;
            b;
            d;
        }
    };
    f2() : Int {
        {
            {
                a;
                b;
            };
            {
                b;
                a;
            };
            {
                e;
                b;
                c;
            };
            {
                a;
                b;
                f;
            };
            0;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
