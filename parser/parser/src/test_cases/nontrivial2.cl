(*
Define class Convertor with methods to convert an integer from one base to another, provided both bases
are less than or equal to 10
The representation of the number in all bases must fit in the size of an Int
*)
class Convertor {

    -- convert string digit to integer
    convInt(input : String) : Int {
		let result : Int <- 0 in
		{
			if input = "1" then result <- 1 else
			if input = "2" then result <- 2 else
			if input = "3" then result <- 3 else
			if input = "4" then result <- 4 else
			if input = "5" then result <- 5 else
			if input = "6" then result <- 6 else
			if input = "7" then result <- 7 else
			if input = "8" then result <- 8 else
			if input = "9" then result <- 9 else
            if input = "0" then result <- 0 else
            {
                abort(); 0;
            }
			fi fi fi fi fi fi fi fi fi fi;
			result;
		}
    };

    -- convert string to integer
    atoi(input_string : String, base : Int) : Int {
		let result : Int <- 0, i : Int <- 0 in
		{
            while i < input_string.length()
			loop
			{
                if base <= convInt(input_string.substr(i,1))
                then
                {
                    abort();
                    0;
                }
                else 0
                fi;
                result <- result * 10 + convInt(input_string.substr(i,1));
				i <- i + 1;
			}
			pool;
			result;
		}
    };

    -- find power of base to exponent and return result
    power(base : Int, exponent : Int) : Int {
		let i : Int <- 0, result : Int <- 1 in
		{
			if exponent = 0
			then 1
			else
			{
				while i < exponent
				loop
				{
                    result <- result * base;
                    i <- i + 1;
				}
				pool;
				result;
			}
			fi;
		}
	};

    -- find a modulo b given both are positive
    modulo(a : Int, b : Int) : Int {
		let q : Int, r : Int in
		{
            if b = 0
			then 0
			else
			{
				q <- a / b;
				r <- a - b * q;
				r;
			}
			fi;
		}
	};

    -- convert the number input from base base to base 10
    convertTo10(input : Int, base : Int) : Int {
        let i : Int <- 0, result : Int <- 0 in
        {
            while 0 < input
            loop
            {
                result <- result + power(base,i) * modulo(input,10);
                i <- i + 1;
                input <- input / 10;
            }
            pool;
            result;
        }
    };

    -- convert integer digit to string
    convString(input : Int) : String {
		let result : String in
		{
			if input = 1 then result <- "1" else
			if input = 2 then result <- "2" else
			if input = 3 then result <- "3" else
			if input = 4 then result <- "4" else
			if input = 5 then result <- "5" else
			if input = 6 then result <- "6" else
			if input = 7 then result <- "7" else
			if input = 8 then result <- "8" else
			if input = 9 then result <- "9" else
			result <- "0"
			fi fi fi fi fi fi fi fi fi;
			result;
		}
	};

    -- convert number from base 10 to base base
    convertFrom10(input : Int, base : Int) : String {
        let i : Int <- 0, result : String <- "" in
        {
            while 0 < input
            loop
            {
                result <- convString(modulo(input,base)).concat(result);
                input <- input / base;
            }
            pool;
            result;
        }
    };

    -- convert number from base source to base destination
    convertBases(input_string : String, source : Int, destination : Int) : String {
        let result : Int, input : Int, result_string : String in
        {
            input <- atoi(input_string,source);
            result <- convertTo10(input,source);
            result_string <- convertFrom10(result,destination);
            result_string;
        }
    };
};

-- Main class
class Main inherits IO {
    convertor : Convertor <- new Convertor;

    main() : Object {
        let input : String, source_base : Int, destination_base : Int in
        {
            out_string("Enter input, source base, and destination base : \n");
            input <- in_string();
            source_base <- in_int();
            destination_base <- in_int();
            out_string("The result is : (blank means 0)\n");
            out_string(convertor.convertBases(input,source_base,destination_base));
            out_string("\n");
        }
    };
};
