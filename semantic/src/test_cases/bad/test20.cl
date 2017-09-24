(* Incorrectly redefining Object's and IO's members *)

class A inherits Object {
    a : Int;
    b() : Int {
        0
    };
    abort(x : Int) : Object {
        self
    };
    type_name(x : Int) : String {
        "A"
    };
};

class B inherits Object {
    a : Int;
    b() : Int {
        0
    };
    abort(x : Int) : Int {
        0
    };
    type_name(x : Int) : Int {
        0
    };
    copy(x : Int) : Int {
        0
    };
};

class C inherits IO {
    a : Int;
    b() : Int {
        0
    };
    in_string(x : Int) : String {
        "A"
    };
    in_int(x : Int) : Int {
        0
    };
};

class D inherits IO {
    a : Int;
    b() : Int {
        0
    };
    out_string() : Int {
        0
    };
    in_string() : Int {
        0
    };
    out_int() : Int {
        0
    };
    in_int() : String {
        "A"
    };     
};

class Main {
    main() : Int {
        0
    };
};
