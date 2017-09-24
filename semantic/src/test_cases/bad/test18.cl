(* Incorrect usage of comparison operators *)

class A {
    a : Int;
};

class B {
    b : Int;
};

class C {
    a : A <- new A;
    b : B <- new B;
    c : Int;
    d : String;
    e : String;
    f : Bool;
    g : Bool;
    f1() : Int {
        {
            a<b;
            a<c;
            c<a;
            c<d;
            c<f;
            d<f;
            d<e;
            f<g;
            0;
        }
    };
    f2() : Int {
        {
            a<=b;
            a<=c;
            c<=a;
            c<=d;
            c<=f;
            d<=f;
            d<=e;
            f<=g;
            0;
        }
    };
    f3() : Int {
        {
            a=b; -- allowed
            a=c;
            c=a;
            c=d;
            c=f;
            d=f;
            d=e; -- allowed
            f=g; -- allowed
            0;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
