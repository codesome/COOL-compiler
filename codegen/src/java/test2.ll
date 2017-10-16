; ModuleID = '../test_cases/test2.cl'
source_filename = "../test_cases/test2.cl"

; String constant declarations
@.str.32 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.0 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"Int : \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.13 = private unnamed_addr constant [19 x i8] c"Object is not void\00", align 1
@.str.5 = private unnamed_addr constant [38 x i8] c"Printing default values of each type
\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"E\00", align 1
@.str.11 = private unnamed_addr constant [42 x i8] c"
Other class without new, here class B : \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"F\00", align 1
@.str.14 = private unnamed_addr constant [39 x i8] c"
Other class with new, here class B : \00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"True\00", align 1
@.str.26 = private unnamed_addr constant [47 x i8] c"
Dynamic type F, static type F, called on F : \00", align 1
@.str.38 = private unnamed_addr constant [35 x i8] c"
Divide by 0 exception at line no \00", align 1
@.str.33 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"False\00", align 1
@.str.18 = private unnamed_addr constant [47 x i8] c"
Dynamic type B, static type B, called on A : \00", align 1
@.str.37 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.43 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.22 = private unnamed_addr constant [47 x i8] c"
Dynamic type A, static type A, called on A : \00", align 1
@.str.44 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.28 = private unnamed_addr constant [6 x i8] c"Hello\00", align 1
@.str.45 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@.str.16 = private unnamed_addr constant [90 x i8] c"Calling static dispatch on f1(), member of A gives 0, member of B gives 1 np member in F
\00", align 1
@.str.27 = private unnamed_addr constant [73 x i8] c"Displaying consts 1 and 'Hello', and test with if for Bool const 'true'
\00", align 1
@.str.23 = private unnamed_addr constant [47 x i8] c"
Dynamic type F, static type A, called on A : \00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c"Object is void\00", align 1
@.str.20 = private unnamed_addr constant [47 x i8] c"
Dynamic type B, static type A, called on A : \00", align 1
@.str.36 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.25 = private unnamed_addr constant [47 x i8] c"
Dynamic type F, static type F, called on A : \00", align 1
@.str.17 = private unnamed_addr constant [46 x i8] c"Dynamic type B, static type B, called on B : \00", align 1
@.str.21 = private unnamed_addr constant [58 x i8] c"
Dynamic type A, static type A, called on B : Not allowed\00", align 1
@.str.42 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.30 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str.40 = private unnamed_addr constant [26 x i8] c"
Abort called from class \00", align 1
@.str.19 = private unnamed_addr constant [58 x i8] c"
Dynamic type B, static type A, called on B : Not allowed\00", align 1
@.str.39 = private unnamed_addr constant [30 x i8] c"
Dispatch to void at line no \00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"
String : \00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"
Bool : \00", align 1
@.str.34 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.15 = private unnamed_addr constant [13 x i8] c"
Completed

\00", align 1
@.str.24 = private unnamed_addr constant [58 x i8] c"
Dynamic type F, static type A, called on F : Not allowed\00", align 1
@.str.29 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.41 = private unnamed_addr constant [7 x i8] c"Object\00", align 1
@.str.31 = private unnamed_addr constant [5 x i8] c"Main\00", align 1
@.str.35 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1

; Struct declarations
%class.Object = type {i8*}
%class.A = type { %class.Object, i32 }
%class.B = type { %class.A, i32 }
%class.F = type { %class.B, i32 }
%class.E = type { %class.A, i32 }
%class.C = type { %class.Object, i32, i8, i8*, %class.B*, %class.B*, %class.IO*, %class.A*, %class.A*, %class.A*, %class.F*, %class.A* }
%class.Main = type { %class.Object, %class.C*, %class.A* }
%class.IO = type { %class.Object }


; Class: A, Method: f1
define i32 @_CN1A_FN2f1_(%class.A* %this) {

entry:
  ret i32 0
}

; Constructor of class 'A'
define void @_CN1A_FN1A_(%class.A* %this) {

entry:
  %0 = bitcast %class.A* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  store i32 0, i32* %1, align 4
  ret void
}

; Class: B, Method: f1
define i32 @_CN1B_FN2f1_(%class.B* %this) {

entry:
  ret i32 1
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

; Constructor of class 'F'
define void @_CN1F_FN1F_(%class.F* %this) {

entry:
  %0 = bitcast %class.F* %this to %class.B*
  call void @_CN1B_FN1B_(%class.B* %0)
  %1 = getelementptr inbounds %class.F, %class.F* %this, i32 0, i32 1
  store i32 0, i32* %1, align 4
  ret void
}

; Constructor of class 'E'
define void @_CN1E_FN1E_(%class.E* %this) {

entry:
  %0 = bitcast %class.E* %this to %class.A*
  call void @_CN1A_FN1A_(%class.A* %0)
  %1 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 1
  store i32 0, i32* %1, align 4
  ret void
}

; Class: C, Method: checkDefaultValues
define %class.Object* @_CN1C_FN18checkDefaultValues_(%class.C* %this) {

entry:
  %0 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %if.then, label %if.else

if.then:
  call void @print_dispatch_on_void_error(i32 38)
  call void @exit(i32 1)
  br label %if.end

if.else:
  br label %if.end

if.end:
  %3 = getelementptr inbounds [38 x i8], [38 x i8]* @.str.5, i32 0, i32 0
  %4 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %3)
  %5 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %6 = load %class.IO*, %class.IO** %5, align 8
  %7 = icmp eq %class.IO* %6, null
  br i1 %7, label %if.then.1, label %if.else.1

if.then.1:
  call void @print_dispatch_on_void_error(i32 39)
  call void @exit(i32 1)
  br label %if.end.1

if.else.1:
  br label %if.end.1

if.end.1:
  %8 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.6, i32 0, i32 0
  %9 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %6, i8* %8)
  %10 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %11 = load %class.IO*, %class.IO** %10, align 8
  %12 = icmp eq %class.IO* %11, null
  br i1 %12, label %if.then.2, label %if.else.2

if.then.2:
  call void @print_dispatch_on_void_error(i32 40)
  call void @exit(i32 1)
  br label %if.end.2

if.else.2:
  br label %if.end.2

if.end.2:
  %13 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 1
  %14 = load i32, i32* %13, align 4
  %15 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %11, i32 %14)
  %16 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %17 = load %class.IO*, %class.IO** %16, align 8
  %18 = icmp eq %class.IO* %17, null
  br i1 %18, label %if.then.3, label %if.else.3

if.then.3:
  call void @print_dispatch_on_void_error(i32 41)
  call void @exit(i32 1)
  br label %if.end.3

if.else.3:
  br label %if.end.3

if.end.3:
  %19 = getelementptr inbounds [11 x i8], [11 x i8]* @.str.7, i32 0, i32 0
  %20 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %17, i8* %19)
  %21 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %22 = load %class.IO*, %class.IO** %21, align 8
  %23 = icmp eq %class.IO* %22, null
  br i1 %23, label %if.then.4, label %if.else.4

if.then.4:
  call void @print_dispatch_on_void_error(i32 42)
  call void @exit(i32 1)
  br label %if.end.4

if.else.4:
  br label %if.end.4

if.end.4:
  %24 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 3
  %25 = load i8*, i8** %24, align 8
  %26 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %22, i8* %25)
  %27 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %28 = load %class.IO*, %class.IO** %27, align 8
  %29 = icmp eq %class.IO* %28, null
  br i1 %29, label %if.then.5, label %if.else.5

if.then.5:
  call void @print_dispatch_on_void_error(i32 43)
  call void @exit(i32 1)
  br label %if.end.5

if.else.5:
  br label %if.end.5

if.end.5:
  %30 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.8, i32 0, i32 0
  %31 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %28, i8* %30)
  %32 = alloca %class.IO, align 8
  %33 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %34 = load i8, i8* %33, align 4
  %35 = trunc i8 %34 to i1
  br i1 %35, label %if.then.6, label %if.else.6

if.then.6:
  %36 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %37 = load %class.IO*, %class.IO** %36, align 8
  %38 = icmp eq %class.IO* %37, null
  br i1 %38, label %if.then.7, label %if.else.7

if.then.7:
  call void @print_dispatch_on_void_error(i32 44)
  call void @exit(i32 1)
  br label %if.end.7

if.else.7:
  br label %if.end.7

if.end.7:
  %39 = getelementptr inbounds [5 x i8], [5 x i8]* @.str.9, i32 0, i32 0
  %40 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %37, i8* %39)
  %41 = load %class.IO, %class.IO* %40, align 4
  store %class.IO %41, %class.IO* %32, align 4
  br label %if.end.6

if.else.6:
  %42 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %43 = load %class.IO*, %class.IO** %42, align 8
  %44 = icmp eq %class.IO* %43, null
  br i1 %44, label %if.then.8, label %if.else.8

if.then.8:
  call void @print_dispatch_on_void_error(i32 44)
  call void @exit(i32 1)
  br label %if.end.8

if.else.8:
  br label %if.end.8

if.end.8:
  %45 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.10, i32 0, i32 0
  %46 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %43, i8* %45)
  %47 = load %class.IO, %class.IO* %46, align 4
  store %class.IO %47, %class.IO* %32, align 4
  br label %if.end.6

if.end.6:
  %48 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %49 = load %class.IO*, %class.IO** %48, align 8
  %50 = icmp eq %class.IO* %49, null
  br i1 %50, label %if.then.9, label %if.else.9

if.then.9:
  call void @print_dispatch_on_void_error(i32 45)
  call void @exit(i32 1)
  br label %if.end.9

if.else.9:
  br label %if.end.9

if.end.9:
  %51 = getelementptr inbounds [42 x i8], [42 x i8]* @.str.11, i32 0, i32 0
  %52 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %49, i8* %51)
  %53 = alloca %class.IO, align 8
  %54 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 4
  %55 = load %class.B*, %class.B** %54, align 8
  %56 = icmp eq %class.B* %55, null
  %57 = zext i1 %56 to i8
  %58 = trunc i8 %57 to i1
  br i1 %58, label %if.then.10, label %if.else.10

if.then.10:
  %59 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %60 = load %class.IO*, %class.IO** %59, align 8
  %61 = icmp eq %class.IO* %60, null
  br i1 %61, label %if.then.11, label %if.else.11

if.then.11:
  call void @print_dispatch_on_void_error(i32 47)
  call void @exit(i32 1)
  br label %if.end.11

if.else.11:
  br label %if.end.11

if.end.11:
  %62 = getelementptr inbounds [15 x i8], [15 x i8]* @.str.12, i32 0, i32 0
  %63 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %60, i8* %62)
  %64 = load %class.IO, %class.IO* %63, align 4
  store %class.IO %64, %class.IO* %53, align 4
  br label %if.end.10

if.else.10:
  %65 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %66 = load %class.IO*, %class.IO** %65, align 8
  %67 = icmp eq %class.IO* %66, null
  br i1 %67, label %if.then.12, label %if.else.12

if.then.12:
  call void @print_dispatch_on_void_error(i32 49)
  call void @exit(i32 1)
  br label %if.end.12

if.else.12:
  br label %if.end.12

if.end.12:
  %68 = getelementptr inbounds [19 x i8], [19 x i8]* @.str.13, i32 0, i32 0
  %69 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %66, i8* %68)
  %70 = load %class.IO, %class.IO* %69, align 4
  store %class.IO %70, %class.IO* %53, align 4
  br label %if.end.10

if.end.10:
  %71 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %72 = load %class.IO*, %class.IO** %71, align 8
  %73 = icmp eq %class.IO* %72, null
  br i1 %73, label %if.then.13, label %if.else.13

if.then.13:
  call void @print_dispatch_on_void_error(i32 51)
  call void @exit(i32 1)
  br label %if.end.13

if.else.13:
  br label %if.end.13

if.end.13:
  %74 = getelementptr inbounds [39 x i8], [39 x i8]* @.str.14, i32 0, i32 0
  %75 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %72, i8* %74)
  %76 = alloca %class.IO, align 8
  %77 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 5
  %78 = load %class.B*, %class.B** %77, align 8
  %79 = icmp eq %class.B* %78, null
  %80 = zext i1 %79 to i8
  %81 = trunc i8 %80 to i1
  br i1 %81, label %if.then.14, label %if.else.14

if.then.14:
  %82 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %83 = load %class.IO*, %class.IO** %82, align 8
  %84 = icmp eq %class.IO* %83, null
  br i1 %84, label %if.then.15, label %if.else.15

if.then.15:
  call void @print_dispatch_on_void_error(i32 53)
  call void @exit(i32 1)
  br label %if.end.15

if.else.15:
  br label %if.end.15

if.end.15:
  %85 = getelementptr inbounds [15 x i8], [15 x i8]* @.str.12, i32 0, i32 0
  %86 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %83, i8* %85)
  %87 = load %class.IO, %class.IO* %86, align 4
  store %class.IO %87, %class.IO* %76, align 4
  br label %if.end.14

if.else.14:
  %88 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %89 = load %class.IO*, %class.IO** %88, align 8
  %90 = icmp eq %class.IO* %89, null
  br i1 %90, label %if.then.16, label %if.else.16

if.then.16:
  call void @print_dispatch_on_void_error(i32 55)
  call void @exit(i32 1)
  br label %if.end.16

if.else.16:
  br label %if.end.16

if.end.16:
  %91 = getelementptr inbounds [19 x i8], [19 x i8]* @.str.13, i32 0, i32 0
  %92 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %89, i8* %91)
  %93 = load %class.IO, %class.IO* %92, align 4
  store %class.IO %93, %class.IO* %76, align 4
  br label %if.end.14

if.end.14:
  %94 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %95 = load %class.IO*, %class.IO** %94, align 8
  %96 = icmp eq %class.IO* %95, null
  br i1 %96, label %if.then.17, label %if.else.17

if.then.17:
  call void @print_dispatch_on_void_error(i32 57)
  call void @exit(i32 1)
  br label %if.end.17

if.else.17:
  br label %if.end.17

if.end.17:
  %97 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.15, i32 0, i32 0
  %98 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %95, i8* %97)
  %99 = bitcast %class.IO* %98 to %class.Object*
  ret %class.Object* %99
}

; Class: C, Method: testStaticDispatch
define i32 @_CN1C_FN18testStaticDispatch_(%class.C* %this) {

entry:
  %0 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %if.then.18, label %if.else.18

if.then.18:
  call void @print_dispatch_on_void_error(i32 63)
  call void @exit(i32 1)
  br label %if.end.18

if.else.18:
  br label %if.end.18

if.end.18:
  %3 = getelementptr inbounds [90 x i8], [90 x i8]* @.str.16, i32 0, i32 0
  %4 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %3)
  %5 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %6 = load %class.IO*, %class.IO** %5, align 8
  %7 = icmp eq %class.IO* %6, null
  br i1 %7, label %if.then.19, label %if.else.19

if.then.19:
  call void @print_dispatch_on_void_error(i32 64)
  call void @exit(i32 1)
  br label %if.end.19

if.else.19:
  br label %if.end.19

if.end.19:
  %8 = getelementptr inbounds [46 x i8], [46 x i8]* @.str.17, i32 0, i32 0
  %9 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %6, i8* %8)
  %10 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %11 = load %class.IO*, %class.IO** %10, align 8
  %12 = icmp eq %class.IO* %11, null
  br i1 %12, label %if.then.20, label %if.else.20

if.then.20:
  call void @print_dispatch_on_void_error(i32 65)
  call void @exit(i32 1)
  br label %if.end.20

if.else.20:
  br label %if.end.20

if.end.20:
  %13 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 5
  %14 = load %class.B*, %class.B** %13, align 8
  %15 = icmp eq %class.B* %14, null
  br i1 %15, label %if.then.21, label %if.else.21

if.then.21:
  call void @print_dispatch_on_void_error(i32 65)
  call void @exit(i32 1)
  br label %if.end.21

if.else.21:
  br label %if.end.21

if.end.21:
  %16 = call i32 @_CN1B_FN2f1_(%class.B* %14)
  %17 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %11, i32 %16)
  %18 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %19 = load %class.IO*, %class.IO** %18, align 8
  %20 = icmp eq %class.IO* %19, null
  br i1 %20, label %if.then.22, label %if.else.22

if.then.22:
  call void @print_dispatch_on_void_error(i32 66)
  call void @exit(i32 1)
  br label %if.end.22

if.else.22:
  br label %if.end.22

if.end.22:
  %21 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.18, i32 0, i32 0
  %22 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %19, i8* %21)
  %23 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %24 = load %class.IO*, %class.IO** %23, align 8
  %25 = icmp eq %class.IO* %24, null
  br i1 %25, label %if.then.23, label %if.else.23

if.then.23:
  call void @print_dispatch_on_void_error(i32 67)
  call void @exit(i32 1)
  br label %if.end.23

if.else.23:
  br label %if.end.23

if.end.23:
  %26 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 5
  %27 = load %class.B*, %class.B** %26, align 8
  %28 = icmp eq %class.B* %27, null
  br i1 %28, label %if.then.24, label %if.else.24

if.then.24:
  call void @print_dispatch_on_void_error(i32 67)
  call void @exit(i32 1)
  br label %if.end.24

if.else.24:
  br label %if.end.24

if.end.24:
  %29 = bitcast %class.B* %27 to %class.A*
  %30 = call i32 @_CN1A_FN2f1_(%class.A* %29)
  %31 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %24, i32 %30)
  %32 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %33 = load %class.IO*, %class.IO** %32, align 8
  %34 = icmp eq %class.IO* %33, null
  br i1 %34, label %if.then.25, label %if.else.25

if.then.25:
  call void @print_dispatch_on_void_error(i32 68)
  call void @exit(i32 1)
  br label %if.end.25

if.else.25:
  br label %if.end.25

if.end.25:
  %35 = getelementptr inbounds [58 x i8], [58 x i8]* @.str.19, i32 0, i32 0
  %36 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %33, i8* %35)
  %37 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %38 = load %class.IO*, %class.IO** %37, align 8
  %39 = icmp eq %class.IO* %38, null
  br i1 %39, label %if.then.26, label %if.else.26

if.then.26:
  call void @print_dispatch_on_void_error(i32 69)
  call void @exit(i32 1)
  br label %if.end.26

if.else.26:
  br label %if.end.26

if.end.26:
  %40 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.20, i32 0, i32 0
  %41 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %38, i8* %40)
  %42 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %43 = load %class.IO*, %class.IO** %42, align 8
  %44 = icmp eq %class.IO* %43, null
  br i1 %44, label %if.then.27, label %if.else.27

if.then.27:
  call void @print_dispatch_on_void_error(i32 70)
  call void @exit(i32 1)
  br label %if.end.27

if.else.27:
  br label %if.end.27

if.end.27:
  %45 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 7
  %46 = load %class.A*, %class.A** %45, align 8
  %47 = icmp eq %class.A* %46, null
  br i1 %47, label %if.then.28, label %if.else.28

if.then.28:
  call void @print_dispatch_on_void_error(i32 70)
  call void @exit(i32 1)
  br label %if.end.28

if.else.28:
  br label %if.end.28

if.end.28:
  %48 = call i32 @_CN1A_FN2f1_(%class.A* %46)
  %49 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %43, i32 %48)
  %50 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %51 = load %class.IO*, %class.IO** %50, align 8
  %52 = icmp eq %class.IO* %51, null
  br i1 %52, label %if.then.29, label %if.else.29

if.then.29:
  call void @print_dispatch_on_void_error(i32 71)
  call void @exit(i32 1)
  br label %if.end.29

if.else.29:
  br label %if.end.29

if.end.29:
  %53 = getelementptr inbounds [58 x i8], [58 x i8]* @.str.21, i32 0, i32 0
  %54 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %51, i8* %53)
  %55 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %56 = load %class.IO*, %class.IO** %55, align 8
  %57 = icmp eq %class.IO* %56, null
  br i1 %57, label %if.then.30, label %if.else.30

if.then.30:
  call void @print_dispatch_on_void_error(i32 72)
  call void @exit(i32 1)
  br label %if.end.30

if.else.30:
  br label %if.end.30

if.end.30:
  %58 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.22, i32 0, i32 0
  %59 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %56, i8* %58)
  %60 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %61 = load %class.IO*, %class.IO** %60, align 8
  %62 = icmp eq %class.IO* %61, null
  br i1 %62, label %if.then.31, label %if.else.31

if.then.31:
  call void @print_dispatch_on_void_error(i32 73)
  call void @exit(i32 1)
  br label %if.end.31

if.else.31:
  br label %if.end.31

if.end.31:
  %63 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 8
  %64 = load %class.A*, %class.A** %63, align 8
  %65 = icmp eq %class.A* %64, null
  br i1 %65, label %if.then.32, label %if.else.32

if.then.32:
  call void @print_dispatch_on_void_error(i32 73)
  call void @exit(i32 1)
  br label %if.end.32

if.else.32:
  br label %if.end.32

if.end.32:
  %66 = call i32 @_CN1A_FN2f1_(%class.A* %64)
  %67 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %61, i32 %66)
  %68 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %69 = load %class.IO*, %class.IO** %68, align 8
  %70 = icmp eq %class.IO* %69, null
  br i1 %70, label %if.then.33, label %if.else.33

if.then.33:
  call void @print_dispatch_on_void_error(i32 74)
  call void @exit(i32 1)
  br label %if.end.33

if.else.33:
  br label %if.end.33

if.end.33:
  %71 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.23, i32 0, i32 0
  %72 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %69, i8* %71)
  %73 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %74 = load %class.IO*, %class.IO** %73, align 8
  %75 = icmp eq %class.IO* %74, null
  br i1 %75, label %if.then.34, label %if.else.34

if.then.34:
  call void @print_dispatch_on_void_error(i32 75)
  call void @exit(i32 1)
  br label %if.end.34

if.else.34:
  br label %if.end.34

if.end.34:
  %76 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 11
  %77 = load %class.A*, %class.A** %76, align 8
  %78 = icmp eq %class.A* %77, null
  br i1 %78, label %if.then.35, label %if.else.35

if.then.35:
  call void @print_dispatch_on_void_error(i32 75)
  call void @exit(i32 1)
  br label %if.end.35

if.else.35:
  br label %if.end.35

if.end.35:
  %79 = call i32 @_CN1A_FN2f1_(%class.A* %77)
  %80 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %74, i32 %79)
  %81 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %82 = load %class.IO*, %class.IO** %81, align 8
  %83 = icmp eq %class.IO* %82, null
  br i1 %83, label %if.then.36, label %if.else.36

if.then.36:
  call void @print_dispatch_on_void_error(i32 76)
  call void @exit(i32 1)
  br label %if.end.36

if.else.36:
  br label %if.end.36

if.end.36:
  %84 = getelementptr inbounds [58 x i8], [58 x i8]* @.str.24, i32 0, i32 0
  %85 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %82, i8* %84)
  %86 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %87 = load %class.IO*, %class.IO** %86, align 8
  %88 = icmp eq %class.IO* %87, null
  br i1 %88, label %if.then.37, label %if.else.37

if.then.37:
  call void @print_dispatch_on_void_error(i32 77)
  call void @exit(i32 1)
  br label %if.end.37

if.else.37:
  br label %if.end.37

if.end.37:
  %89 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.25, i32 0, i32 0
  %90 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %87, i8* %89)
  %91 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %92 = load %class.IO*, %class.IO** %91, align 8
  %93 = icmp eq %class.IO* %92, null
  br i1 %93, label %if.then.38, label %if.else.38

if.then.38:
  call void @print_dispatch_on_void_error(i32 78)
  call void @exit(i32 1)
  br label %if.end.38

if.else.38:
  br label %if.end.38

if.end.38:
  %94 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 10
  %95 = load %class.F*, %class.F** %94, align 8
  %96 = icmp eq %class.F* %95, null
  br i1 %96, label %if.then.39, label %if.else.39

if.then.39:
  call void @print_dispatch_on_void_error(i32 78)
  call void @exit(i32 1)
  br label %if.end.39

if.else.39:
  br label %if.end.39

if.end.39:
  %97 = bitcast %class.F* %95 to %class.A*
  %98 = call i32 @_CN1A_FN2f1_(%class.A* %97)
  %99 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %92, i32 %98)
  %100 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %101 = load %class.IO*, %class.IO** %100, align 8
  %102 = icmp eq %class.IO* %101, null
  br i1 %102, label %if.then.40, label %if.else.40

if.then.40:
  call void @print_dispatch_on_void_error(i32 79)
  call void @exit(i32 1)
  br label %if.end.40

if.else.40:
  br label %if.end.40

if.end.40:
  %103 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.26, i32 0, i32 0
  %104 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %101, i8* %103)
  %105 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %106 = load %class.IO*, %class.IO** %105, align 8
  %107 = icmp eq %class.IO* %106, null
  br i1 %107, label %if.then.41, label %if.else.41

if.then.41:
  call void @print_dispatch_on_void_error(i32 80)
  call void @exit(i32 1)
  br label %if.end.41

if.else.41:
  br label %if.end.41

if.end.41:
  %108 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 10
  %109 = load %class.F*, %class.F** %108, align 8
  %110 = icmp eq %class.F* %109, null
  br i1 %110, label %if.then.42, label %if.else.42

if.then.42:
  call void @print_dispatch_on_void_error(i32 80)
  call void @exit(i32 1)
  br label %if.end.42

if.else.42:
  br label %if.end.42

if.end.42:
  %111 = bitcast %class.F* %109 to %class.B*
  %112 = call i32 @_CN1B_FN2f1_(%class.B* %111)
  %113 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %106, i32 %112)
  %114 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %115 = load %class.IO*, %class.IO** %114, align 8
  %116 = icmp eq %class.IO* %115, null
  br i1 %116, label %if.then.43, label %if.else.43

if.then.43:
  call void @print_dispatch_on_void_error(i32 81)
  call void @exit(i32 1)
  br label %if.end.43

if.else.43:
  br label %if.end.43

if.end.43:
  %117 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.15, i32 0, i32 0
  %118 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %115, i8* %117)
  ret i32 0
}

; Class: C, Method: staticDispatchOnNull
define i32 @_CN1C_FN20staticDispatchOnNull_(%class.C* %this) {

entry:
  %0 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 4
  %1 = load %class.B*, %class.B** %0, align 8
  %2 = icmp eq %class.B* %1, null
  br i1 %2, label %if.then.44, label %if.else.44

if.then.44:
  call void @print_dispatch_on_void_error(i32 87)
  call void @exit(i32 1)
  br label %if.end.44

if.else.44:
  br label %if.end.44

if.end.44:
  %3 = call i32 @_CN1B_FN2f1_(%class.B* %1)
  ret i32 %3
}

; Class: C, Method: checkConsts
define i32 @_CN1C_FN11checkConsts_(%class.C* %this) {

entry:
  %0 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %if.then.45, label %if.else.45

if.then.45:
  call void @print_dispatch_on_void_error(i32 92)
  call void @exit(i32 1)
  br label %if.end.45

if.else.45:
  br label %if.end.45

if.end.45:
  %3 = getelementptr inbounds [73 x i8], [73 x i8]* @.str.27, i32 0, i32 0
  %4 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %3)
  %5 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %6 = load %class.IO*, %class.IO** %5, align 8
  %7 = icmp eq %class.IO* %6, null
  br i1 %7, label %if.then.46, label %if.else.46

if.then.46:
  call void @print_dispatch_on_void_error(i32 93)
  call void @exit(i32 1)
  br label %if.end.46

if.else.46:
  br label %if.end.46

if.end.46:
  %8 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.6, i32 0, i32 0
  %9 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %6, i8* %8)
  %10 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %11 = load %class.IO*, %class.IO** %10, align 8
  %12 = icmp eq %class.IO* %11, null
  br i1 %12, label %if.then.47, label %if.else.47

if.then.47:
  call void @print_dispatch_on_void_error(i32 94)
  call void @exit(i32 1)
  br label %if.end.47

if.else.47:
  br label %if.end.47

if.end.47:
  %13 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %11, i32 1)
  %14 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %15 = load %class.IO*, %class.IO** %14, align 8
  %16 = icmp eq %class.IO* %15, null
  br i1 %16, label %if.then.48, label %if.else.48

if.then.48:
  call void @print_dispatch_on_void_error(i32 95)
  call void @exit(i32 1)
  br label %if.end.48

if.else.48:
  br label %if.end.48

if.end.48:
  %17 = getelementptr inbounds [11 x i8], [11 x i8]* @.str.7, i32 0, i32 0
  %18 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %15, i8* %17)
  %19 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %20 = load %class.IO*, %class.IO** %19, align 8
  %21 = icmp eq %class.IO* %20, null
  br i1 %21, label %if.then.49, label %if.else.49

if.then.49:
  call void @print_dispatch_on_void_error(i32 96)
  call void @exit(i32 1)
  br label %if.end.49

if.else.49:
  br label %if.end.49

if.end.49:
  %22 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.28, i32 0, i32 0
  %23 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %20, i8* %22)
  %24 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %25 = load %class.IO*, %class.IO** %24, align 8
  %26 = icmp eq %class.IO* %25, null
  br i1 %26, label %if.then.50, label %if.else.50

if.then.50:
  call void @print_dispatch_on_void_error(i32 97)
  call void @exit(i32 1)
  br label %if.end.50

if.else.50:
  br label %if.end.50

if.end.50:
  %27 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.8, i32 0, i32 0
  %28 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %25, i8* %27)
  %29 = alloca %class.IO, align 8
  %30 = trunc i8 1 to i1
  br i1 %30, label %if.then.51, label %if.else.51

if.then.51:
  %31 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %32 = load %class.IO*, %class.IO** %31, align 8
  %33 = icmp eq %class.IO* %32, null
  br i1 %33, label %if.then.52, label %if.else.52

if.then.52:
  call void @print_dispatch_on_void_error(i32 99)
  call void @exit(i32 1)
  br label %if.end.52

if.else.52:
  br label %if.end.52

if.end.52:
  %34 = getelementptr inbounds [5 x i8], [5 x i8]* @.str.29, i32 0, i32 0
  %35 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %32, i8* %34)
  %36 = load %class.IO, %class.IO* %35, align 4
  store %class.IO %36, %class.IO* %29, align 4
  br label %if.end.51

if.else.51:
  %37 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %38 = load %class.IO*, %class.IO** %37, align 8
  %39 = icmp eq %class.IO* %38, null
  br i1 %39, label %if.then.53, label %if.else.53

if.then.53:
  call void @print_dispatch_on_void_error(i32 101)
  call void @exit(i32 1)
  br label %if.end.53

if.else.53:
  br label %if.end.53

if.end.53:
  %40 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.30, i32 0, i32 0
  %41 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %38, i8* %40)
  %42 = load %class.IO, %class.IO* %41, align 4
  store %class.IO %42, %class.IO* %29, align 4
  br label %if.end.51

if.end.51:
  %43 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %44 = load %class.IO*, %class.IO** %43, align 8
  %45 = icmp eq %class.IO* %44, null
  br i1 %45, label %if.then.54, label %if.else.54

if.then.54:
  call void @print_dispatch_on_void_error(i32 103)
  call void @exit(i32 1)
  br label %if.end.54

if.else.54:
  br label %if.end.54

if.end.54:
  %46 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.15, i32 0, i32 0
  %47 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %44, i8* %46)
  ret i32 0
}

; Class: C, Method: ifWithDifferentReturnTypes
define %class.A* @_CN1C_FN26ifWithDifferentReturnTypes_(%class.C* %this, i8 %b) {

entry:
  %b.addr = alloca i8, align 8
  store i8 %b, i8* %b.addr, align 4
  %0 = alloca %class.A, align 8
  %1 = load i8, i8* %b.addr, align 4
  %2 = trunc i8 %1 to i1
  br i1 %2, label %if.then.55, label %if.else.55

if.then.55:
  %3 = call noalias i8* @malloc(i64 24)
  %4 = bitcast i8* %3 to %class.B*
  call void @_CN1B_FN1B_(%class.B* %4)
  %5 = bitcast %class.B* %4 to %class.Object*
  %6 = getelementptr inbounds %class.Object, %class.Object* %5, i32 0, i32 0
  %7 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.1, i32 0, i32 0
  store i8* %7, i8** %6, align 8
  %8 = bitcast %class.B* %4 to %class.A*
  %9 = load %class.A, %class.A* %8, align 4
  store %class.A %9, %class.A* %0, align 4
  br label %if.end.55

if.else.55:
  %10 = call noalias i8* @malloc(i64 24)
  %11 = bitcast i8* %10 to %class.E*
  call void @_CN1E_FN1E_(%class.E* %11)
  %12 = bitcast %class.E* %11 to %class.Object*
  %13 = getelementptr inbounds %class.Object, %class.Object* %12, i32 0, i32 0
  %14 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  store i8* %14, i8** %13, align 8
  %15 = bitcast %class.E* %11 to %class.A*
  %16 = load %class.A, %class.A* %15, align 4
  store %class.A %16, %class.A* %0, align 4
  br label %if.end.55

if.end.55:
  %17 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 9
  store %class.A* %0, %class.A** %17, align 8
  %18 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %19 = load %class.IO*, %class.IO** %18, align 8
  %20 = icmp eq %class.IO* %19, null
  br i1 %20, label %if.then.56, label %if.else.56

if.then.56:
  call void @print_dispatch_on_void_error(i32 111)
  call void @exit(i32 1)
  br label %if.end.56

if.else.56:
  br label %if.end.56

if.end.56:
  %21 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 9
  %22 = load %class.A*, %class.A** %21, align 8
  %23 = icmp eq %class.A* %22, null
  br i1 %23, label %if.then.57, label %if.else.57

if.then.57:
  call void @print_dispatch_on_void_error(i32 111)
  call void @exit(i32 1)
  br label %if.end.57

if.else.57:
  br label %if.end.57

if.end.57:
  %24 = bitcast %class.A* %22 to %class.Object*
  %25 = call i8* @_CN6Object_FN9type_name_(%class.Object* %24)
  %26 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %19, i8* %25)
  %27 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 9
  %28 = load %class.A*, %class.A** %27, align 8
  ret %class.A* %28
}

; Constructor of class 'C'
define void @_CN1C_FN1C_(%class.C* %this) {

entry:
  %0 = bitcast %class.C* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 1
  store i32 0, i32* %1, align 4
  %2 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  store i8 0, i8* %2, align 4
  %3 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 3
  %4 = getelementptr inbounds [1 x i8], [1 x i8]* @.str.32, i32 0, i32 0
  store i8* %4, i8** %3, align 8
  %5 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 4
  store %class.B* null, %class.B** %5, align 4
  %6 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 5
  %7 = call noalias i8* @malloc(i64 24)
  %8 = bitcast i8* %7 to %class.B*
  call void @_CN1B_FN1B_(%class.B* %8)
  %9 = bitcast %class.B* %8 to %class.Object*
  %10 = getelementptr inbounds %class.Object, %class.Object* %9, i32 0, i32 0
  %11 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.1, i32 0, i32 0
  store i8* %11, i8** %10, align 8
  store %class.B* %8, %class.B** %6, align 4
  %12 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %13 = call noalias i8* @malloc(i64 8)
  %14 = bitcast i8* %13 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %14)
  %15 = bitcast %class.IO* %14 to %class.Object*
  %16 = getelementptr inbounds %class.Object, %class.Object* %15, i32 0, i32 0
  %17 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.42, i32 0, i32 0
  store i8* %17, i8** %16, align 8
  store %class.IO* %14, %class.IO** %12, align 4
  %18 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 7
  %19 = call noalias i8* @malloc(i64 24)
  %20 = bitcast i8* %19 to %class.B*
  call void @_CN1B_FN1B_(%class.B* %20)
  %21 = bitcast %class.B* %20 to %class.Object*
  %22 = getelementptr inbounds %class.Object, %class.Object* %21, i32 0, i32 0
  %23 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.1, i32 0, i32 0
  store i8* %23, i8** %22, align 8
  %24 = bitcast %class.B* %20 to %class.A*
  store %class.A* %24, %class.A** %18, align 4
  %25 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 8
  %26 = call noalias i8* @malloc(i64 12)
  %27 = bitcast i8* %26 to %class.A*
  call void @_CN1A_FN1A_(%class.A* %27)
  %28 = bitcast %class.A* %27 to %class.Object*
  %29 = getelementptr inbounds %class.Object, %class.Object* %28, i32 0, i32 0
  %30 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.0, i32 0, i32 0
  store i8* %30, i8** %29, align 8
  store %class.A* %27, %class.A** %25, align 4
  %31 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 9
  store %class.A* null, %class.A** %31, align 4
  %32 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 10
  %33 = call noalias i8* @malloc(i64 36)
  %34 = bitcast i8* %33 to %class.F*
  call void @_CN1F_FN1F_(%class.F* %34)
  %35 = bitcast %class.F* %34 to %class.Object*
  %36 = getelementptr inbounds %class.Object, %class.Object* %35, i32 0, i32 0
  %37 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.3, i32 0, i32 0
  store i8* %37, i8** %36, align 8
  store %class.F* %34, %class.F** %32, align 4
  %38 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 11
  %39 = call noalias i8* @malloc(i64 36)
  %40 = bitcast i8* %39 to %class.F*
  call void @_CN1F_FN1F_(%class.F* %40)
  %41 = bitcast %class.F* %40 to %class.Object*
  %42 = getelementptr inbounds %class.Object, %class.Object* %41, i32 0, i32 0
  %43 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.3, i32 0, i32 0
  store i8* %43, i8** %42, align 8
  %44 = bitcast %class.F* %40 to %class.B*
  %45 = bitcast %class.B* %44 to %class.A*
  store %class.A* %45, %class.A** %38, align 4
  ret void
}

; Class: Main, Method: main
define i32 @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %1 = load %class.C*, %class.C** %0, align 8
  %2 = icmp eq %class.C* %1, null
  br i1 %2, label %if.then, label %if.else

if.then:
  call void @print_dispatch_on_void_error(i32 122)
  call void @exit(i32 1)
  br label %if.end

if.else:
  br label %if.end

if.end:
  %3 = call %class.Object* @_CN1C_FN18checkDefaultValues_(%class.C* %1)
  %4 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %5 = load %class.C*, %class.C** %4, align 8
  %6 = icmp eq %class.C* %5, null
  br i1 %6, label %if.then.1, label %if.else.1

if.then.1:
  call void @print_dispatch_on_void_error(i32 123)
  call void @exit(i32 1)
  br label %if.end.1

if.else.1:
  br label %if.end.1

if.end.1:
  %7 = call i32 @_CN1C_FN18testStaticDispatch_(%class.C* %5)
  %8 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %9 = load %class.C*, %class.C** %8, align 8
  %10 = icmp eq %class.C* %9, null
  br i1 %10, label %if.then.2, label %if.else.2

if.then.2:
  call void @print_dispatch_on_void_error(i32 124)
  call void @exit(i32 1)
  br label %if.end.2

if.else.2:
  br label %if.end.2

if.end.2:
  %11 = call i32 @_CN1C_FN11checkConsts_(%class.C* %9)
  %12 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %13 = load %class.C*, %class.C** %12, align 8
  %14 = icmp eq %class.C* %13, null
  br i1 %14, label %if.then.3, label %if.else.3

if.then.3:
  call void @print_dispatch_on_void_error(i32 125)
  call void @exit(i32 1)
  br label %if.end.3

if.else.3:
  br label %if.end.3

if.end.3:
  %15 = call %class.A* @_CN1C_FN26ifWithDifferentReturnTypes_(%class.C* %13, i8 1)
  %16 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  store %class.A* %15, %class.A** %16, align 8
  %17 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %18 = load %class.C*, %class.C** %17, align 8
  %19 = icmp eq %class.C* %18, null
  br i1 %19, label %if.then.4, label %if.else.4

if.then.4:
  call void @print_dispatch_on_void_error(i32 126)
  call void @exit(i32 1)
  br label %if.end.4

if.else.4:
  br label %if.end.4

if.end.4:
  %20 = call i32 @_CN1C_FN20staticDispatchOnNull_(%class.C* %18)
  ret i32 0
}

; Constructor of class 'Main'
define void @_CN4Main_FN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 85)
  %3 = bitcast i8* %2 to %class.C*
  call void @_CN1C_FN1C_(%class.C* %3)
  %4 = bitcast %class.C* %3 to %class.Object*
  %5 = getelementptr inbounds %class.Object, %class.Object* %4, i32 0, i32 0
  %6 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  store i8* %6, i8** %5, align 8
  store %class.C* %3, %class.C** %1, align 4
  %7 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  store %class.A* null, %class.A** %7, align 4
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
  %2 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.34, i32 0, i32 0
  %3 = getelementptr inbounds [26 x i8], [26 x i8]* @.str.40, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %2, i8* %3)
  %5 = call i32 (i8*, ...) @printf(i8* %2, i8* %1)
  %6 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.33, i32 0, i32 0
  %7 = call i32 (i8*, ...) @printf(i8* %2, i8* %6)
  call void @exit(i32 0)
  %8 = call noalias i8* @malloc(i64 0)
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.34, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)
  %1 = call noalias i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: out_int
define %class.IO* @_CN2IO_FN7out_int_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.36, i32 0, i32 0
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
  %1 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.36, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: in_string
define i8* @_CN2IO_FN9in_string_(%class.IO* %this) {
entry:
  %0 = alloca i8*, align 8
  %1 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.35, i32 0, i32 0
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.34, i32 0, i32 0
  %1 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.38, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.36, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.33, i32 0, i32 0
  %6 = call i32 (i8*, ...) @printf(i8* %0, i8* %5)
  ret void
}
define void @print_dispatch_on_void_error(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.34, i32 0, i32 0
  %1 = getelementptr inbounds [30 x i8], [30 x i8]* @.str.39, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.36, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.33, i32 0, i32 0
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
