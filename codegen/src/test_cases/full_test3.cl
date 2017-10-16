class A {
	a : Int <- 1;
};

class B inherits A {
	b : Int;
};

class C inherits B {
	c : Int <- 3;
	i : IO <- new IO;
	o : Object <- new Object;
	s : String <- "Hello";

	useInheritedAttributes() : Int {
		{
			i@IO.out_string("A->B->C, A has a member a with value 1. Printing it from C\n");
			i@IO.out_int(a);
			i@IO.out_string("\nCompleted\n\n");
			0;
		}
	};

	testObjectFunctions() : Int {
		{
			i@IO.out_string("Calling functions in Object class\n");
			i@IO.out_string("abort() : ");
			o@Object.abort();
			i@IO.out_string("\nCompleted\n\n");
			0;
		}
	};

	testIOFunctions(s : String, c : Int) : Int {
		{
			i@IO.out_string("Calling functions in IO class\n");
			i@IO.out_string("out_string() : (will print s argument, but class member contains 'Hello')\n");
			i@IO.out_string(s);
			i@IO.out_string("\nout_int() : (will print c argument, but class member contains 3)\n");
			i@IO.out_int(c);
			i@IO.out_string("\nin_string() : (enter a string)\n");
			s <- i@IO.in_string();
			i@IO.out_string("\nGot string : ");
			i@IO.out_string(s);
			i@IO.out_string("\nin_int() : (enter a int)\n");
			c <- i@IO.in_int();
			i@IO.out_string("\nGot int : ");
			i@IO.out_int(c);
			i@IO.out_string("\nCompleted\n\n");
			0;
		}
	};

	testStringFunctions(s1 : String, s2 : String, x : Int, l : Int) : Int {
		{
			i@IO.out_string("Calling functions in String class\n");
			i@IO.out_string("Input String : ");
			i@IO.out_string(s1);
			i@IO.out_string("\nTo concat with : ");
			i@IO.out_string(s2);
			i@IO.out_string("\nTo get substring at index i of length l, where i and l are given by : ");
			i@IO.out_int(x);
			i@IO.out_string(" ");
			i@IO.out_int(l);
			i@IO.out_string("\nlength() : ");
			i@IO.out_int(s1@String.length());
			i@IO.out_string("\nlength() of 'A String' : ");
			i@IO.out_int("A String"@String.length());
			i@IO.out_string("\nconcat() : ");
			i@IO.out_string(s1@String.concat(s2));
			i@IO.out_string("\nconcat() 'A String': ");
			i@IO.out_string("A String"@String.concat(s2));
			i@IO.out_string("\nsubstr() : ");
			i@IO.out_string(s1@String.substr(x,l));
			i@IO.out_string("\nCompleted\n\n");
			0;
		}
	};

};

class Main {
	c : C <- new C;
	main() : Int {
		{
			c@C.useInheritedAttributes();
			c@C.testIOFunctions("AAA",6);
			c@C.testStringFunctions("Hello ","World", 2, 3);
			c@C.testObjectFunctions();
			0;
		}
	};
};
