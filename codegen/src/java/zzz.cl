class A {
a : Int;
};

class B inherits A {
b : Int;
};

class C inherits B {
c : Int;
};

class D {
x : A <- new C;
y : A <- new C;
};

class Main {
d : D <- new D;
    main() : Int {
        {
            0;
        }
    };
};
