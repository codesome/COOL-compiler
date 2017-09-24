(* Rules for Let expressions *)

class A {
    a : Int;
};

class B {
    f1() : Int {
        let a : A, b : Int, c : String, d : Bool in {
            a;
            b;
            c;
            d;
            0;
        }
    };
    f2() : Bool {
        let a : A, a : Int, a : String, a : Bool in {
            a <- true;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
