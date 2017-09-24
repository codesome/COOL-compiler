(* Case identifiers hide other definitions in the previous scope *)

class A {
    a : Int;
};

class B inherits A {
    b : Int;
};

class C {
    c : Int;
    d : A;
    f1() : Int {
        {
            case d of 
                c : A => c <- 1; -- hidden only in this branch
                e : B => c <- 1; -- this is allowed
            esac;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
