class A {
    qwe : Int <- 5;
    f() : Int {
        99
    };
};


class Main inherits IO {
    a : Int <- 10;
    r : Int;
    s : String <- "This is a string";
    ns : String <- s@String.concat(" , and appended new string\n");
    y : Int <- s@String.length();
    xx : A <- new A;
    main () : IO {
        self@IO.out_string(ns)
    };
};
