class Main {
    b : Bool;
    c : Int;
    a : Object <- while b loop c <- c + 1 pool;
    
    e : A <- new A;
    main() : A {
        {
            e@A.f1(1);
            e;
        }
    };
};

class A {
    a : Int <- new Int;
    b : Bool <- new Bool;
    c : String;
    f1(x : Int) : Int {
        x <- x + 1
    };
};
