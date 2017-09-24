(* Rules for arithmetic, comparison, and unary operators *)

class A {
    a : Int;
};

class B {
    b : Int;
};

class C {
    a : A;
    b : B;
    c : Int;
    d : Int;
    e : String;
    f : String;
    g : Bool;
    h : Bool;
    f1() : Int {
        {
            c+d;
            c-d;
            c*d;
            c/d;
        }
    };
    f2() : Bool {
        {
            c<d;
            c<=d;
        }
    };
    f3() : Bool {
        {
            a=b;
            c=d;
            e=f;
            g=h;
        }
    };
    f4() : Int {
        ~c
    };
    f5() : Bool {
        not g
    };
};

class Main {
    main() : Int {
        0
    };
};
