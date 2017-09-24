(* Incorrect static types of arithmetic operations *)

class A {
    a : String;
    b : String;
    c : Bool;
    d : Bool;
    e : Int;
    f : B;
    g : C;
    f1() : Int {
        {
            a+b;
            a+c;
            c+d;
            a+e;
            a+f;
            f+g;
        }
    };
    f2() : Int {
        {
            a-b;
            a-c;
            c-d;
            a-e;
            a-f;
            f-g;
        }
    };
    f3() : Int {
        {
            a*b;
            a*c;
            c*d;
            a*e;
            a*f;
            f*g;
        }
    };
    f4() : Int {
        {
            a/b;
            a/c;
            c/d;
            a/e;
            a/f;
            f/g;
        }
    };
};

class B {
    b : Int;
};

class C {
    c : Int;
};

class Main {
    main() : Int {
        0
    };
};
