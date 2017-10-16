; ModuleID = '../test_cases/full_test2.cl'
source_filename = "../test_cases/full_test2.cl"

@.str.32 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.26 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"Int : \00", align 1
@.str.27 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.8 = private unnamed_addr constant [19 x i8] c"Object is not void\00", align 1
@.str.30 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.0 = private unnamed_addr constant [38 x i8] c"Printing default values of each type
\00", align 1
@.str.6 = private unnamed_addr constant [42 x i8] c"
Other class without new, here class B : \00", align 1
@.str.28 = private unnamed_addr constant [2 x i8] c"E\00", align 1
@.str.29 = private unnamed_addr constant [2 x i8] c"F\00", align 1
@.str.9 = private unnamed_addr constant [39 x i8] c"
Other class with new, here class B : \00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"True\00", align 1
@.str.21 = private unnamed_addr constant [47 x i8] c"
Dynamic type F, static type F, called on F : \00", align 1
@.str.38 = private unnamed_addr constant [35 x i8] c"
Divide by 0 exception at line no \00", align 1
@.str.33 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"False\00", align 1
@.str.13 = private unnamed_addr constant [47 x i8] c"
Dynamic type B, static type B, called on A : \00", align 1
@.str.37 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.17 = private unnamed_addr constant [47 x i8] c"
Dynamic type A, static type A, called on A : \00", align 1
@.str.23 = private unnamed_addr constant [6 x i8] c"Hello\00", align 1
@.str.11 = private unnamed_addr constant [90 x i8] c"Calling static dispatch on f1(), member of A gives 0, member of B gives 1 np member in F
\00", align 1
@.str.22 = private unnamed_addr constant [73 x i8] c"Displaying consts 1 and 'Hello', and test with if for Bool const 'true'
\00", align 1
@.str.19 = private unnamed_addr constant [57 x i8] c"
Dynamic type F, static type A, called on F: Not allowed\00", align 1
@.str.18 = private unnamed_addr constant [47 x i8] c"
Dynamic type F, static type A, called on A : \00", align 1
@.str.7 = private unnamed_addr constant [15 x i8] c"Object is void\00", align 1
@.str.15 = private unnamed_addr constant [47 x i8] c"
Dynamic type B, static type A, called on A : \00", align 1
@.str.36 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.20 = private unnamed_addr constant [47 x i8] c"
Dynamic type F, static type F, called on A : \00", align 1
@.str.12 = private unnamed_addr constant [46 x i8] c"Dynamic type B, static type B, called on B : \00", align 1
@.str.16 = private unnamed_addr constant [58 x i8] c"
Dynamic type A, static type A, called on B : Not allowed\00", align 1
@.str.25 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str.14 = private unnamed_addr constant [58 x i8] c"
Dynamic type B, static type A, called on B : Not allowed\00", align 1
@.str.39 = private unnamed_addr constant [30 x i8] c"
Dispatch to void at line no \00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"
String : \00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"
Bool : \00", align 1
@.str.34 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"
Completed

\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.31 = private unnamed_addr constant [5 x i8] c"Main\00", align 1
@.str.35 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1

%class.Object = type {}
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

; Class: B, Method: f1
define i32 @_CN1B_FN2f1_(%class.B* %this) {

entry:
  ret i32 1
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
  %3 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end

if.else:
  br label %if.end

if.end:
  %4 = getelementptr inbounds [38 x i8], [38 x i8]* @.str.0, i32 0, i32 0
  %5 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %4)
  %6 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %7 = load %class.IO*, %class.IO** %6, align 8
  %8 = icmp eq %class.IO* %7, null
  br i1 %8, label %if.then.1, label %if.else.1

if.then.1:
  call void @print_dispatch_on_void_error(i32 39)
  %9 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.1

if.else.1:
  br label %if.end.1

if.end.1:
  %10 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.1, i32 0, i32 0
  %11 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %7, i8* %10)
  %12 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %13 = load %class.IO*, %class.IO** %12, align 8
  %14 = icmp eq %class.IO* %13, null
  br i1 %14, label %if.then.2, label %if.else.2

if.then.2:
  call void @print_dispatch_on_void_error(i32 40)
  %15 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.2

if.else.2:
  br label %if.end.2

if.end.2:
  %16 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 1
  %17 = load i32, i32* %16, align 4
  %18 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %13, i32 %17)
  %19 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %20 = load %class.IO*, %class.IO** %19, align 8
  %21 = icmp eq %class.IO* %20, null
  br i1 %21, label %if.then.3, label %if.else.3

if.then.3:
  call void @print_dispatch_on_void_error(i32 41)
  %22 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.3

if.else.3:
  br label %if.end.3

if.end.3:
  %23 = getelementptr inbounds [11 x i8], [11 x i8]* @.str.2, i32 0, i32 0
  %24 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %20, i8* %23)
  %25 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %26 = load %class.IO*, %class.IO** %25, align 8
  %27 = icmp eq %class.IO* %26, null
  br i1 %27, label %if.then.4, label %if.else.4

if.then.4:
  call void @print_dispatch_on_void_error(i32 42)
  %28 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.4

if.else.4:
  br label %if.end.4

if.end.4:
  %29 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 3
  %30 = load i8*, i8** %29, align 8
  %31 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %26, i8* %30)
  %32 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %33 = load %class.IO*, %class.IO** %32, align 8
  %34 = icmp eq %class.IO* %33, null
  br i1 %34, label %if.then.5, label %if.else.5

if.then.5:
  call void @print_dispatch_on_void_error(i32 43)
  %35 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.5

if.else.5:
  br label %if.end.5

if.end.5:
  %36 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.3, i32 0, i32 0
  %37 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %33, i8* %36)
  %38 = alloca %class.IO, align 8
  %39 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 2
  %40 = load i8, i8* %39, align 4
  %41 = trunc i8 %40 to i1
  br i1 %41, label %if.then.6, label %if.else.6

if.then.6:
  %42 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %43 = load %class.IO*, %class.IO** %42, align 8
  %44 = icmp eq %class.IO* %43, null
  br i1 %44, label %if.then.7, label %if.else.7

if.then.7:
  call void @print_dispatch_on_void_error(i32 44)
  %45 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.7

if.else.7:
  br label %if.end.7

if.end.7:
  %46 = getelementptr inbounds [5 x i8], [5 x i8]* @.str.4, i32 0, i32 0
  %47 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %43, i8* %46)
  %48 = load %class.IO, %class.IO* %47, align 4
  store %class.IO %48, %class.IO* %38, align 4
  br label %if.end.6

if.else.6:
  %49 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %50 = load %class.IO*, %class.IO** %49, align 8
  %51 = icmp eq %class.IO* %50, null
  br i1 %51, label %if.then.8, label %if.else.8

if.then.8:
  call void @print_dispatch_on_void_error(i32 44)
  %52 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.8

if.else.8:
  br label %if.end.8

if.end.8:
  %53 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.5, i32 0, i32 0
  %54 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %50, i8* %53)
  %55 = load %class.IO, %class.IO* %54, align 4
  store %class.IO %55, %class.IO* %38, align 4
  br label %if.end.6

if.end.6:
  %56 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %57 = load %class.IO*, %class.IO** %56, align 8
  %58 = icmp eq %class.IO* %57, null
  br i1 %58, label %if.then.9, label %if.else.9

if.then.9:
  call void @print_dispatch_on_void_error(i32 45)
  %59 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.9

if.else.9:
  br label %if.end.9

if.end.9:
  %60 = getelementptr inbounds [42 x i8], [42 x i8]* @.str.6, i32 0, i32 0
  %61 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %57, i8* %60)
  %62 = alloca %class.IO, align 8
  %63 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 4
  %64 = load %class.B*, %class.B** %63, align 8
  %65 = icmp eq %class.B* %64, null
  %66 = zext i1 %65 to i8
  %67 = trunc i8 %66 to i1
  br i1 %67, label %if.then.10, label %if.else.10

if.then.10:
  %68 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %69 = load %class.IO*, %class.IO** %68, align 8
  %70 = icmp eq %class.IO* %69, null
  br i1 %70, label %if.then.11, label %if.else.11

if.then.11:
  call void @print_dispatch_on_void_error(i32 47)
  %71 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.11

if.else.11:
  br label %if.end.11

if.end.11:
  %72 = getelementptr inbounds [15 x i8], [15 x i8]* @.str.7, i32 0, i32 0
  %73 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %69, i8* %72)
  %74 = load %class.IO, %class.IO* %73, align 4
  store %class.IO %74, %class.IO* %62, align 4
  br label %if.end.10

if.else.10:
  %75 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %76 = load %class.IO*, %class.IO** %75, align 8
  %77 = icmp eq %class.IO* %76, null
  br i1 %77, label %if.then.12, label %if.else.12

if.then.12:
  call void @print_dispatch_on_void_error(i32 49)
  %78 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.12

if.else.12:
  br label %if.end.12

if.end.12:
  %79 = getelementptr inbounds [19 x i8], [19 x i8]* @.str.8, i32 0, i32 0
  %80 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %76, i8* %79)
  %81 = load %class.IO, %class.IO* %80, align 4
  store %class.IO %81, %class.IO* %62, align 4
  br label %if.end.10

if.end.10:
  %82 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %83 = load %class.IO*, %class.IO** %82, align 8
  %84 = icmp eq %class.IO* %83, null
  br i1 %84, label %if.then.13, label %if.else.13

if.then.13:
  call void @print_dispatch_on_void_error(i32 51)
  %85 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.13

if.else.13:
  br label %if.end.13

if.end.13:
  %86 = getelementptr inbounds [39 x i8], [39 x i8]* @.str.9, i32 0, i32 0
  %87 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %83, i8* %86)
  %88 = alloca %class.IO, align 8
  %89 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 5
  %90 = load %class.B*, %class.B** %89, align 8
  %91 = icmp eq %class.B* %90, null
  %92 = zext i1 %91 to i8
  %93 = trunc i8 %92 to i1
  br i1 %93, label %if.then.14, label %if.else.14

if.then.14:
  %94 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %95 = load %class.IO*, %class.IO** %94, align 8
  %96 = icmp eq %class.IO* %95, null
  br i1 %96, label %if.then.15, label %if.else.15

if.then.15:
  call void @print_dispatch_on_void_error(i32 53)
  %97 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.15

if.else.15:
  br label %if.end.15

if.end.15:
  %98 = getelementptr inbounds [15 x i8], [15 x i8]* @.str.7, i32 0, i32 0
  %99 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %95, i8* %98)
  %100 = load %class.IO, %class.IO* %99, align 4
  store %class.IO %100, %class.IO* %88, align 4
  br label %if.end.14

if.else.14:
  %101 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %102 = load %class.IO*, %class.IO** %101, align 8
  %103 = icmp eq %class.IO* %102, null
  br i1 %103, label %if.then.16, label %if.else.16

if.then.16:
  call void @print_dispatch_on_void_error(i32 55)
  %104 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.16

if.else.16:
  br label %if.end.16

if.end.16:
  %105 = getelementptr inbounds [19 x i8], [19 x i8]* @.str.8, i32 0, i32 0
  %106 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %102, i8* %105)
  %107 = load %class.IO, %class.IO* %106, align 4
  store %class.IO %107, %class.IO* %88, align 4
  br label %if.end.14

if.end.14:
  %108 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %109 = load %class.IO*, %class.IO** %108, align 8
  %110 = icmp eq %class.IO* %109, null
  br i1 %110, label %if.then.17, label %if.else.17

if.then.17:
  call void @print_dispatch_on_void_error(i32 57)
  %111 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.17

if.else.17:
  br label %if.end.17

if.end.17:
  %112 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.10, i32 0, i32 0
  %113 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %109, i8* %112)
  %114 = bitcast %class.IO* %113 to %class.Object*
  ret %class.Object* %114
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
  %3 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.18

if.else.18:
  br label %if.end.18

if.end.18:
  %4 = getelementptr inbounds [90 x i8], [90 x i8]* @.str.11, i32 0, i32 0
  %5 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %4)
  %6 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %7 = load %class.IO*, %class.IO** %6, align 8
  %8 = icmp eq %class.IO* %7, null
  br i1 %8, label %if.then.19, label %if.else.19

if.then.19:
  call void @print_dispatch_on_void_error(i32 64)
  %9 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.19

if.else.19:
  br label %if.end.19

if.end.19:
  %10 = getelementptr inbounds [46 x i8], [46 x i8]* @.str.12, i32 0, i32 0
  %11 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %7, i8* %10)
  %12 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %13 = load %class.IO*, %class.IO** %12, align 8
  %14 = icmp eq %class.IO* %13, null
  br i1 %14, label %if.then.20, label %if.else.20

if.then.20:
  call void @print_dispatch_on_void_error(i32 65)
  %15 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.20

if.else.20:
  br label %if.end.20

if.end.20:
  %16 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 5
  %17 = load %class.B*, %class.B** %16, align 8
  %18 = icmp eq %class.B* %17, null
  br i1 %18, label %if.then.21, label %if.else.21

if.then.21:
  call void @print_dispatch_on_void_error(i32 65)
  %19 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.21

if.else.21:
  br label %if.end.21

if.end.21:
  %20 = call i32 @_CN1B_FN2f1_(%class.B* %17)
  %21 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %13, i32 %20)
  %22 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %23 = load %class.IO*, %class.IO** %22, align 8
  %24 = icmp eq %class.IO* %23, null
  br i1 %24, label %if.then.22, label %if.else.22

if.then.22:
  call void @print_dispatch_on_void_error(i32 66)
  %25 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.22

if.else.22:
  br label %if.end.22

if.end.22:
  %26 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.13, i32 0, i32 0
  %27 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %23, i8* %26)
  %28 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %29 = load %class.IO*, %class.IO** %28, align 8
  %30 = icmp eq %class.IO* %29, null
  br i1 %30, label %if.then.23, label %if.else.23

if.then.23:
  call void @print_dispatch_on_void_error(i32 67)
  %31 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.23

if.else.23:
  br label %if.end.23

if.end.23:
  %32 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 5
  %33 = load %class.B*, %class.B** %32, align 8
  %34 = icmp eq %class.B* %33, null
  br i1 %34, label %if.then.24, label %if.else.24

if.then.24:
  call void @print_dispatch_on_void_error(i32 67)
  %35 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.24

if.else.24:
  br label %if.end.24

if.end.24:
  %36 = bitcast %class.B* %33 to %class.A*
  %37 = call i32 @_CN1A_FN2f1_(%class.A* %36)
  %38 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %29, i32 %37)
  %39 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %40 = load %class.IO*, %class.IO** %39, align 8
  %41 = icmp eq %class.IO* %40, null
  br i1 %41, label %if.then.25, label %if.else.25

if.then.25:
  call void @print_dispatch_on_void_error(i32 68)
  %42 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.25

if.else.25:
  br label %if.end.25

if.end.25:
  %43 = getelementptr inbounds [58 x i8], [58 x i8]* @.str.14, i32 0, i32 0
  %44 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %40, i8* %43)
  %45 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %46 = load %class.IO*, %class.IO** %45, align 8
  %47 = icmp eq %class.IO* %46, null
  br i1 %47, label %if.then.26, label %if.else.26

if.then.26:
  call void @print_dispatch_on_void_error(i32 69)
  %48 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.26

if.else.26:
  br label %if.end.26

if.end.26:
  %49 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.15, i32 0, i32 0
  %50 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %46, i8* %49)
  %51 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %52 = load %class.IO*, %class.IO** %51, align 8
  %53 = icmp eq %class.IO* %52, null
  br i1 %53, label %if.then.27, label %if.else.27

if.then.27:
  call void @print_dispatch_on_void_error(i32 70)
  %54 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.27

if.else.27:
  br label %if.end.27

if.end.27:
  %55 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 7
  %56 = load %class.A*, %class.A** %55, align 8
  %57 = icmp eq %class.A* %56, null
  br i1 %57, label %if.then.28, label %if.else.28

if.then.28:
  call void @print_dispatch_on_void_error(i32 70)
  %58 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.28

if.else.28:
  br label %if.end.28

if.end.28:
  %59 = call i32 @_CN1A_FN2f1_(%class.A* %56)
  %60 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %52, i32 %59)
  %61 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %62 = load %class.IO*, %class.IO** %61, align 8
  %63 = icmp eq %class.IO* %62, null
  br i1 %63, label %if.then.29, label %if.else.29

if.then.29:
  call void @print_dispatch_on_void_error(i32 71)
  %64 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.29

if.else.29:
  br label %if.end.29

if.end.29:
  %65 = getelementptr inbounds [58 x i8], [58 x i8]* @.str.16, i32 0, i32 0
  %66 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %62, i8* %65)
  %67 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %68 = load %class.IO*, %class.IO** %67, align 8
  %69 = icmp eq %class.IO* %68, null
  br i1 %69, label %if.then.30, label %if.else.30

if.then.30:
  call void @print_dispatch_on_void_error(i32 72)
  %70 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.30

if.else.30:
  br label %if.end.30

if.end.30:
  %71 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.17, i32 0, i32 0
  %72 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %68, i8* %71)
  %73 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %74 = load %class.IO*, %class.IO** %73, align 8
  %75 = icmp eq %class.IO* %74, null
  br i1 %75, label %if.then.31, label %if.else.31

if.then.31:
  call void @print_dispatch_on_void_error(i32 73)
  %76 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.31

if.else.31:
  br label %if.end.31

if.end.31:
  %77 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 8
  %78 = load %class.A*, %class.A** %77, align 8
  %79 = icmp eq %class.A* %78, null
  br i1 %79, label %if.then.32, label %if.else.32

if.then.32:
  call void @print_dispatch_on_void_error(i32 73)
  %80 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.32

if.else.32:
  br label %if.end.32

if.end.32:
  %81 = call i32 @_CN1A_FN2f1_(%class.A* %78)
  %82 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %74, i32 %81)
  %83 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %84 = load %class.IO*, %class.IO** %83, align 8
  %85 = icmp eq %class.IO* %84, null
  br i1 %85, label %if.then.33, label %if.else.33

if.then.33:
  call void @print_dispatch_on_void_error(i32 74)
  %86 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.33

if.else.33:
  br label %if.end.33

if.end.33:
  %87 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.18, i32 0, i32 0
  %88 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %84, i8* %87)
  %89 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %90 = load %class.IO*, %class.IO** %89, align 8
  %91 = icmp eq %class.IO* %90, null
  br i1 %91, label %if.then.34, label %if.else.34

if.then.34:
  call void @print_dispatch_on_void_error(i32 75)
  %92 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.34

if.else.34:
  br label %if.end.34

if.end.34:
  %93 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 11
  %94 = load %class.A*, %class.A** %93, align 8
  %95 = icmp eq %class.A* %94, null
  br i1 %95, label %if.then.35, label %if.else.35

if.then.35:
  call void @print_dispatch_on_void_error(i32 75)
  %96 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.35

if.else.35:
  br label %if.end.35

if.end.35:
  %97 = call i32 @_CN1A_FN2f1_(%class.A* %94)
  %98 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %90, i32 %97)
  %99 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %100 = load %class.IO*, %class.IO** %99, align 8
  %101 = icmp eq %class.IO* %100, null
  br i1 %101, label %if.then.36, label %if.else.36

if.then.36:
  call void @print_dispatch_on_void_error(i32 76)
  %102 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.36

if.else.36:
  br label %if.end.36

if.end.36:
  %103 = getelementptr inbounds [57 x i8], [57 x i8]* @.str.19, i32 0, i32 0
  %104 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %100, i8* %103)
  %105 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %106 = load %class.IO*, %class.IO** %105, align 8
  %107 = icmp eq %class.IO* %106, null
  br i1 %107, label %if.then.37, label %if.else.37

if.then.37:
  call void @print_dispatch_on_void_error(i32 77)
  %108 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.37

if.else.37:
  br label %if.end.37

if.end.37:
  %109 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.20, i32 0, i32 0
  %110 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %106, i8* %109)
  %111 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %112 = load %class.IO*, %class.IO** %111, align 8
  %113 = icmp eq %class.IO* %112, null
  br i1 %113, label %if.then.38, label %if.else.38

if.then.38:
  call void @print_dispatch_on_void_error(i32 78)
  %114 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.38

if.else.38:
  br label %if.end.38

if.end.38:
  %115 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 10
  %116 = load %class.F*, %class.F** %115, align 8
  %117 = icmp eq %class.F* %116, null
  br i1 %117, label %if.then.39, label %if.else.39

if.then.39:
  call void @print_dispatch_on_void_error(i32 78)
  %118 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.39

if.else.39:
  br label %if.end.39

if.end.39:
  %119 = bitcast %class.F* %116 to %class.A*
  %120 = call i32 @_CN1A_FN2f1_(%class.A* %119)
  %121 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %112, i32 %120)
  %122 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %123 = load %class.IO*, %class.IO** %122, align 8
  %124 = icmp eq %class.IO* %123, null
  br i1 %124, label %if.then.40, label %if.else.40

if.then.40:
  call void @print_dispatch_on_void_error(i32 79)
  %125 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.40

if.else.40:
  br label %if.end.40

if.end.40:
  %126 = getelementptr inbounds [47 x i8], [47 x i8]* @.str.21, i32 0, i32 0
  %127 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %123, i8* %126)
  %128 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %129 = load %class.IO*, %class.IO** %128, align 8
  %130 = icmp eq %class.IO* %129, null
  br i1 %130, label %if.then.41, label %if.else.41

if.then.41:
  call void @print_dispatch_on_void_error(i32 80)
  %131 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.41

if.else.41:
  br label %if.end.41

if.end.41:
  %132 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 10
  %133 = load %class.F*, %class.F** %132, align 8
  %134 = icmp eq %class.F* %133, null
  br i1 %134, label %if.then.42, label %if.else.42

if.then.42:
  call void @print_dispatch_on_void_error(i32 80)
  %135 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.42

if.else.42:
  br label %if.end.42

if.end.42:
  %136 = bitcast %class.F* %133 to %class.B*
  %137 = call i32 @_CN1B_FN2f1_(%class.B* %136)
  %138 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %129, i32 %137)
  %139 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %140 = load %class.IO*, %class.IO** %139, align 8
  %141 = icmp eq %class.IO* %140, null
  br i1 %141, label %if.then.43, label %if.else.43

if.then.43:
  call void @print_dispatch_on_void_error(i32 81)
  %142 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.43

if.else.43:
  br label %if.end.43

if.end.43:
  %143 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.10, i32 0, i32 0
  %144 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %140, i8* %143)
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
  %3 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.44

if.else.44:
  br label %if.end.44

if.end.44:
  %4 = call i32 @_CN1B_FN2f1_(%class.B* %1)
  ret i32 %4
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
  %3 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.45

if.else.45:
  br label %if.end.45

if.end.45:
  %4 = getelementptr inbounds [73 x i8], [73 x i8]* @.str.22, i32 0, i32 0
  %5 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %4)
  %6 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %7 = load %class.IO*, %class.IO** %6, align 8
  %8 = icmp eq %class.IO* %7, null
  br i1 %8, label %if.then.46, label %if.else.46

if.then.46:
  call void @print_dispatch_on_void_error(i32 93)
  %9 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.46

if.else.46:
  br label %if.end.46

if.end.46:
  %10 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.1, i32 0, i32 0
  %11 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %7, i8* %10)
  %12 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %13 = load %class.IO*, %class.IO** %12, align 8
  %14 = icmp eq %class.IO* %13, null
  br i1 %14, label %if.then.47, label %if.else.47

if.then.47:
  call void @print_dispatch_on_void_error(i32 94)
  %15 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.47

if.else.47:
  br label %if.end.47

if.end.47:
  %16 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %13, i32 1)
  %17 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %18 = load %class.IO*, %class.IO** %17, align 8
  %19 = icmp eq %class.IO* %18, null
  br i1 %19, label %if.then.48, label %if.else.48

if.then.48:
  call void @print_dispatch_on_void_error(i32 95)
  %20 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.48

if.else.48:
  br label %if.end.48

if.end.48:
  %21 = getelementptr inbounds [11 x i8], [11 x i8]* @.str.2, i32 0, i32 0
  %22 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %18, i8* %21)
  %23 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %24 = load %class.IO*, %class.IO** %23, align 8
  %25 = icmp eq %class.IO* %24, null
  br i1 %25, label %if.then.49, label %if.else.49

if.then.49:
  call void @print_dispatch_on_void_error(i32 96)
  %26 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.49

if.else.49:
  br label %if.end.49

if.end.49:
  %27 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.23, i32 0, i32 0
  %28 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %24, i8* %27)
  %29 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %30 = load %class.IO*, %class.IO** %29, align 8
  %31 = icmp eq %class.IO* %30, null
  br i1 %31, label %if.then.50, label %if.else.50

if.then.50:
  call void @print_dispatch_on_void_error(i32 97)
  %32 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.50

if.else.50:
  br label %if.end.50

if.end.50:
  %33 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.3, i32 0, i32 0
  %34 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %30, i8* %33)
  %35 = alloca %class.IO, align 8
  %36 = trunc i8 1 to i1
  br i1 %36, label %if.then.51, label %if.else.51

if.then.51:
  %37 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %38 = load %class.IO*, %class.IO** %37, align 8
  %39 = icmp eq %class.IO* %38, null
  br i1 %39, label %if.then.52, label %if.else.52

if.then.52:
  call void @print_dispatch_on_void_error(i32 99)
  %40 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.52

if.else.52:
  br label %if.end.52

if.end.52:
  %41 = getelementptr inbounds [5 x i8], [5 x i8]* @.str.24, i32 0, i32 0
  %42 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %38, i8* %41)
  %43 = load %class.IO, %class.IO* %42, align 4
  store %class.IO %43, %class.IO* %35, align 4
  br label %if.end.51

if.else.51:
  %44 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %45 = load %class.IO*, %class.IO** %44, align 8
  %46 = icmp eq %class.IO* %45, null
  br i1 %46, label %if.then.53, label %if.else.53

if.then.53:
  call void @print_dispatch_on_void_error(i32 101)
  %47 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.53

if.else.53:
  br label %if.end.53

if.end.53:
  %48 = getelementptr inbounds [6 x i8], [6 x i8]* @.str.25, i32 0, i32 0
  %49 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %45, i8* %48)
  %50 = load %class.IO, %class.IO* %49, align 4
  store %class.IO %50, %class.IO* %35, align 4
  br label %if.end.51

if.end.51:
  %51 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %52 = load %class.IO*, %class.IO** %51, align 8
  %53 = icmp eq %class.IO* %52, null
  br i1 %53, label %if.then.54, label %if.else.54

if.then.54:
  call void @print_dispatch_on_void_error(i32 103)
  %54 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.54

if.else.54:
  br label %if.end.54

if.end.54:
  %55 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.10, i32 0, i32 0
  %56 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %52, i8* %55)
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
  %3 = call noalias i8* @malloc(i64 8)
  %4 = bitcast i8* %3 to %class.B*
  call void @_CN1B_FN1B_(%class.B* %4)
  %5 = bitcast %class.B* %4 to %class.A*
  %6 = load %class.A, %class.A* %5, align 4
  store %class.A %6, %class.A* %0, align 4
  br label %if.end.55

if.else.55:
  %7 = call noalias i8* @malloc(i64 8)
  %8 = bitcast i8* %7 to %class.E*
  call void @_CN1E_FN1E_(%class.E* %8)
  %9 = bitcast %class.E* %8 to %class.A*
  %10 = load %class.A, %class.A* %9, align 4
  store %class.A %10, %class.A* %0, align 4
  br label %if.end.55

if.end.55:
  %11 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 9
  store %class.A* %0, %class.A** %11, align 8
  ret %class.A* %0
}

; Class: Main, Method: main
define i32 @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %1 = load %class.C*, %class.C** %0, align 8
  %2 = icmp eq %class.C* %1, null
  br i1 %2, label %if.then.56, label %if.else.56

if.then.56:
  call void @print_dispatch_on_void_error(i32 120)
  %3 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.56

if.else.56:
  br label %if.end.56

if.end.56:
  %4 = call %class.Object* @_CN1C_FN18checkDefaultValues_(%class.C* %1)
  %5 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %6 = load %class.C*, %class.C** %5, align 8
  %7 = icmp eq %class.C* %6, null
  br i1 %7, label %if.then.57, label %if.else.57

if.then.57:
  call void @print_dispatch_on_void_error(i32 121)
  %8 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.57

if.else.57:
  br label %if.end.57

if.end.57:
  %9 = call i32 @_CN1C_FN18testStaticDispatch_(%class.C* %6)
  %10 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %11 = load %class.C*, %class.C** %10, align 8
  %12 = icmp eq %class.C* %11, null
  br i1 %12, label %if.then.58, label %if.else.58

if.then.58:
  call void @print_dispatch_on_void_error(i32 122)
  %13 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.58

if.else.58:
  br label %if.end.58

if.end.58:
  %14 = call i32 @_CN1C_FN11checkConsts_(%class.C* %11)
  %15 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %16 = load %class.C*, %class.C** %15, align 8
  %17 = icmp eq %class.C* %16, null
  br i1 %17, label %if.then.59, label %if.else.59

if.then.59:
  call void @print_dispatch_on_void_error(i32 123)
  %18 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.59

if.else.59:
  br label %if.end.59

if.end.59:
  %19 = call %class.A* @_CN1C_FN26ifWithDifferentReturnTypes_(%class.C* %16, i8 1)
  %20 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  store %class.A* %19, %class.A** %20, align 8
  %21 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %22 = load %class.C*, %class.C** %21, align 8
  %23 = icmp eq %class.C* %22, null
  br i1 %23, label %if.then.60, label %if.else.60

if.then.60:
  call void @print_dispatch_on_void_error(i32 124)
  %24 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.60

if.else.60:
  br label %if.end.60

if.end.60:
  %25 = call i32 @_CN1C_FN20staticDispatchOnNull_(%class.C* %22)
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
  store i32 0, i32* %1, align 4
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
  %7 = call noalias i8* @malloc(i64 8)
  %8 = bitcast i8* %7 to %class.B*
  call void @_CN1B_FN1B_(%class.B* %8)
  store %class.B* %8, %class.B** %6, align 4
  %9 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 6
  %10 = call noalias i8* @malloc(i64 0)
  %11 = bitcast i8* %10 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %11)
  store %class.IO* %11, %class.IO** %9, align 4
  %12 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 7
  %13 = call noalias i8* @malloc(i64 8)
  %14 = bitcast i8* %13 to %class.B*
  call void @_CN1B_FN1B_(%class.B* %14)
  %15 = bitcast %class.B* %14 to %class.A*
  store %class.A* %15, %class.A** %12, align 4
  %16 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 8
  %17 = call noalias i8* @malloc(i64 4)
  %18 = bitcast i8* %17 to %class.A*
  call void @_CN1A_FN1A_(%class.A* %18)
  store %class.A* %18, %class.A** %16, align 4
  %19 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 9
  store %class.A* null, %class.A** %19, align 4
  %20 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 10
  %21 = call noalias i8* @malloc(i64 12)
  %22 = bitcast i8* %21 to %class.F*
  call void @_CN1F_FN1F_(%class.F* %22)
  store %class.F* %22, %class.F** %20, align 4
  %23 = getelementptr inbounds %class.C, %class.C* %this, i32 0, i32 11
  %24 = call noalias i8* @malloc(i64 12)
  %25 = bitcast i8* %24 to %class.F*
  call void @_CN1F_FN1F_(%class.F* %25)
  %26 = bitcast %class.F* %25 to %class.A*
  store %class.A* %26, %class.A** %23, align 4
  ret void
}

; Constructor of class 'Main'
define void @_CN4Main_FN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 77)
  %3 = bitcast i8* %2 to %class.C*
  call void @_CN1C_FN1C_(%class.C* %3)
  store %class.C* %3, %class.C** %1, align 4
  %4 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  store %class.A* null, %class.A** %4, align 4
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.34, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)
  %1 = call noalias i8* @malloc(i64 0)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: out_int
define %class.IO* @_CN2IO_FN7out_int_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.36, i32 0, i32 0
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
  %1 = getelementptr inbounds [4 x i8], [4 x i8]* @.str.37, i32 0, i32 0
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
