class A {
    a : Int <- "A".length();
    f1() : Int {
        0
    };
};

class Main {
    main() : Int {
        {
            (1+2)@Object.abort();
            0;
        }
    };
};
