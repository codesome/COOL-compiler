(* Incorrect usage of unary operators *)

class A {
    a : Int;
};

class B {
    a : A;
    b : Int;
    c : String;
    d : Bool;
    f1() : Int {
        {
            ~a;
            ~c;
            ~d;
            0;
        }
    };
    f2() : Int {
        {
            not a;
            not b;
            not c;
            0;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
