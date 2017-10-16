class A inherits IO {
    a : Int;
};

class B {
    b : Int;
};

class C inherits B {
    c : Int;
};

class E {
    a : A <- new A;
    b : B <- new B;
    c : C <- new C;
    e1 : Object <- new A;
    e2 : Object <- new Int;
    e3 : Object <- new IO;
    e4 : Object <- new String;
    e5 : Object <- new Bool;
    f : IO <- new IO;
    g : IO <- new A;
    i : B <- new C;
    
    checkTypes() : Int {
        {
            f@IO.out_string("\nA<-A : "@String.concat(a@A.type_name()));
            f@IO.out_string("\nB<-B : "@String.concat(b@B.type_name()));
            f@IO.out_string("\nC<-C : "@String.concat(c@C.type_name()));
            f@IO.out_string("\nObject<-A : "@String.concat(e1@Object.type_name()));
            f@IO.out_string("\nObject<-Int : "@String.concat(e2@Object.type_name()));
            f@IO.out_string("\nObject<-IO : "@String.concat(e3@Object.type_name()));
            f@IO.out_string("\nObject<-String : "@String.concat(e4@Object.type_name()));
            f@IO.out_string("\nObject<-Bool : "@String.concat(e5@Object.type_name()));
            f@IO.out_string("\nIO<-IO : "@String.concat(f@IO.type_name()));
            f@IO.out_string("\nIO<-A : "@String.concat(g@IO.type_name()));
            f@IO.out_string("\nB<-C : "@String.concat(i@B.type_name()));
            0;
        }  
    };
};

class Main {
    e : E <- new E;
    main() : Int {
        {
            e@E.checkTypes();
        }
    };
};
