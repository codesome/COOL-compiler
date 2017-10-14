class A {
    f() : Int {
        10
    };
};

class B inherits A {
    f() : Int {
        20
    };
};

class C inherits B {
};

class Main inherits IO {
    c : C <- new C;
    b : B <- new C;
    x : Int;
    y : String;
    main() : String {
        {
            x <- self@IO.in_int();
            self@IO.out_string("Your number is ");
            self@IO.out_int(x);
            self@IO.out_string("\n");
            y <- self@IO.in_string();
            self@IO.out_string("Your string is ");
            self@IO.out_string(y);
            self@IO.out_string("\n");
            "I will return a string";
        }
    };
};
