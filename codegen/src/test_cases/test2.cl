class Fib {
    fib(i: Int, ff : Fib) : Int {
        if i = 0 then 0
        else
            if i = 1 then 1
            else ff@Fib.fib(i-1, ff) + ff@Fib.fib(i-2, ff)
        fi fi
    };
};


class Main {
    f : Fib;
    main() : Int {
        f@Fib.fib(10, f)
    };
};
