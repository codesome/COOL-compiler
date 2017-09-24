(* Objects that are not initialized, except from Int, String, Bool, are void *)

class A {
    a : Int;
};

class B {
    a : A;
    b : Int;
    c : String;
    d : Bool;
    e : Object;
    f : IO;
};

class Main {
    main() : Int {
        0
    };
};
