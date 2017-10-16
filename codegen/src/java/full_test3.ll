; ModuleID = '../test_cases/full_test3.cl'
source_filename = "../test_cases/full_test3.cl"

@.str.27 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.23 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.17 = private unnamed_addr constant [13 x i8] c"
length() : \00", align 1
@.str.24 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.25 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.33 = private unnamed_addr constant [35 x i8] c"
Divide by 0 exception at line no \00", align 1
@.str.28 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.6 = private unnamed_addr constant [75 x i8] c"out_string() : (will print s argument, but class member contains 'Hello')
\00", align 1
@.str.32 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"
Got int : \00", align 1
@.str.22 = private unnamed_addr constant [6 x i8] c"World\00", align 1
@.str.1 = private unnamed_addr constant [60 x i8] c"A->B->C, A has a member a with value 1. Printing it from C
\00", align 1
@.str.10 = private unnamed_addr constant [27 x i8] c"
in_int() : (enter a int)
\00", align 1
@.str.0 = private unnamed_addr constant [6 x i8] c"Hello\00", align 1
@.str.15 = private unnamed_addr constant [72 x i8] c"
To get substring at index i of length l, where i and l are given by : \00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"Calling functions in IO class
\00", align 1
@.str.9 = private unnamed_addr constant [15 x i8] c"
Got string : \00", align 1
@.str.12 = private unnamed_addr constant [35 x i8] c"Calling functions in String class
\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"abort() : \00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"Calling functions in Object class
\00", align 1
@.str.8 = private unnamed_addr constant [33 x i8] c"
in_string() : (enter a string)
\00", align 1
@.str.31 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.20 = private unnamed_addr constant [4 x i8] c"AAA\00", align 1
@.str.13 = private unnamed_addr constant [16 x i8] c"Input String : \00", align 1
@.str.34 = private unnamed_addr constant [30 x i8] c"
Dispatch to void at line no \00", align 1
@.str.18 = private unnamed_addr constant [13 x i8] c"
concat() : \00", align 1
@.str.29 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.21 = private unnamed_addr constant [7 x i8] c"Hello \00", align 1
@.str.19 = private unnamed_addr constant [13 x i8] c"
substr() : \00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"
Completed

\00", align 1
@.str.14 = private unnamed_addr constant [19 x i8] c"
To concat with : \00", align 1
@.str.7 = private unnamed_addr constant [67 x i8] c"
out_int() : (will print c argument, but class member contains 3)
\00", align 1
@.str.26 = private unnamed_addr constant [5 x i8] c"Main\00", align 1
@.str.30 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1

%class.Object = type {}
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
  %3 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end

if.else:
  br label %if.end

if.end:
  %4 = getelementptr inbounds [60 x i8], [60 x i8]* @.str.1, i32 0, i32 0
  %5 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %4)
  %6 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %7 = load %class.IO*, %class.IO** %6, align 8
  %8 = icmp eq %class.IO* %7, null
  br i1 %8, label %if.then.1, label %if.else.1

if.then.1:
  call void @print_dispatch_on_void_error(i32 18)
  %9 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.1

if.else.1:
  br label %if.end.1

if.end.1:
  %10 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 0, i32 0, i32 1
  %11 = load i32, i32* %10, align 4
  %12 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %7, i32 %11)
  %13 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %14 = load %class.IO*, %class.IO** %13, align 8
  %15 = icmp eq %class.IO* %14, null
  br i1 %15, label %if.then.2, label %if.else.2

if.then.2:
  call void @print_dispatch_on_void_error(i32 19)
  %16 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.2

if.else.2:
  br label %if.end.2

if.end.2:
  %17 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.2, i32 0, i32 0
  %18 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %14, i8* %17)
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
  %3 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.3

if.else.3:
  br label %if.end.3

if.end.3:
  %4 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.3, i32 0, i32 0
  %5 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %4)
  %6 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %7 = load %class.IO*, %class.IO** %6, align 8
  %8 = icmp eq %class.IO* %7, null
  br i1 %8, label %if.then.4, label %if.else.4

if.then.4:
  call void @print_dispatch_on_void_error(i32 27)
  %9 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.4

if.else.4:
  br label %if.end.4

if.end.4:
  %10 = getelementptr inbounds [11 x i8], [11 x i8]* @.str.4, i32 0, i32 0
  %11 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %7, i8* %10)
  %12 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 3
  %13 = load %class.Object*, %class.Object** %12, align 8
  %14 = icmp eq %class.Object* %13, null
  br i1 %14, label %if.then.5, label %if.else.5

if.then.5:
  call void @print_dispatch_on_void_error(i32 28)
  %15 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.5

if.else.5:
  br label %if.end.5

if.end.5:
  %16 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 3
  %17 = load %class.Object*, %class.Object** %16, align 8
  %18 = call %class.Object* @_CN6Object_FN5abort_()
  %19 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %20 = load %class.IO*, %class.IO** %19, align 8
  %21 = icmp eq %class.IO* %20, null
  br i1 %21, label %if.then.6, label %if.else.6

if.then.6:
  call void @print_dispatch_on_void_error(i32 29)
  %22 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.6

if.else.6:
  br label %if.end.6

if.end.6:
  %23 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.2, i32 0, i32 0
  %24 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %20, i8* %23)
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
  %3 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.7

if.else.7:
  br label %if.end.7

if.end.7:
  %4 = getelementptr inbounds [31 x i8], [31 x i8]* @.str.5, i32 0, i32 0
  %5 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %4)
  %6 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %7 = load %class.IO*, %class.IO** %6, align 8
  %8 = icmp eq %class.IO* %7, null
  br i1 %8, label %if.then.8, label %if.else.8

if.then.8:
  call void @print_dispatch_on_void_error(i32 37)
  %9 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.8

if.else.8:
  br label %if.end.8

if.end.8:
  %10 = getelementptr inbounds [75 x i8], [75 x i8]* @.str.6, i32 0, i32 0
  %11 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %7, i8* %10)
  %12 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %13 = load %class.IO*, %class.IO** %12, align 8
  %14 = icmp eq %class.IO* %13, null
  br i1 %14, label %if.then.9, label %if.else.9

if.then.9:
  call void @print_dispatch_on_void_error(i32 38)
  %15 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.9

if.else.9:
  br label %if.end.9

if.end.9:
  %16 = load i8*, i8** %s.addr, align 8
  %17 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %13, i8* %16)
  %18 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %19 = load %class.IO*, %class.IO** %18, align 8
  %20 = icmp eq %class.IO* %19, null
  br i1 %20, label %if.then.10, label %if.else.10

if.then.10:
  call void @print_dispatch_on_void_error(i32 39)
  %21 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.10

if.else.10:
  br label %if.end.10

if.end.10:
  %22 = getelementptr inbounds [67 x i8], [67 x i8]* @.str.7, i32 0, i32 0
  %23 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %19, i8* %22)
  %24 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %25 = load %class.IO*, %class.IO** %24, align 8
  %26 = icmp eq %class.IO* %25, null
  br i1 %26, label %if.then.11, label %if.else.11

if.then.11:
  call void @print_dispatch_on_void_error(i32 40)
  %27 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.11

if.else.11:
  br label %if.end.11

if.end.11:
  %28 = load i32, i32* %c.addr, align 4
  %29 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %25, i32 %28)
  %30 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %31 = load %class.IO*, %class.IO** %30, align 8
  %32 = icmp eq %class.IO* %31, null
  br i1 %32, label %if.then.12, label %if.else.12

if.then.12:
  call void @print_dispatch_on_void_error(i32 41)
  %33 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.12

if.else.12:
  br label %if.end.12

if.end.12:
  %34 = getelementptr inbounds [33 x i8], [33 x i8]* @.str.8, i32 0, i32 0
  %35 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %31, i8* %34)
  %36 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %37 = load %class.IO*, %class.IO** %36, align 8
  %38 = icmp eq %class.IO* %37, null
  br i1 %38, label %if.then.13, label %if.else.13

if.then.13:
  call void @print_dispatch_on_void_error(i32 42)
  %39 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.13

if.else.13:
  br label %if.end.13

if.end.13:
  %40 = call i8* @_CN2IO_FN9in_string_(%class.IO* %37)
  store i8* %40, i8** %s.addr, align 8
  %41 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %42 = load %class.IO*, %class.IO** %41, align 8
  %43 = icmp eq %class.IO* %42, null
  br i1 %43, label %if.then.14, label %if.else.14

if.then.14:
  call void @print_dispatch_on_void_error(i32 43)
  %44 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.14

if.else.14:
  br label %if.end.14

if.end.14:
  %45 = getelementptr inbounds [15 x i8], [15 x i8]* @.str.9, i32 0, i32 0
  %46 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %42, i8* %45)
  %47 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %48 = load %class.IO*, %class.IO** %47, align 8
  %49 = icmp eq %class.IO* %48, null
  br i1 %49, label %if.then.15, label %if.else.15

if.then.15:
  call void @print_dispatch_on_void_error(i32 44)
  %50 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.15

if.else.15:
  br label %if.end.15

if.end.15:
  %51 = load i8*, i8** %s.addr, align 8
  %52 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %48, i8* %51)
  %53 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %54 = load %class.IO*, %class.IO** %53, align 8
  %55 = icmp eq %class.IO* %54, null
  br i1 %55, label %if.then.16, label %if.else.16

if.then.16:
  call void @print_dispatch_on_void_error(i32 45)
  %56 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.16

if.else.16:
  br label %if.end.16

if.end.16:
  %57 = getelementptr inbounds [27 x i8], [27 x i8]* @.str.10, i32 0, i32 0
  %58 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %54, i8* %57)
  %59 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %60 = load %class.IO*, %class.IO** %59, align 8
  %61 = icmp eq %class.IO* %60, null
  br i1 %61, label %if.then.17, label %if.else.17

if.then.17:
  call void @print_dispatch_on_void_error(i32 46)
  %62 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.17

if.else.17:
  br label %if.end.17

if.end.17:
  %63 = call i32 @_CN2IO_FN6in_int_(%class.IO* %60)
  store i32 %63, i32* %c.addr, align 4
  %64 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %65 = load %class.IO*, %class.IO** %64, align 8
  %66 = icmp eq %class.IO* %65, null
  br i1 %66, label %if.then.18, label %if.else.18

if.then.18:
  call void @print_dispatch_on_void_error(i32 47)
  %67 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.18

if.else.18:
  br label %if.end.18

if.end.18:
  %68 = getelementptr inbounds [12 x i8], [12 x i8]* @.str.11, i32 0, i32 0
  %69 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %65, i8* %68)
  %70 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %71 = load %class.IO*, %class.IO** %70, align 8
  %72 = icmp eq %class.IO* %71, null
  br i1 %72, label %if.then.19, label %if.else.19

if.then.19:
  call void @print_dispatch_on_void_error(i32 48)
  %73 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.19

if.else.19:
  br label %if.end.19

if.end.19:
  %74 = load i32, i32* %c.addr, align 4
  %75 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %71, i32 %74)
  %76 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %77 = load %class.IO*, %class.IO** %76, align 8
  %78 = icmp eq %class.IO* %77, null
  br i1 %78, label %if.then.20, label %if.else.20

if.then.20:
  call void @print_dispatch_on_void_error(i32 49)
  %79 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.20

if.else.20:
  br label %if.end.20

if.end.20:
  %80 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.2, i32 0, i32 0
  %81 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %77, i8* %80)
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
  %3 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.21

if.else.21:
  br label %if.end.21

if.end.21:
  %4 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.12, i32 0, i32 0
  %5 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %4)
  %6 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %7 = load %class.IO*, %class.IO** %6, align 8
  %8 = icmp eq %class.IO* %7, null
  br i1 %8, label %if.then.22, label %if.else.22

if.then.22:
  call void @print_dispatch_on_void_error(i32 57)
  %9 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.22

if.else.22:
  br label %if.end.22

if.end.22:
  %10 = getelementptr inbounds [16 x i8], [16 x i8]* @.str.13, i32 0, i32 0
  %11 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %7, i8* %10)
  %12 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %13 = load %class.IO*, %class.IO** %12, align 8
  %14 = icmp eq %class.IO* %13, null
  br i1 %14, label %if.then.23, label %if.else.23

if.then.23:
  call void @print_dispatch_on_void_error(i32 58)
  %15 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.23

if.else.23:
  br label %if.end.23

if.end.23:
  %16 = load i8*, i8** %s1.addr, align 8
  %17 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %13, i8* %16)
  %18 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %19 = load %class.IO*, %class.IO** %18, align 8
  %20 = icmp eq %class.IO* %19, null
  br i1 %20, label %if.then.24, label %if.else.24

if.then.24:
  call void @print_dispatch_on_void_error(i32 59)
  %21 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.24

if.else.24:
  br label %if.end.24

if.end.24:
  %22 = getelementptr inbounds [19 x i8], [19 x i8]* @.str.14, i32 0, i32 0
  %23 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %19, i8* %22)
  %24 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %25 = load %class.IO*, %class.IO** %24, align 8
  %26 = icmp eq %class.IO* %25, null
  br i1 %26, label %if.then.25, label %if.else.25

if.then.25:
  call void @print_dispatch_on_void_error(i32 60)
  %27 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.25

if.else.25:
  br label %if.end.25

if.end.25:
  %28 = load i8*, i8** %s2.addr, align 8
  %29 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %25, i8* %28)
  %30 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %31 = load %class.IO*, %class.IO** %30, align 8
  %32 = icmp eq %class.IO* %31, null
  br i1 %32, label %if.then.26, label %if.else.26

if.then.26:
  call void @print_dispatch_on_void_error(i32 61)
  %33 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.26

if.else.26:
  br label %if.end.26

if.end.26:
  %34 = getelementptr inbounds [72 x i8], [72 x i8]* @.str.15, i32 0, i32 0
  %35 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %31, i8* %34)
  %36 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %37 = load %class.IO*, %class.IO** %36, align 8
  %38 = icmp eq %class.IO* %37, null
  br i1 %38, label %if.then.27, label %if.else.27

if.then.27:
  call void @print_dispatch_on_void_error(i32 62)
  %39 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.27

if.else.27:
  br label %if.end.27

if.end.27:
  %40 = load i32, i32* %x.addr, align 4
  %41 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %37, i32 %40)
  %42 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %43 = load %class.IO*, %class.IO** %42, align 8
  %44 = icmp eq %class.IO* %43, null
  br i1 %44, label %if.then.28, label %if.else.28

if.then.28:
  call void @print_dispatch_on_void_error(i32 63)
  %45 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.28

if.else.28:
  br label %if.end.28

if.end.28:
  %46 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.16, i32 0, i32 0
  %47 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %43, i8* %46)
  %48 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %49 = load %class.IO*, %class.IO** %48, align 8
  %50 = icmp eq %class.IO* %49, null
  br i1 %50, label %if.then.29, label %if.else.29

if.then.29:
  call void @print_dispatch_on_void_error(i32 64)
  %51 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.29

if.else.29:
  br label %if.end.29

if.end.29:
  %52 = load i32, i32* %l.addr, align 4
  %53 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %49, i32 %52)
  %54 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %55 = load %class.IO*, %class.IO** %54, align 8
  %56 = icmp eq %class.IO* %55, null
  br i1 %56, label %if.then.30, label %if.else.30

if.then.30:
  call void @print_dispatch_on_void_error(i32 65)
  %57 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.30

if.else.30:
  br label %if.end.30

if.end.30:
  %58 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.17, i32 0, i32 0
  %59 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %55, i8* %58)
  %60 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %61 = load %class.IO*, %class.IO** %60, align 8
  %62 = icmp eq %class.IO* %61, null
  br i1 %62, label %if.then.31, label %if.else.31

if.then.31:
  call void @print_dispatch_on_void_error(i32 66)
  %63 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.31

if.else.31:
  br label %if.end.31

if.end.31:
  %64 = load i8*, i8** %s1.addr, align 8
  %65 = icmp eq i8* %64, null
  br i1 %65, label %if.then.32, label %if.else.32

if.then.32:
  call void @print_dispatch_on_void_error(i32 66)
  %66 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.32

if.else.32:
  br label %if.end.32

if.end.32:
  %67 = load i8*, i8** %s1.addr, align 8
  %68 = call i64 @strlen(i8* %67)
  %69 = trunc i64 %68 to i32
  %70 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %61, i32 %69)
  %71 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %72 = load %class.IO*, %class.IO** %71, align 8
  %73 = icmp eq %class.IO* %72, null
  br i1 %73, label %if.then.33, label %if.else.33

if.then.33:
  call void @print_dispatch_on_void_error(i32 67)
  %74 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.33

if.else.33:
  br label %if.end.33

if.end.33:
  %75 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.18, i32 0, i32 0
  %76 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %72, i8* %75)
  %77 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %78 = load %class.IO*, %class.IO** %77, align 8
  %79 = icmp eq %class.IO* %78, null
  br i1 %79, label %if.then.34, label %if.else.34

if.then.34:
  call void @print_dispatch_on_void_error(i32 68)
  %80 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.34

if.else.34:
  br label %if.end.34

if.end.34:
  %81 = load i8*, i8** %s1.addr, align 8
  %82 = icmp eq i8* %81, null
  br i1 %82, label %if.then.35, label %if.else.35

if.then.35:
  call void @print_dispatch_on_void_error(i32 68)
  %83 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.35

if.else.35:
  br label %if.end.35

if.end.35:
  %84 = load i8*, i8** %s2.addr, align 8
  %85 = call i8* @_CN6String_FN6concat_(i8* %81, i8* %84)
  %86 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %78, i8* %85)
  %87 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %88 = load %class.IO*, %class.IO** %87, align 8
  %89 = icmp eq %class.IO* %88, null
  br i1 %89, label %if.then.36, label %if.else.36

if.then.36:
  call void @print_dispatch_on_void_error(i32 69)
  %90 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.36

if.else.36:
  br label %if.end.36

if.end.36:
  %91 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.19, i32 0, i32 0
  %92 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %88, i8* %91)
  %93 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %94 = load %class.IO*, %class.IO** %93, align 8
  %95 = icmp eq %class.IO* %94, null
  br i1 %95, label %if.then.37, label %if.else.37

if.then.37:
  call void @print_dispatch_on_void_error(i32 70)
  %96 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.37

if.else.37:
  br label %if.end.37

if.end.37:
  %97 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.2, i32 0, i32 0
  %98 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %94, i8* %97)
  ret i32 0
}

; Class: Main, Method: main
define i32 @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %1 = load %class.C*, %class.C** %0, align 8
  %2 = icmp eq %class.C* %1, null
  br i1 %2, label %if.then.38, label %if.else.38

if.then.38:
  call void @print_dispatch_on_void_error(i32 81)
  %3 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.38

if.else.38:
  br label %if.end.38

if.end.38:
  %4 = call i32 @_CN1C_FN22useInheritedAttributes_(%class.C* %1)
  %5 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %6 = load %class.C*, %class.C** %5, align 8
  %7 = icmp eq %class.C* %6, null
  br i1 %7, label %if.then.39, label %if.else.39

if.then.39:
  call void @print_dispatch_on_void_error(i32 82)
  %8 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.39

if.else.39:
  br label %if.end.39

if.end.39:
  %9 = getelementptr inbounds [4 x i8], [4 x i8]* @.str.20, i32 0, i32 0
  %10 = call i32 @_CN1C_FN15testIOFunctions_(%class.C* %6, i8* %9, i32 6)
  %11 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %12 = load %class.C*, %class.C** %11, align 8
  %13 = icmp eq %class.C* %12, null
  br i1 %13, label %if.then.40, label %if.else.40

if.then.40:
  call void @print_dispatch_on_void_error(i32 83)
  %14 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.40

if.else.40:
  br label %if.end.40

if.end.40:
  %15 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.21, i32 0, i32 0
  %16 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.22, i32 0, i32 0
  %17 = call i32 @_CN1C_FN19testStringFunctions_(%class.C* %12, i8* %15, i8* %16, i32 2, i32 3)
  %18 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %19 = load %class.C*, %class.C** %18, align 8
  %20 = icmp eq %class.C* %19, null
  br i1 %20, label %if.then.41, label %if.else.41

if.then.41:
  call void @print_dispatch_on_void_error(i32 84)
  %21 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.41

if.else.41:
  br label %if.end.41

if.end.41:
  %22 = call i32 @_CN1C_FN19testObjectFunctions_(%class.C* %19)
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
  %3 = call noalias i8* @malloc(i64 0)
  %4 = bitcast i8* %3 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %4)
  store %class.IO* %4, %class.IO** %2, align 4
  %5 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 3
  %6 = call noalias i8* @malloc(i64 0)
  %7 = bitcast i8* %6 to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %7)
  store %class.Object* %7, %class.Object** %5, align 4
  %8 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 4
  %9 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.0, i32 0, i32 0
  store i8* %9, i8** %8, align 8
  ret void
}

; Constructor of class 'Main'
define void @_CN4Main_FN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 36)
  %3 = bitcast i8* %2 to %class.C*
  call void @_CN1C_FN1C_(%class.C* %3)
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

; C strlen declaration
declare i8* @strcpy(i8*, i8*)

; C strlen declaration
declare i8* @strcat(i8*, i8*)

; Class: Object, Method: abort
define %class.Object* @_CN6Object_FN5abort_() {
entry:
  call void @exit(i32 0)
  %0 = call noalias i8* @malloc(i64 0)
  %1 = bitcast i8* %0 to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %1)
  ret %class.Object* %1
}

; Class: IO, Method: out_string
define %class.IO* @_CN2IO_FN10out_string_(%class.IO* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.29, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)
  %1 = call noalias i8* @malloc(i64 0)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: out_int
define %class.IO* @_CN2IO_FN7out_int_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.31, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i32 %d)
  %1 = call noalias i8* @malloc(i64 0)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: in_int
define i32 @_CN2IO_FN6in_int_(%class.IO* %this) {
entry:
  %0 = alloca i32, align 8
  %1 = getelementptr inbounds [4 x i8], [4 x i8]* @.str.32, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: in_string
define i8* @_CN2IO_FN9in_string_(%class.IO* %this) {
entry:
  %0 = alloca i8*, align 8
  %1 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.30, i32 0, i32 0
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
define void @print_div_by_zero_err_msg(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.29, i32 0, i32 0
  %1 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.33, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.31, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.28, i32 0, i32 0
  %6 = call i32 (i8*, ...) @printf(i8* %0, i8* %5)
  ret void
}
define void @print_dispatch_on_void_error(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.29, i32 0, i32 0
  %1 = getelementptr inbounds [30 x i8], [30 x i8]* @.str.34, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.31, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.28, i32 0, i32 0
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
