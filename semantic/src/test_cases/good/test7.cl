(* Rules for identifiers *)

class A {
    a : Int;
    f1() : Int {
        a
    };
    f2(a : String) : Int {
        {
           a.concat("Hello");
           let a : Bool in
           {
               a <- true;
           };
           0;
        }
    };
};

class B {
    f3() : B {
        self
    };
    f4() : Int {
        let a : Int in
        {
           self;
           0;
        }
    };
};

class Main {
    main() : Int {
        0
    };
};


