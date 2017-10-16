; ModuleID = '../test_cases/full_test3.cl'
source_filename = "../test_cases/full_test3.cl"

@.str.30 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.0 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.20 = private unnamed_addr constant [13 x i8] c"
length() : \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.36 = private unnamed_addr constant [35 x i8] c"
Divide by 0 exception at line no \00", align 1
@.str.31 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.9 = private unnamed_addr constant [75 x i8] c"out_string() : (will print s argument, but class member contains 'Hello')
\00", align 1
@.str.35 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.41 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.14 = private unnamed_addr constant [12 x i8] c"
Got int : \00", align 1
@.str.29 = private unnamed_addr constant [6 x i8] c"World\00", align 1
@.str.42 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.4 = private unnamed_addr constant [60 x i8] c"A->B->C, A has a member a with value 1. Printing it from C
\00", align 1
@.str.13 = private unnamed_addr constant [27 x i8] c"
in_int() : (enter a int)
\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"Hello\00", align 1
@.str.18 = private unnamed_addr constant [72 x i8] c"
To get substring at index i of length l, where i and l are given by : \00", align 1
@.str.43 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@.str.8 = private unnamed_addr constant [31 x i8] c"Calling functions in IO class
\00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c"
Got string : \00", align 1
@.str.15 = private unnamed_addr constant [35 x i8] c"Calling functions in String class
\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"abort() : \00", align 1
@.str.6 = private unnamed_addr constant [35 x i8] c"Calling functions in Object class
\00", align 1
@.str.11 = private unnamed_addr constant [33 x i8] c"
in_string() : (enter a string)
\00", align 1
@.str.22 = private unnamed_addr constant [9 x i8] c"A String\00", align 1
@.str.34 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.19 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.27 = private unnamed_addr constant [4 x i8] c"AAA\00", align 1
@.str.16 = private unnamed_addr constant [16 x i8] c"Input String : \00", align 1
@.str.40 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.38 = private unnamed_addr constant [26 x i8] c"
Abort called from class \00", align 1
@.str.37 = private unnamed_addr constant [30 x i8] c"
Dispatch to void at line no \00", align 1
@.str.23 = private unnamed_addr constant [13 x i8] c"
concat() : \00", align 1
@.str.32 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.28 = private unnamed_addr constant [7 x i8] c"Hello \00", align 1
@.str.25 = private unnamed_addr constant [13 x i8] c"
substr() : \00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"
Completed

\00", align 1
@.str.17 = private unnamed_addr constant [19 x i8] c"
To concat with : \00", align 1
@.str.21 = private unnamed_addr constant [27 x i8] c"
length() of 'A String' : \00", align 1
@.str.10 = private unnamed_addr constant [67 x i8] c"
out_int() : (will print c argument, but class member contains 3)
\00", align 1
@.str.39 = private unnamed_addr constant [7 x i8] c"Object\00", align 1
@.str.26 = private unnamed_addr constant [5 x i8] c"Main\00", align 1
@.str.24 = private unnamed_addr constant [23 x i8] c"
concat() 'A String': \00", align 1
@.str.33 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1

%class.Object = type {i8*}
%class.A = type { %class.Object, i32 }
%class.B = type { %class.A, i32 }
%class.C = type { %class.B, i32, %class.IO*, %class.Object*, i8* }
%class.Main = type { %class.Object, %class.C* }
%class.IO = type { %class.Object }


; Class: C, Method: useInheritedAttributes
define i32 @_CN1C_FN22useInheritedAttributes_(%class.C* %this) {

entry:
  %0 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %if.then, label %if.else

if.then:
  call void @print_dispatch_on_void_error(i32 17)
  call void @exit(i32 1)
  br label %if.end

if.else:
  br label %if.end

if.end:
  %3 = getelementptr inbounds [60 x i8], [60 x i8]* @.str.4, i32 0, i32 0
  %4 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %3)
  %5 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %6 = load %class.IO*, %class.IO** %5, align 8
  %7 = icmp eq %class.IO* %6, null
  br i1 %7, label %if.then.1, label %if.else.1

if.then.1:
  call void @print_dispatch_on_void_error(i32 18)
  call void @exit(i32 1)
  br label %if.end.1

if.else.1:
  br label %if.end.1

if.end.1:
  %8 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 0, i32 0, i32 1
  %9 = load i32, i32* %8, align 4
  %10 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %6, i32 %9)
  %11 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %12 = load %class.IO*, %class.IO** %11, align 8
  %13 = icmp eq %class.IO* %12, null
  br i1 %13, label %if.then.2, label %if.else.2

if.then.2:
  call void @print_dispatch_on_void_error(i32 19)
  call void @exit(i32 1)
  br label %if.end.2

if.else.2:
  br label %if.end.2

if.end.2:
  %14 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.5, i32 0, i32 0
  %15 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %12, i8* %14)
  ret i32 0
}

; Class: C, Method: testObjectFunctions
define i32 @_CN1C_FN19testObjectFunctions_(%class.C* %this) {

entry:
  %0 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %if.then.3, label %if.else.3

if.then.3:
  call void @print_dispatch_on_void_error(i32 26)
  call void @exit(i32 1)
  br label %if.end.3

if.else.3:
  br label %if.end.3

if.end.3:
  %3 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.6, i32 0, i32 0
  %4 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %3)
  %5 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %6 = load %class.IO*, %class.IO** %5, align 8
  %7 = icmp eq %class.IO* %6, null
  br i1 %7, label %if.then.4, label %if.else.4

if.then.4:
  call void @print_dispatch_on_void_error(i32 27)
  call void @exit(i32 1)
  br label %if.end.4

if.else.4:
  br label %if.end.4

if.end.4:
  %8 = getelementptr inbounds [11 x i8], [11 x i8]* @.str.7, i32 0, i32 0
  %9 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %6, i8* %8)
  %10 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 3
  %11 = load %class.Object*, %class.Object** %10, align 8
  %12 = icmp eq %class.Object* %11, null
  br i1 %12, label %if.then.5, label %if.else.5

if.then.5:
  call void @print_dispatch_on_void_error(i32 28)
  call void @exit(i32 1)
  br label %if.end.5

if.else.5:
  br label %if.end.5

if.end.5:
  %13 = call %class.Object* @_CN6Object_FN5abort_(%class.Object* %11)
  %14 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %15 = load %class.IO*, %class.IO** %14, align 8
  %16 = icmp eq %class.IO* %15, null
  br i1 %16, label %if.then.6, label %if.else.6

if.then.6:
  call void @print_dispatch_on_void_error(i32 29)
  call void @exit(i32 1)
  br label %if.end.6

if.else.6:
  br label %if.end.6

if.end.6:
  %17 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.5, i32 0, i32 0
  %18 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %15, i8* %17)
  ret i32 0
}

; Class: C, Method: testIOFunctions
define i32 @_CN1C_FN15testIOFunctions_(%class.C* %this, i8* %s, i32 %c) {

entry:
  %s.addr = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  %c.addr = alloca i32, align 8
  store i32 %c, i32* %c.addr, align 4
  %0 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %if.then.7, label %if.else.7

if.then.7:
  call void @print_dispatch_on_void_error(i32 36)
  call void @exit(i32 1)
  br label %if.end.7

if.else.7:
  br label %if.end.7

if.end.7:
  %3 = getelementptr inbounds [31 x i8], [31 x i8]* @.str.8, i32 0, i32 0
  %4 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %3)
  %5 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %6 = load %class.IO*, %class.IO** %5, align 8
  %7 = icmp eq %class.IO* %6, null
  br i1 %7, label %if.then.8, label %if.else.8

if.then.8:
  call void @print_dispatch_on_void_error(i32 37)
  call void @exit(i32 1)
  br label %if.end.8

if.else.8:
  br label %if.end.8

if.end.8:
  %8 = getelementptr inbounds [75 x i8], [75 x i8]* @.str.9, i32 0, i32 0
  %9 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %6, i8* %8)
  %10 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %11 = load %class.IO*, %class.IO** %10, align 8
  %12 = icmp eq %class.IO* %11, null
  br i1 %12, label %if.then.9, label %if.else.9

if.then.9:
  call void @print_dispatch_on_void_error(i32 38)
  call void @exit(i32 1)
  br label %if.end.9

if.else.9:
  br label %if.end.9

if.end.9:
  %13 = load i8*, i8** %s.addr, align 8
  %14 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %11, i8* %13)
  %15 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %16 = load %class.IO*, %class.IO** %15, align 8
  %17 = icmp eq %class.IO* %16, null
  br i1 %17, label %if.then.10, label %if.else.10

if.then.10:
  call void @print_dispatch_on_void_error(i32 39)
  call void @exit(i32 1)
  br label %if.end.10

if.else.10:
  br label %if.end.10

if.end.10:
  %18 = getelementptr inbounds [67 x i8], [67 x i8]* @.str.10, i32 0, i32 0
  %19 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %16, i8* %18)
  %20 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %21 = load %class.IO*, %class.IO** %20, align 8
  %22 = icmp eq %class.IO* %21, null
  br i1 %22, label %if.then.11, label %if.else.11

if.then.11:
  call void @print_dispatch_on_void_error(i32 40)
  call void @exit(i32 1)
  br label %if.end.11

if.else.11:
  br label %if.end.11

if.end.11:
  %23 = load i32, i32* %c.addr, align 4
  %24 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %21, i32 %23)
  %25 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %26 = load %class.IO*, %class.IO** %25, align 8
  %27 = icmp eq %class.IO* %26, null
  br i1 %27, label %if.then.12, label %if.else.12

if.then.12:
  call void @print_dispatch_on_void_error(i32 41)
  call void @exit(i32 1)
  br label %if.end.12

if.else.12:
  br label %if.end.12

if.end.12:
  %28 = getelementptr inbounds [33 x i8], [33 x i8]* @.str.11, i32 0, i32 0
  %29 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %26, i8* %28)
  %30 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %31 = load %class.IO*, %class.IO** %30, align 8
  %32 = icmp eq %class.IO* %31, null
  br i1 %32, label %if.then.13, label %if.else.13

if.then.13:
  call void @print_dispatch_on_void_error(i32 42)
  call void @exit(i32 1)
  br label %if.end.13

if.else.13:
  br label %if.end.13

if.end.13:
  %33 = call i8* @_CN2IO_FN9in_string_(%class.IO* %31)
  store i8* %33, i8** %s.addr, align 8
  %34 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %35 = load %class.IO*, %class.IO** %34, align 8
  %36 = icmp eq %class.IO* %35, null
  br i1 %36, label %if.then.14, label %if.else.14

if.then.14:
  call void @print_dispatch_on_void_error(i32 43)
  call void @exit(i32 1)
  br label %if.end.14

if.else.14:
  br label %if.end.14

if.end.14:
  %37 = getelementptr inbounds [15 x i8], [15 x i8]* @.str.12, i32 0, i32 0
  %38 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %35, i8* %37)
  %39 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %40 = load %class.IO*, %class.IO** %39, align 8
  %41 = icmp eq %class.IO* %40, null
  br i1 %41, label %if.then.15, label %if.else.15

if.then.15:
  call void @print_dispatch_on_void_error(i32 44)
  call void @exit(i32 1)
  br label %if.end.15

if.else.15:
  br label %if.end.15

if.end.15:
  %42 = load i8*, i8** %s.addr, align 8
  %43 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %40, i8* %42)
  %44 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %45 = load %class.IO*, %class.IO** %44, align 8
  %46 = icmp eq %class.IO* %45, null
  br i1 %46, label %if.then.16, label %if.else.16

if.then.16:
  call void @print_dispatch_on_void_error(i32 45)
  call void @exit(i32 1)
  br label %if.end.16

if.else.16:
  br label %if.end.16

if.end.16:
  %47 = getelementptr inbounds [27 x i8], [27 x i8]* @.str.13, i32 0, i32 0
  %48 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %45, i8* %47)
  %49 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %50 = load %class.IO*, %class.IO** %49, align 8
  %51 = icmp eq %class.IO* %50, null
  br i1 %51, label %if.then.17, label %if.else.17

if.then.17:
  call void @print_dispatch_on_void_error(i32 46)
  call void @exit(i32 1)
  br label %if.end.17

if.else.17:
  br label %if.end.17

if.end.17:
  %52 = call i32 @_CN2IO_FN6in_int_(%class.IO* %50)
  store i32 %52, i32* %c.addr, align 4
  %53 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %54 = load %class.IO*, %class.IO** %53, align 8
  %55 = icmp eq %class.IO* %54, null
  br i1 %55, label %if.then.18, label %if.else.18

if.then.18:
  call void @print_dispatch_on_void_error(i32 47)
  call void @exit(i32 1)
  br label %if.end.18

if.else.18:
  br label %if.end.18

if.end.18:
  %56 = getelementptr inbounds [12 x i8], [12 x i8]* @.str.14, i32 0, i32 0
  %57 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %54, i8* %56)
  %58 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %59 = load %class.IO*, %class.IO** %58, align 8
  %60 = icmp eq %class.IO* %59, null
  br i1 %60, label %if.then.19, label %if.else.19

if.then.19:
  call void @print_dispatch_on_void_error(i32 48)
  call void @exit(i32 1)
  br label %if.end.19

if.else.19:
  br label %if.end.19

if.end.19:
  %61 = load i32, i32* %c.addr, align 4
  %62 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %59, i32 %61)
  %63 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %64 = load %class.IO*, %class.IO** %63, align 8
  %65 = icmp eq %class.IO* %64, null
  br i1 %65, label %if.then.20, label %if.else.20

if.then.20:
  call void @print_dispatch_on_void_error(i32 49)
  call void @exit(i32 1)
  br label %if.end.20

if.else.20:
  br label %if.end.20

if.end.20:
  %66 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.5, i32 0, i32 0
  %67 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %64, i8* %66)
  ret i32 0
}

; Class: C, Method: testStringFunctions
define i32 @_CN1C_FN19testStringFunctions_(%class.C* %this, i8* %s1, i8* %s2, i32 %x, i32 %l) {

entry:
  %s1.addr = alloca i8*, align 8
  store i8* %s1, i8** %s1.addr, align 8
  %s2.addr = alloca i8*, align 8
  store i8* %s2, i8** %s2.addr, align 8
  %x.addr = alloca i32, align 8
  store i32 %x, i32* %x.addr, align 4
  %l.addr = alloca i32, align 8
  store i32 %l, i32* %l.addr, align 4
  %0 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %if.then.21, label %if.else.21

if.then.21:
  call void @print_dispatch_on_void_error(i32 56)
  call void @exit(i32 1)
  br label %if.end.21

if.else.21:
  br label %if.end.21

if.end.21:
  %3 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.15, i32 0, i32 0
  %4 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %3)
  %5 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %6 = load %class.IO*, %class.IO** %5, align 8
  %7 = icmp eq %class.IO* %6, null
  br i1 %7, label %if.then.22, label %if.else.22

if.then.22:
  call void @print_dispatch_on_void_error(i32 57)
  call void @exit(i32 1)
  br label %if.end.22

if.else.22:
  br label %if.end.22

if.end.22:
  %8 = getelementptr inbounds [16 x i8], [16 x i8]* @.str.16, i32 0, i32 0
  %9 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %6, i8* %8)
  %10 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %11 = load %class.IO*, %class.IO** %10, align 8
  %12 = icmp eq %class.IO* %11, null
  br i1 %12, label %if.then.23, label %if.else.23

if.then.23:
  call void @print_dispatch_on_void_error(i32 58)
  call void @exit(i32 1)
  br label %if.end.23

if.else.23:
  br label %if.end.23

if.end.23:
  %13 = load i8*, i8** %s1.addr, align 8
  %14 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %11, i8* %13)
  %15 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %16 = load %class.IO*, %class.IO** %15, align 8
  %17 = icmp eq %class.IO* %16, null
  br i1 %17, label %if.then.24, label %if.else.24

if.then.24:
  call void @print_dispatch_on_void_error(i32 59)
  call void @exit(i32 1)
  br label %if.end.24

if.else.24:
  br label %if.end.24

if.end.24:
  %18 = getelementptr inbounds [19 x i8], [19 x i8]* @.str.17, i32 0, i32 0
  %19 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %16, i8* %18)
  %20 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %21 = load %class.IO*, %class.IO** %20, align 8
  %22 = icmp eq %class.IO* %21, null
  br i1 %22, label %if.then.25, label %if.else.25

if.then.25:
  call void @print_dispatch_on_void_error(i32 60)
  call void @exit(i32 1)
  br label %if.end.25

if.else.25:
  br label %if.end.25

if.end.25:
  %23 = load i8*, i8** %s2.addr, align 8
  %24 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %21, i8* %23)
  %25 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %26 = load %class.IO*, %class.IO** %25, align 8
  %27 = icmp eq %class.IO* %26, null
  br i1 %27, label %if.then.26, label %if.else.26

if.then.26:
  call void @print_dispatch_on_void_error(i32 61)
  call void @exit(i32 1)
  br label %if.end.26

if.else.26:
  br label %if.end.26

if.end.26:
  %28 = getelementptr inbounds [72 x i8], [72 x i8]* @.str.18, i32 0, i32 0
  %29 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %26, i8* %28)
  %30 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %31 = load %class.IO*, %class.IO** %30, align 8
  %32 = icmp eq %class.IO* %31, null
  br i1 %32, label %if.then.27, label %if.else.27

if.then.27:
  call void @print_dispatch_on_void_error(i32 62)
  call void @exit(i32 1)
  br label %if.end.27

if.else.27:
  br label %if.end.27

if.end.27:
  %33 = load i32, i32* %x.addr, align 4
  %34 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %31, i32 %33)
  %35 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %36 = load %class.IO*, %class.IO** %35, align 8
  %37 = icmp eq %class.IO* %36, null
  br i1 %37, label %if.then.28, label %if.else.28

if.then.28:
  call void @print_dispatch_on_void_error(i32 63)
  call void @exit(i32 1)
  br label %if.end.28

if.else.28:
  br label %if.end.28

if.end.28:
  %38 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.19, i32 0, i32 0
  %39 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %36, i8* %38)
  %40 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %41 = load %class.IO*, %class.IO** %40, align 8
  %42 = icmp eq %class.IO* %41, null
  br i1 %42, label %if.then.29, label %if.else.29

if.then.29:
  call void @print_dispatch_on_void_error(i32 64)
  call void @exit(i32 1)
  br label %if.end.29

if.else.29:
  br label %if.end.29

if.end.29:
  %43 = load i32, i32* %l.addr, align 4
  %44 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %41, i32 %43)
  %45 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %46 = load %class.IO*, %class.IO** %45, align 8
  %47 = icmp eq %class.IO* %46, null
  br i1 %47, label %if.then.30, label %if.else.30

if.then.30:
  call void @print_dispatch_on_void_error(i32 65)
  call void @exit(i32 1)
  br label %if.end.30

if.else.30:
  br label %if.end.30

if.end.30:
  %48 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.20, i32 0, i32 0
  %49 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %46, i8* %48)
  %50 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %51 = load %class.IO*, %class.IO** %50, align 8
  %52 = icmp eq %class.IO* %51, null
  br i1 %52, label %if.then.31, label %if.else.31

if.then.31:
  call void @print_dispatch_on_void_error(i32 66)
  call void @exit(i32 1)
  br label %if.end.31

if.else.31:
  br label %if.end.31

if.end.31:
  %53 = load i8*, i8** %s1.addr, align 8
  %54 = call i64 @strlen(i8* %53)
  %55 = trunc i64 %54 to i32
  %56 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %51, i32 %55)
  %57 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %58 = load %class.IO*, %class.IO** %57, align 8
  %59 = icmp eq %class.IO* %58, null
  br i1 %59, label %if.then.32, label %if.else.32

if.then.32:
  call void @print_dispatch_on_void_error(i32 67)
  call void @exit(i32 1)
  br label %if.end.32

if.else.32:
  br label %if.end.32

if.end.32:
  %60 = getelementptr inbounds [27 x i8], [27 x i8]* @.str.21, i32 0, i32 0
  %61 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %58, i8* %60)
  %62 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %63 = load %class.IO*, %class.IO** %62, align 8
  %64 = icmp eq %class.IO* %63, null
  br i1 %64, label %if.then.33, label %if.else.33

if.then.33:
  call void @print_dispatch_on_void_error(i32 68)
  call void @exit(i32 1)
  br label %if.end.33

if.else.33:
  br label %if.end.33

if.end.33:
  %65 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.22, i32 0, i32 0
  %66 = call i64 @strlen(i8* %65)
  %67 = trunc i64 %66 to i32
  %68 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %63, i32 %67)
  %69 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %70 = load %class.IO*, %class.IO** %69, align 8
  %71 = icmp eq %class.IO* %70, null
  br i1 %71, label %if.then.34, label %if.else.34

if.then.34:
  call void @print_dispatch_on_void_error(i32 69)
  call void @exit(i32 1)
  br label %if.end.34

if.else.34:
  br label %if.end.34

if.end.34:
  %72 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.23, i32 0, i32 0
  %73 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %70, i8* %72)
  %74 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %75 = load %class.IO*, %class.IO** %74, align 8
  %76 = icmp eq %class.IO* %75, null
  br i1 %76, label %if.then.35, label %if.else.35

if.then.35:
  call void @print_dispatch_on_void_error(i32 70)
  call void @exit(i32 1)
  br label %if.end.35

if.else.35:
  br label %if.end.35

if.end.35:
  %77 = load i8*, i8** %s1.addr, align 8
  %78 = load i8*, i8** %s2.addr, align 8
  %79 = call i8* @_CN6String_FN6concat_(i8* %77, i8* %78)
  %80 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %75, i8* %79)
  %81 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %82 = load %class.IO*, %class.IO** %81, align 8
  %83 = icmp eq %class.IO* %82, null
  br i1 %83, label %if.then.36, label %if.else.36

if.then.36:
  call void @print_dispatch_on_void_error(i32 71)
  call void @exit(i32 1)
  br label %if.end.36

if.else.36:
  br label %if.end.36

if.end.36:
  %84 = getelementptr inbounds [23 x i8], [23 x i8]* @.str.24, i32 0, i32 0
  %85 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %82, i8* %84)
  %86 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %87 = load %class.IO*, %class.IO** %86, align 8
  %88 = icmp eq %class.IO* %87, null
  br i1 %88, label %if.then.37, label %if.else.37

if.then.37:
  call void @print_dispatch_on_void_error(i32 72)
  call void @exit(i32 1)
  br label %if.end.37

if.else.37:
  br label %if.end.37

if.end.37:
  %89 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.22, i32 0, i32 0
  %90 = load i8*, i8** %s2.addr, align 8
  %91 = call i8* @_CN6String_FN6concat_(i8* %89, i8* %90)
  %92 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %87, i8* %91)
  %93 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %94 = load %class.IO*, %class.IO** %93, align 8
  %95 = icmp eq %class.IO* %94, null
  br i1 %95, label %if.then.38, label %if.else.38

if.then.38:
  call void @print_dispatch_on_void_error(i32 73)
  call void @exit(i32 1)
  br label %if.end.38

if.else.38:
  br label %if.end.38

if.end.38:
  %96 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.25, i32 0, i32 0
  %97 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %94, i8* %96)
  %98 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %99 = load %class.IO*, %class.IO** %98, align 8
  %100 = icmp eq %class.IO* %99, null
  br i1 %100, label %if.then.39, label %if.else.39

if.then.39:
  call void @print_dispatch_on_void_error(i32 74)
  call void @exit(i32 1)
  br label %if.end.39

if.else.39:
  br label %if.end.39

if.end.39:
  %101 = load i8*, i8** %s1.addr, align 8
  %102 = load i32, i32* %x.addr, align 4
  %103 = load i32, i32* %l.addr, align 4
  %104 = call i8* @_CN6String_FN6substr_(i8* %101, i32 %102, i32 %103)
  %105 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %99, i8* %104)
  %106 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %107 = load %class.IO*, %class.IO** %106, align 8
  %108 = icmp eq %class.IO* %107, null
  br i1 %108, label %if.then.40, label %if.else.40

if.then.40:
  call void @print_dispatch_on_void_error(i32 75)
  call void @exit(i32 1)
  br label %if.end.40

if.else.40:
  br label %if.end.40

if.end.40:
  %109 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.5, i32 0, i32 0
  %110 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %107, i8* %109)
  ret i32 0
}

; Class: Main, Method: main
define i32 @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %1 = load %class.C*, %class.C** %0, align 8
  %2 = icmp eq %class.C* %1, null
  br i1 %2, label %if.then.41, label %if.else.41

if.then.41:
  call void @print_dispatch_on_void_error(i32 86)
  call void @exit(i32 1)
  br label %if.end.41

if.else.41:
  br label %if.end.41

if.end.41:
  %3 = call i32 @_CN1C_FN22useInheritedAttributes_(%class.C* %1)
  %4 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %5 = load %class.C*, %class.C** %4, align 8
  %6 = icmp eq %class.C* %5, null
  br i1 %6, label %if.then.42, label %if.else.42

if.then.42:
  call void @print_dispatch_on_void_error(i32 87)
  call void @exit(i32 1)
  br label %if.end.42

if.else.42:
  br label %if.end.42

if.end.42:
  %7 = getelementptr inbounds [4 x i8], [4 x i8]* @.str.27, i32 0, i32 0
  %8 = call i32 @_CN1C_FN15testIOFunctions_(%class.C* %5, i8* %7, i32 6)
  %9 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %10 = load %class.C*, %class.C** %9, align 8
  %11 = icmp eq %class.C* %10, null
  br i1 %11, label %if.then.43, label %if.else.43

if.then.43:
  call void @print_dispatch_on_void_error(i32 88)
  call void @exit(i32 1)
  br label %if.end.43

if.else.43:
  br label %if.end.43

if.end.43:
  %12 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.28, i32 0, i32 0
  %13 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.29, i32 0, i32 0
  %14 = call i32 @_CN1C_FN19testStringFunctions_(%class.C* %10, i8* %12, i8* %13, i32 2, i32 3)
  %15 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %16 = load %class.C*, %class.C** %15, align 8
  %17 = icmp eq %class.C* %16, null
  br i1 %17, label %if.then.44, label %if.else.44

if.then.44:
  call void @print_dispatch_on_void_error(i32 89)
  call void @exit(i32 1)
  br label %if.end.44

if.else.44:
  br label %if.end.44

if.end.44:
  %18 = call i32 @_CN1C_FN19testObjectFunctions_(%class.C* %16)
  ret i32 0
}

; Constructor of class 'Object'
define void @_CN6Object_FN6Object_(%class.Object* %this) {

entry:
  ret void
}

; Constructor of class 'A'
define void @_CN1A_FN1A_(%class.A* %this) {

entry:
  %0 = bitcast %class.A* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  store i32 1, i32* %1, align 4
  ret void
}

; Constructor of class 'B'
define void @_CN1B_FN1B_(%class.B* %this) {

entry:
  %0 = bitcast %class.B* %this to %class.A*
  call void @_CN1A_FN1A_(%class.A* %0)
  %1 = getelementptr inbounds %class.B, %class.B* %this, i32 0, i32 1
  store i32 0, i32* %1, align 4
  ret void
}

; Constructor of class 'C'
define void @_CN1C_FN1C_(%class.C* %this) {

entry:
  %0 = bitcast %class.C* %this to %class.B*
  call void @_CN1B_FN1B_(%class.B* %0)
  %1 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 1
  store i32 3, i32* %1, align 4
  %2 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %3 = call noalias i8* @malloc(i64 8)
  %4 = bitcast i8* %3 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %4)
  %5 = bitcast %class.IO* %4 to %class.Object*
  %6 = getelementptr inbounds %class.Object, %class.Object* %5, i32 0, i32 0
  %7 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.40, i32 0, i32 0
  store i8* %7, i8** %6, align 8
  store %class.IO* %4, %class.IO** %2, align 4
  %8 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 3
  %9 = call noalias i8* @malloc(i64 8)
  %10 = bitcast i8* %9 to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %10)
  %11 = getelementptr inbounds %class.Object, %class.Object* %10, i32 0, i32 0
  %12 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.39, i32 0, i32 0
  store i8* %12, i8** %11, align 8
  store %class.Object* %10, %class.Object** %8, align 4
  %13 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 4
  %14 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.3, i32 0, i32 0
  store i8* %14, i8** %13, align 8
  ret void
}

; Constructor of class 'Main'
define void @_CN4Main_FN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 44)
  %3 = bitcast i8* %2 to %class.C*
  call void @_CN1C_FN1C_(%class.C* %3)
  %4 = bitcast %class.C* %3 to %class.Object*
  %5 = getelementptr inbounds %class.Object, %class.Object* %4, i32 0, i32 0
  %6 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  store i8* %6, i8** %5, align 8
  store %class.C* %3, %class.C** %1, align 4
  ret void
}

; Constructor of class 'IO'
define void @_CN2IO_FN2IO_(%class.IO* %this) {

entry:
  %0 = bitcast %class.IO* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  ret void
}

; C malloc declaration
declare noalias i8* @malloc(i64)

; C exit declaration
declare void @exit(i32)

; C printf declaration
declare i32 @printf(i8*, ...)

; C scanf declaration
declare i32 @scanf(i8*, ...)

; C strlen declaration
declare i64 @strlen(i8*)

; C strcpy declaration
declare i8* @strcpy(i8*, i8*)

; C strcat declaration
declare i8* @strcat(i8*, i8*)

; C strncpy declaration
declare i8* @strncpy(i8*, i8*, i64)

; Class: Object, Method: abort
define %class.Object* @_CN6Object_FN5abort_(%class.Object* %this) {
entry:
  %0 = getelementptr inbounds %class.Object, %class.Object* %this, i32 0, i32 0
  %1 = load i8*, i8** %0, align 8
  %2 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.32, i32 0, i32 0
  %3 = getelementptr inbounds [26 x i8], [26 x i8]* @.str.38, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %2, i8* %3)
  %5 = call i32 (i8*, ...) @printf(i8* %2, i8* %1)
  %6 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.31, i32 0, i32 0
  %7 = call i32 (i8*, ...) @printf(i8* %2, i8* %6)
  call void @exit(i32 0)
  %8 = call noalias i8* @malloc(i64 8)
  %9 = bitcast i8* %8 to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %9)
  ret %class.Object* %9
}

; Class: Object, Method: type_name
define i8* @_CN6Object_FN9type_name_(%class.Object* %this) {
entry:
  %0 = getelementptr inbounds %class.Object, %class.Object* %this, i32 0, i32 0
  %1 = load i8*, i8** %0, align 8
  ret i8* %1
}

; Class: IO, Method: out_string
define %class.IO* @_CN2IO_FN10out_string_(%class.IO* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.32, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)
  %1 = call noalias i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: out_int
define %class.IO* @_CN2IO_FN7out_int_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.34, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i32 %d)
  %1 = call noalias i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: in_int
define i32 @_CN2IO_FN6in_int_(%class.IO* %this) {
entry:
  %0 = alloca i32, align 8
  %1 = getelementptr inbounds [4 x i8], [4 x i8]* @.str.35, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: in_string
define i8* @_CN2IO_FN9in_string_(%class.IO* %this) {
entry:
  %0 = alloca i8*, align 8
  %1 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.33, i32 0, i32 0
  %2 = load i8*, i8** %0, align 8
  %call = call i32 (i8*, ...) @scanf(i8* %1, i8* %2)
  %3 = load i8*, i8** %0, align 8
  ret i8* %3
}

; Class: String, Method: concat
define i8* @_CN6String_FN6concat_(i8* %s1, i8* %s2) {
entry:
  %0 = call i64 @strlen(i8* %s1)
  %1 = call i64 @strlen(i8* %s2)
  %2 = add nsw i64 %0, %1
  %3 = add nsw i64 %2, 1
  %4 = call noalias i8* @malloc(i64 %3)
  %5 = call i8* @strcpy(i8* %4, i8* %s1)
  %6 = call i8* @strcat(i8* %4, i8* %s2)
  ret i8* %4
}

; Class: String, Method: substr
define i8* @_CN6String_FN6substr_(i8* %s1, i32 %index, i32 %len) {
entry:
  %0 = zext i32 %len to i64
  %1 = call noalias i8* @malloc(i64 %0)
  %2 = getelementptr inbounds i8, i8* %s1, i32 %index
  %3 = call i8* @strncpy(i8* %1, i8* %2, i64 %0)
  ret i8* %1
}
define void @print_div_by_zero_err_msg(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.32, i32 0, i32 0
  %1 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.36, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.34, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.31, i32 0, i32 0
  %6 = call i32 (i8*, ...) @printf(i8* %0, i8* %5)
  ret void
}
define void @print_dispatch_on_void_error(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.32, i32 0, i32 0
  %1 = getelementptr inbounds [30 x i8], [30 x i8]* @.str.37, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.34, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.31, i32 0, i32 0
  %6 = call i32 (i8*, ...) @printf(i8* %0, i8* %5)
  ret void
}

; C main() function
define i32 @main() {
entry:
  %main = alloca %class.Main, align 8
  call void @_CN4Main_FN4Main_(%class.Main* %main)
  %retval = call i32 @_CN4Main_FN4main_(%class.Main* %main)
  ret i32 %retval
}
