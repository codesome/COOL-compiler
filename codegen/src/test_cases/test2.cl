class Fib {
    a : Int <- 10;
    fff() : Int {
        self@Fib.fib(a)
    };
    fib(i: Int) : Int {
        if i = 0 then 0
        else
            if i = 1 then 1
            else self@Fib.fib(i-1) + self@Fib.fib(i-2)
        fi fi
    };
};


class Main inherits IO {
    f : Fib;
    main() : Int {
        {
            self@IO.out_int(f@Fib.fff());
            99;
        }
    };
};
