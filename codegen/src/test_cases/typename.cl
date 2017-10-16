class A {
};

class B inherits A {
};

class C inherits B {
};

class Main inherits IO {
    a : A;
    b : B <- new C;
    c : C <- new C;
    a1 : A <- new B;
    b1 : B <- new B;
    a2 : A <- new A;
    qwe : Object;
    main() : Int {
        {
            a <- new C;
            qwe <- 123;
            self@IO.out_string(a@A.type_name()@String.concat("\n"));
            self@IO.out_string(b@B.type_name()@String.concat("\n"));
            self@IO.out_string(c@C.type_name()@String.concat("\n"));
            self@IO.out_string(a1@A.type_name()@String.concat("\n"));
            self@IO.out_string(b1@B.type_name()@String.concat("\n"));
            self@IO.out_string(a2@A.type_name()@String.concat("\n"));
            self@IO.out_string((1+2)@Object.type_name()@String.concat("\n"));
            self@IO.out_string(qwe@Object.type_name()@String.concat("\n"));
            123@Int.abort();
            0;
        }
    };
};
