class Main {
    a : A;
    main() : Int {
        let b : Int in
        {
            if isvoid a then
            {
                new IO.out_string("void");
            }
            else 
            {
                new IO.out_string("not void");
            }
            fi;
            0;
        }
    };
};

class A {
    a : Int;
};
