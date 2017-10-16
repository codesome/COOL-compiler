class A {
	a : Int;
	f1() : Int {
		0
	};
};

class B inherits A {
	b : Int;
	f1() : Int {
		1
	};
};

class E inherits A {
	c : Int;
};

class F inherits B {
	f : Int;
};

class C {
	a : Int;
	b : Bool;
	c : String;
	e : B;
	f : B <- new B;
	g : IO <- new IO;
	h : A <- new B;
	i : A <- new A;
	j : A;
	k : F <- new F;
	l : A <- new F;

	checkDefaultValues() : Object {
		{
			g@IO.out_string("Printing default values of each type\n");
			g@IO.out_string("Int : ");
			g@IO.out_int(a);
			g@IO.out_string("\nString : ");
			g@IO.out_string(c);
			g@IO.out_string("\nBool : ");
			if b then g@IO.out_string("True") else g@IO.out_string("False") fi;
			g@IO.out_string("\nOther class without new, here class B : ");
			if isvoid e then
				g@IO.out_string("Object is void")
			else
				g@IO.out_string("Object is not void")
			fi;
			g@IO.out_string("\nOther class with new, here class B : ");
			if isvoid f then
				g@IO.out_string("Object is void")
			else
				g@IO.out_string("Object is not void")
			fi;
			g@IO.out_string("\nCompleted\n\n");
		}
	};

	testStaticDispatch() : Int {
		{
			g@IO.out_string("Calling static dispatch on f1(), member of A gives 0, member of B gives 1 np member in F\n");
			g@IO.out_string("Dynamic type B, static type B, called on B : ");
			g@IO.out_int(f@B.f1());
			g@IO.out_string("\nDynamic type B, static type B, called on A : ");
			g@IO.out_int(f@A.f1());
			g@IO.out_string("\nDynamic type B, static type A, called on B : Not allowed");
			g@IO.out_string("\nDynamic type B, static type A, called on A : ");
			g@IO.out_int(h@A.f1());
			g@IO.out_string("\nDynamic type A, static type A, called on B : Not allowed");
			g@IO.out_string("\nDynamic type A, static type A, called on A : ");
			g@IO.out_int(i@A.f1());
			g@IO.out_string("\nDynamic type F, static type A, called on A : ");
			g@IO.out_int(l@A.f1());
			g@IO.out_string("\nDynamic type F, static type A, called on F : Not allowed");
			g@IO.out_string("\nDynamic type F, static type F, called on A : ");
			g@IO.out_int(k@A.f1());
			g@IO.out_string("\nDynamic type F, static type F, called on F : ");
			g@IO.out_int(k@F.f1());
			g@IO.out_string("\nCompleted\n\n");
			0;
		}
	};

	staticDispatchOnNull() : Int {
		e@B.f1()
	};

	checkConsts() : Int {
		{
			g@IO.out_string("Displaying consts 1 and 'Hello', and test with if for Bool const 'true'\n");
			g@IO.out_string("Int : ");
			g@IO.out_int(1);
			g@IO.out_string("\nString : ");
			g@IO.out_string("Hello");
			g@IO.out_string("\nBool : ");
			if true then
				g@IO.out_string("true")
			else
				g@IO.out_string("false")
			fi;
			g@IO.out_string("\nCompleted\n\n");
			0;
		}
	};

	ifWithDifferentReturnTypes(b : Bool) : A {
		{	
			j <- if b then new B else new E fi;
			g@IO.out_string(j@A.type_name());
			j;
		}
	};
};

class Main {
	c : C <- new C;
	a : A;
	main() : Int {
		{
			c@C.checkDefaultValues();
			c@C.testStaticDispatch();
			c@C.checkConsts();
			a <- c@C.ifWithDifferentReturnTypes(true);
			c@C.staticDispatchOnNull();
			0;
		}
	};
};
