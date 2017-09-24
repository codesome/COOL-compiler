(* Check methods of the Object, IO, and String classes, and inheritance from Object and IO *)

class A {
    a : Object;
    b : String;
    f1() : Int {
        {
            a.abort();
            b <- a.type_name();
            0;
        }
    };
};

class B {
    a : IO;
    b : String;
    c : Int;
    f2() : Int {
        {
            a.out_string("A");
            a.out_int(1);
            b <- in_string();
            c <- in_int();
            0;
        }
    };
};

class C {
    a : String;
    b : Int;
    c : String;
    f3() : Int {
        {
            b <- a.length();
            c <- a.concat("A");
            c <- a.substr(1,2);
            0;
        }
    };
};

class E inherits Object {
    f4() : Int {
        {
            abort();
            type_name();
            0;
        }
    };
};

class F inherits IO {
    a : String;
    b : Int;
    f5() : Int {
        {
            out_string("A");
            out_int(1);
            a <- in_string();
            b <- in_int();
        }
    };
};

class Main {
    main() : Int {
        0
    };
};
