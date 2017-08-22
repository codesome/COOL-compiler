(*
Define a class Float to represent floating point numbers and define methods for associated operations
Integer and fraction part must fit in an Int type
*)
class Float {

	integer : Int; --integer part
	fraction : Int; --fraction part
	sign : Bool; -- true if positive, false if negative, the sign
	padding : Int; -- number of zeroes before first non-zero digit in fraction part

	-- to initialize members to default values
	setDefault() : SELF_TYPE {
		{
			integer <- 0;
			fraction <- 0;
			sign <- true;
			padding <- 0;
			self;
		}
	};

	-- check if string is a valid float number
	checkValid(input_value : String) : Bool {
		let i : Int <- 0, found : Bool <- false, result : Bool <- true in
		{
			if input_value.length() = 0
			then result <- false
			else false
			fi;
			while i < input_value.length()
			loop
			{
				if i = 0
				then
				{
					if not input_value.substr(0,1) = "-"
					then
					{
						if not isDigit(input_value,0)
						then result <- false
						else false
						fi;
					}
					else false
					fi;
				}
				else
				{
					if input_value.substr(i,1) = "."
					then
					{
						if found
						then result <- false
						else found <- true
						fi;
					}
					else
					{
						if not isDigit(input_value,i)
						then result <- false
						else false
						fi;
					}
					fi;
				}
				fi;
				i <- i + 1;
			}
			pool;
			result;
		}
	};

	-- parse the string and populate members
	parse(input_value : String) : SELF_TYPE {
		let i : Int <- 0, found : Bool <- false, j : Int in
		{
			while i < input_value.length()
			loop
			{
				if i = 0
				then
				{
					if input_value.substr(0,1) = "-"
					then sign <- false
					else
					{
						sign <- true;
						input_value <- "+".concat(input_value);
					}
					fi;
				}
				else
				{
					if input_value.substr(i,1) = "."
					then
					{
						integer <- atoi(input_value.substr(1,i-1));
						padding <- 0;
						j <- i + 1;
						while j < input_value.length()
						loop
						{
							if input_value.substr(j,1) = "0"
							then
							{
								padding <- padding + 1;
								j <- j + 1;
							}
							else j <- input_value.length()
							fi;
						}
						pool;
						fraction <- atoi(input_value.substr(i+1,input_value.length()-i-1));
						found <- true;
					}
					else false
					fi;
				}
				fi;
				i <- i + 1;
			}
			pool;
			if found = false
			then integer <- atoi(input_value.substr(1,input_value.length()-1))
			else false
			fi;
			self;
		}
	};

	-- display the float number
	display() : String {
		let start : String <- "", i : Int <- 0 in
		{
				if not sign
				then start <- "-"
				else start <- ""
				fi;
				start <- start.concat(itoa(integer)).concat(".");
				while i < padding
				loop
				{
					start <- start.concat("0");
					i <- i + 1;
				}
				pool;
				start <- start.concat(itoa(fraction));
				start;
		}
	};

	-- compute a modulo b for positive a and b
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

	-- convert int to equivalent string
	itoa(input : Int) : String {
		let result : String <- "", r : Int in
		{
			if input = 0
			then result <- "0"
			else
			{
				while 0 < input
				loop
				{
					r <- modulo(input,10);
					result <- convString(r).concat(result);
					input <- input / 10;
				}
				pool;
			}
			fi;
			result;
		}
	};

	-- convert digit to equivalent string
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

	-- convert string to equivalent int
	atoi(input_string : String) : Int {
		let result : Int <- 0, i : Int <- 0 in
		{
			while i < input_string.length()
			loop
			{
				result <- result * 10 + convInt(input_string.substr(i,1));
				i <- i + 1;
			}
			pool;
			result;
		}
	};

	-- convert single string to equivalent int
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
			result <- 0
			fi fi fi fi fi fi fi fi fi;
			result;
		}
	};

	-- set float to a given value
	setValue(input_string : String) : SELF_TYPE {
		{
			setDefault();
			if checkValid(input_string)
			then parse(input_string)
			else false
			fi;
			self;
		}
	};

	-- check if a given string at given index is a digit
	isDigit(input_string : String, index : Int) : Bool {
		let result : Int <- 0, input : String <- "" in
		{
			input <- input_string.substr(index,1);
			if input = "0" then true else
			if input = "1" then true else
			if input = "2" then true else
			if input = "3" then true else
			if input = "4" then true else
			if input = "5" then true else
			if input = "6" then true else
			if input = "7" then true else
			if input = "8" then true else
			if input = "9" then true else
			false
			fi fi fi fi fi fi fi fi fi fi;
		}
	};

	-- get length of a given integer, i.e., number of digits
	length(temp_integer : Int) : Int {
		let i : Int <- 0 in
		{
			if temp_integer = 0
			then 1
			else
			{
				while 0 < temp_integer
				loop
				{
					temp_integer <- temp_integer / 10;
					i <- i + 1;
				}
				pool;
				i;
			}
			fi;
		}
	};

	-- get integer
	getInteger() : Int {
		integer
	};

	-- get fraction
	getFraction() : Int {
		fraction
	};

	-- set value of integer
	setInteger(input : Int) : Int {
		integer <- input
	};

	-- set value of fraction
	setFraction(input : Int) : Int {
		fraction <- input
	};

	-- get sign, positive (true) if zero
	getSign() : Bool {
		{
			if integer = 0
			then
			{
				if fraction = 0
				then true
				else sign
				fi;
			}
			else sign
			fi;
		}
	};

	-- set value of sign
	setSign(input : Bool) : Bool {
		sign <- input
	};

	-- get padding
	getPadding() : Int {
		padding
	};

	-- set value of padding
	setPadding(input : Int) : Int {
		padding <- input
	};

	-- find absolute value of difference of first and second
	abs(first : Int, second : Int) : Int {
		{
			if first < second
			then second - first
			else first - second
			fi;
		}
	};

	-- check if this is less than other. works only when padding is 0
	lessThan(other : Float) : Bool {
		let result : Bool, temp_int : Int in
		{
			if sign = true
			then
			{
				if other.getSign() = false
				then result <- false
				else
				{
					if integer < other.getInteger()
					then result <- true
					else if other.getInteger() < integer
					then result <- false
					else
					{
						if length(fraction) = length(other.getFraction())
						then result <- fraction < other.getFraction()
						else if length(fraction) < length(other.getFraction())
						then
						{
							temp_int <- other.getFraction()/power(10,length(other.getFraction()) - length(fraction));
							if fraction <= temp_int
							then result <- true
							else result <- false
		 					fi;
						}
						else
						{
							temp_int <- fraction/power(10,length(other.getFraction()) - length(fraction));
							if other.getFraction() <= temp_int
							then result <- false
							else result <- true
		 					fi;
						}
						fi fi;
					}
					fi fi;
				}
				fi;
			}
			else
			{
				if other.getSign() = true
				then result <- true
				else
				{
					if integer < other.getInteger()
					then result <- false
					else if other.getInteger() < integer
					then result <- true
					else
					{
						if length(fraction) = length(other.getFraction())
						then result <- fraction < other.getFraction()
						else if length(fraction) < length(other.getFraction())
						then
						{
							temp_int <- other.getFraction()/power(10,length(other.getFraction()) - length(fraction));
							if fraction <= temp_int
							then result <- false
							else result <- true
		 					fi;
						}
						else
						{
							temp_int <- fraction/power(10,length(other.getFraction()) - length(fraction));
							if other.getFraction() <= temp_int
							then result <- true
							else result <- false
		 					fi;
						}
						fi fi;
					}
					fi fi;
				}
				fi;
			}
			fi;
			result;
		}
	};

	-- checks if magnitude of this less than other. works only if padding is 0
	magnitudeLessThan(other : Float) : Bool {
		let result : Bool, temp_int : Int in
		{
			if integer < other.getInteger()
			then result <- true
			else if other.getInteger() < integer
			then result <- false
			else
			{
				if length(fraction) = length(other.getFraction())
				then result <- fraction < other.getFraction()
				else if length(fraction) < length(other.getFraction())
				then
				{
					temp_int <- other.getFraction()/power(10,length(other.getFraction()) - length(fraction));
					if fraction <= temp_int
					then result <- true
					else result <- false
					fi;
				}
				else
				{
					temp_int <- fraction/power(10,length(other.getFraction()) - length(fraction));
					if other.getFraction() <= temp_int
					then result <- false
					else result <- true
					fi;
				}
				fi fi;
			}
			fi fi;
			result;
		}
	};

	-- adds this to other and returns sum. works only if magnitude less than 0 and signs are same.
	add(other : Float) : Float {
		let i : Int, temp_other_fraction : Int <- other.getFraction(), result : Float <- new Float,
		temp_this_fraction : Int <- fraction in
		{
			if sign = other.getSign()
			then
			{
				result.setInteger(integer + other.getInteger());
				if length(fraction) < length(other.getFraction())
				then
				{
					i <- 0;
					while i < length(other.getFraction()) - length(fraction)
					loop
					{
						temp_this_fraction <- temp_this_fraction * 10;
						i <- i + 1;
					}
					pool;
				}
				else if length(other.getFraction()) < length(fraction)
				then
				{
					i <- 0;
					while i < length(fraction) - length(other.getFraction())
					loop
					{
						temp_other_fraction <- temp_other_fraction * 10;
						i <- i + 1;
					}
					pool;
				}
				else false
				fi fi;
				if length(temp_other_fraction) < length(temp_this_fraction + temp_other_fraction)
				then
				{
					result.setFraction(modulo(temp_this_fraction + temp_other_fraction,power(10,length(temp_this_fraction))));
					result.setInteger(result.getInteger() + (temp_this_fraction + temp_other_fraction)/power(10,length(temp_this_fraction)));
				}
				else
				{
					result.setFraction(temp_this_fraction + temp_other_fraction);
				}
				fi;
				result.setSign(getSign());
				result;
			}
			else false
			fi;
			result;
		}
	};

	-- checks if this is equal to other. works only if padding is 0.
	equals(other : Float) : Bool {
		{
			if sign = other.getSign()
			then
			{
				if integer = other.getInteger()
				then
				{
					if fraction = other.getFraction()
					then true
					else false
					fi;
				}
				else false
				fi;
			}
			else false
			fi;
		}
	};

	-- compute base power exponent and return result
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
				}
				pool;
				base;
			}
			fi;
		}
	};
};

class Main inherits IO {
	test_string_first : String;
	test_string_second : String;
	test_float_first : Float <- new Float;
	test_float_second : Float <- new Float;
	test_float_result : Float;
	main() : Object {
		{
			out_string("Enter two float numbers : \n");
			test_string_first <- in_string();
			test_float_first.setValue(test_string_first);
			out_string("The first number is : ".concat(test_float_first.display()).concat("\n"));
			test_string_second <- in_string();
			test_float_second.setValue(test_string_second);
			out_string("The second number is : ".concat(test_float_second.display()).concat("\n"));
			if test_float_first.getSign() = test_float_second.getSign()
			then
			{
				if test_float_first.getPadding() = 0
				then
				{
					if test_float_second.getPadding() = 0
					then
					{
						test_float_result <- test_float_first.add(test_float_second);
						out_string("The sum is : ".concat(test_float_result.display()).concat("\n"));
					}
					else
					{
						out_string("Non-zero padding not supported!\n");
					}
					fi;
				}
				else out_string("Non-zero padding not supported!\n")
				fi;
			}
			else
			{
				out_string("Addition not supported if signs are opposite or one of the numbers is 0\n");
			}
			fi;
			self;
		}
	};
};
