(* Illegal usage of self for attribute names, in let, in case, as formal parameters, assignment to self, function named self *)

class A {
    self : Int;
};

class B {
    f1(self : Int) : Int {
        0
    };
};

class C {
    c : D;
    f2() : Int {
        {
            self <- c;
            0;
        }
    };
};

class D inherits C {
    d : Int;
};

class E {
    f3() : Int {
        let x : Int, self : String in {
             x <- 1;
             x;
        }
    };
};

class F {
    f : C;
    f4() : Int {
        case f of
            id1 : C => 0;
            self : D => 1;
        esac
    };
};

class Main {
    main() : Int {
        0
    };
};


