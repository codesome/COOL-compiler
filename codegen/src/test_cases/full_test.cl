class SimpleExprTests inherits IO {
	a : Int;
	b : Bool;
	c : Object;
	e : Int;
	f : Object;

	binOpTest(x : Int, y : Int) : Int {
		{
			self@IO.out_string("Testing binary arithmetic operations\n");
			self@IO.out_string("Operands are : ");
			self@IO.out_int(x);
			self@IO.out_string(" ");
			self@IO.out_int(y);
			self@IO.out_string("\nSum : ");
			a <- x + y;
			self@IO.out_int(a);
			self@IO.out_string("\nDifference : ");
			a <- x - y;
			self@IO.out_int(a);
			self@IO.out_string("\nProduct : ");
			a <- x * y;
			self@IO.out_int(a);
			self@IO.out_string("\nQuotient : ");
			a <- x / y;
			self@IO.out_int(a);
			self@IO.out_string("\nNegation of first : ");
			a <- ~x;
			self@IO.out_int(a);
			self@IO.out_string("\nComparing these operands now\n");
			self@IO.out_string("Less than : ");
			a <- if x < y then x else y fi;
			if a = x
			then self@IO.out_string("First is lesser or equal\n")
			else self@IO.out_string("First is greater or equal\n")
			fi;
			if x<=y
			then self@IO.out_string("First is lesser or equal\n")
			else self@IO.out_string("First is greater\n")
			fi;
			if x = y
			then self@IO.out_string("Both are equal\n")
			else self@IO.out_string("Both are not equal\n")
			fi;
			b <- true;
			if b
			then self@IO.out_string("Bool value is true\n")
			else self@IO.out_string("Bool value is false\n")
			fi;
			if not b
			then self@IO.out_string("It's complement is true\n")
			else self@IO.out_string("It's complement is false\n")
			fi;
			self@IO.out_string("Completed\n\n");
			0;
		}	
	};

	ifElseTest(x : Int, y : Int, z : Int) : Int {
		{
			self@IO.out_string("Testing if-else by finding the smallest of three numbers\n");
			self@IO.out_string("The numbers are : \n");
			self@IO.out_int(x);
			self@IO.out_string(" ");
			self@IO.out_int(y);
			self@IO.out_string(" ");
			self@IO.out_int(z);
			self@IO.out_string("\nThe smallest among them is : ");
			a <- if x <= y then {
				if x <= z then x else z fi;
			}
			else {
				if y <=z then y else z fi;
			}
			fi;
			self@IO.out_int(a);
			self@IO.out_string("\nCompleted\n\n");
			0;
		}
	};

	loopTest1(x : Int) : Int {
		{
			self@IO.out_string("Loop Test 1 : Print numbers from 1 to n\n");
			self@IO.out_string("n = ");
			self@IO.out_int(x);
			self@IO.out_string("\n");
			a <- 1;
			c <- while a <= x loop {
				self@IO.out_int(a);
				self@IO.out_string(" ");
				a <- a + 1;
			} pool;
			self@IO.out_string("\nChecking value returned by loop\n");
			if isvoid c then {
				self@IO.out_string("Value returned is void\n");
			}
			else {
				self@IO.out_string("Value returned is not void\n");
			}
			fi;
			isvoid a;
			self@IO.out_string("Completed\n\n");
			0;
		}
	};

	loopTest2(x : Int) : Int {
		{
			self@IO.out_string("Loop Test 2 : Print a right angled triangle using * given the size n\n");
			self@IO.out_string("n = ");
			self@IO.out_int(x);
			self@IO.out_string("\n");
			a <- 0;
			while a < x loop {
				e <- 0;
				while e <= a loop {
					self@IO.out_string("*");
					e <- e + 1;
				}
				pool;
				self@IO.out_string("\n");
				a <- a + 1;
			}
			pool;
			self@IO.out_string("Completed\n\n");
			0;
		}
	};
};

class Main {
	e : SimpleExprTests <- new SimpleExprTests;
	main() : Int {
		{
			e@SimpleExprTests.binOpTest(3,4);
			e@SimpleExprTests.binOpTest(2,2);
			e@SimpleExprTests.ifElseTest(6, 3, 8);
			e@SimpleExprTests.loopTest1(10);
			e@SimpleExprTests.loopTest2(10);
			e@SimpleExprTests.binOpTest(4,0);
		}
	};
};