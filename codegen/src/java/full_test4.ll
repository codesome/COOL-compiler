; ModuleID = '../test_cases/full_test4.cl'
source_filename = "../test_cases/full_test4.cl"

; String constant declarations
@.str.8 = private unnamed_addr constant [16 x i8] c"
Object<-Int : \00", align 1
@.str.16 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.0 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"
C<-C : \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"E\00", align 1
@.str.22 = private unnamed_addr constant [35 x i8] c"
Divide by 0 exception at line no \00", align 1
@.str.17 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.21 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.27 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.28 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"
B<-B : \00", align 1
@.str.29 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@.str.12 = private unnamed_addr constant [11 x i8] c"
IO<-IO : \00", align 1
@.str.20 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.26 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.9 = private unnamed_addr constant [15 x i8] c"
Object<-IO : \00", align 1
@.str.24 = private unnamed_addr constant [26 x i8] c"
Abort called from class \00", align 1
@.str.23 = private unnamed_addr constant [30 x i8] c"
Dispatch to void at line no \00", align 1
@.str.14 = private unnamed_addr constant [9 x i8] c"
B<-C : \00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.13 = private unnamed_addr constant [10 x i8] c"
IO<-A : \00", align 1
@.str.11 = private unnamed_addr constant [17 x i8] c"
Object<-Bool : \00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"
A<-A : \00", align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"
Object<-A : \00", align 1
@.str.25 = private unnamed_addr constant [7 x i8] c"Object\00", align 1
@.str.10 = private unnamed_addr constant [19 x i8] c"
Object<-String : \00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"Main\00", align 1
@.str.19 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1

; Struct declarations
%class.Object = type {i8*}
%class.B = type { %class.Object, i32 }
%class.C = type { %class.B, i32 }
%class.E = type { %class.Object, %class.A*, %class.B*, %class.C*, %class.Object*, %class.Object*, %class.Object*, %class.Object*, %class.Object*, %class.IO*, %class.IO*, %class.B* }
%class.Main = type { %class.Object, %class.E* }
%class.IO = type { %class.Object }
%class.A = type { %class.IO, i32 }


; Class: E, Method: checkTypes
define i32 @_CN1E_FN10checkTypes_(%class.E* %this) {

entry:
  %0 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 9
  %1 = load %class.IO*, %class.IO** %0, align 8
  %2 = icmp eq %class.IO* %1, null
  br i1 %2, label %if.then, label %if.else

if.then:
  call void @print_dispatch_on_void_error(i32 28)
  call void @exit(i32 1)
  br label %if.end

if.else:
  br label %if.end

if.end:
  %3 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.4, i32 0, i32 0
  %4 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 1
  %5 = load %class.A*, %class.A** %4, align 8
  %6 = icmp eq %class.A* %5, null
  br i1 %6, label %if.then.1, label %if.else.1

if.then.1:
  call void @print_dispatch_on_void_error(i32 28)
  call void @exit(i32 1)
  br label %if.end.1

if.else.1:
  br label %if.end.1

if.end.1:
  %7 = bitcast %class.A* %5 to %class.Object*
  %8 = call i8* @_CN6Object_FN9type_name_(%class.Object* %7)
  %9 = call i8* @_CN6String_FN6concat_(i8* %3, i8* %8)
  %10 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %9)
  %11 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 9
  %12 = load %class.IO*, %class.IO** %11, align 8
  %13 = icmp eq %class.IO* %12, null
  br i1 %13, label %if.then.2, label %if.else.2

if.then.2:
  call void @print_dispatch_on_void_error(i32 29)
  call void @exit(i32 1)
  br label %if.end.2

if.else.2:
  br label %if.end.2

if.end.2:
  %14 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.5, i32 0, i32 0
  %15 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 2
  %16 = load %class.B*, %class.B** %15, align 8
  %17 = icmp eq %class.B* %16, null
  br i1 %17, label %if.then.3, label %if.else.3

if.then.3:
  call void @print_dispatch_on_void_error(i32 29)
  call void @exit(i32 1)
  br label %if.end.3

if.else.3:
  br label %if.end.3

if.end.3:
  %18 = bitcast %class.B* %16 to %class.Object*
  %19 = call i8* @_CN6Object_FN9type_name_(%class.Object* %18)
  %20 = call i8* @_CN6String_FN6concat_(i8* %14, i8* %19)
  %21 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %12, i8* %20)
  %22 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 9
  %23 = load %class.IO*, %class.IO** %22, align 8
  %24 = icmp eq %class.IO* %23, null
  br i1 %24, label %if.then.4, label %if.else.4

if.then.4:
  call void @print_dispatch_on_void_error(i32 30)
  call void @exit(i32 1)
  br label %if.end.4

if.else.4:
  br label %if.end.4

if.end.4:
  %25 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.6, i32 0, i32 0
  %26 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 3
  %27 = load %class.C*, %class.C** %26, align 8
  %28 = icmp eq %class.C* %27, null
  br i1 %28, label %if.then.5, label %if.else.5

if.then.5:
  call void @print_dispatch_on_void_error(i32 30)
  call void @exit(i32 1)
  br label %if.end.5

if.else.5:
  br label %if.end.5

if.end.5:
  %29 = bitcast %class.C* %27 to %class.Object*
  %30 = call i8* @_CN6Object_FN9type_name_(%class.Object* %29)
  %31 = call i8* @_CN6String_FN6concat_(i8* %25, i8* %30)
  %32 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %23, i8* %31)
  %33 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 9
  %34 = load %class.IO*, %class.IO** %33, align 8
  %35 = icmp eq %class.IO* %34, null
  br i1 %35, label %if.then.6, label %if.else.6

if.then.6:
  call void @print_dispatch_on_void_error(i32 31)
  call void @exit(i32 1)
  br label %if.end.6

if.else.6:
  br label %if.end.6

if.end.6:
  %36 = getelementptr inbounds [14 x i8], [14 x i8]* @.str.7, i32 0, i32 0
  %37 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 4
  %38 = load %class.Object*, %class.Object** %37, align 8
  %39 = icmp eq %class.Object* %38, null
  br i1 %39, label %if.then.7, label %if.else.7

if.then.7:
  call void @print_dispatch_on_void_error(i32 31)
  call void @exit(i32 1)
  br label %if.end.7

if.else.7:
  br label %if.end.7

if.end.7:
  %40 = call i8* @_CN6Object_FN9type_name_(%class.Object* %38)
  %41 = call i8* @_CN6String_FN6concat_(i8* %36, i8* %40)
  %42 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %34, i8* %41)
  %43 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 9
  %44 = load %class.IO*, %class.IO** %43, align 8
  %45 = icmp eq %class.IO* %44, null
  br i1 %45, label %if.then.8, label %if.else.8

if.then.8:
  call void @print_dispatch_on_void_error(i32 32)
  call void @exit(i32 1)
  br label %if.end.8

if.else.8:
  br label %if.end.8

if.end.8:
  %46 = getelementptr inbounds [16 x i8], [16 x i8]* @.str.8, i32 0, i32 0
  %47 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 5
  %48 = load %class.Object*, %class.Object** %47, align 8
  %49 = icmp eq %class.Object* %48, null
  br i1 %49, label %if.then.9, label %if.else.9

if.then.9:
  call void @print_dispatch_on_void_error(i32 32)
  call void @exit(i32 1)
  br label %if.end.9

if.else.9:
  br label %if.end.9

if.end.9:
  %50 = call i8* @_CN6Object_FN9type_name_(%class.Object* %48)
  %51 = call i8* @_CN6String_FN6concat_(i8* %46, i8* %50)
  %52 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %44, i8* %51)
  %53 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 9
  %54 = load %class.IO*, %class.IO** %53, align 8
  %55 = icmp eq %class.IO* %54, null
  br i1 %55, label %if.then.10, label %if.else.10

if.then.10:
  call void @print_dispatch_on_void_error(i32 33)
  call void @exit(i32 1)
  br label %if.end.10

if.else.10:
  br label %if.end.10

if.end.10:
  %56 = getelementptr inbounds [15 x i8], [15 x i8]* @.str.9, i32 0, i32 0
  %57 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 6
  %58 = load %class.Object*, %class.Object** %57, align 8
  %59 = icmp eq %class.Object* %58, null
  br i1 %59, label %if.then.11, label %if.else.11

if.then.11:
  call void @print_dispatch_on_void_error(i32 33)
  call void @exit(i32 1)
  br label %if.end.11

if.else.11:
  br label %if.end.11

if.end.11:
  %60 = call i8* @_CN6Object_FN9type_name_(%class.Object* %58)
  %61 = call i8* @_CN6String_FN6concat_(i8* %56, i8* %60)
  %62 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %54, i8* %61)
  %63 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 9
  %64 = load %class.IO*, %class.IO** %63, align 8
  %65 = icmp eq %class.IO* %64, null
  br i1 %65, label %if.then.12, label %if.else.12

if.then.12:
  call void @print_dispatch_on_void_error(i32 34)
  call void @exit(i32 1)
  br label %if.end.12

if.else.12:
  br label %if.end.12

if.end.12:
  %66 = getelementptr inbounds [19 x i8], [19 x i8]* @.str.10, i32 0, i32 0
  %67 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 7
  %68 = load %class.Object*, %class.Object** %67, align 8
  %69 = icmp eq %class.Object* %68, null
  br i1 %69, label %if.then.13, label %if.else.13

if.then.13:
  call void @print_dispatch_on_void_error(i32 34)
  call void @exit(i32 1)
  br label %if.end.13

if.else.13:
  br label %if.end.13

if.end.13:
  %70 = call i8* @_CN6Object_FN9type_name_(%class.Object* %68)
  %71 = call i8* @_CN6String_FN6concat_(i8* %66, i8* %70)
  %72 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %64, i8* %71)
  %73 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 9
  %74 = load %class.IO*, %class.IO** %73, align 8
  %75 = icmp eq %class.IO* %74, null
  br i1 %75, label %if.then.14, label %if.else.14

if.then.14:
  call void @print_dispatch_on_void_error(i32 35)
  call void @exit(i32 1)
  br label %if.end.14

if.else.14:
  br label %if.end.14

if.end.14:
  %76 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.11, i32 0, i32 0
  %77 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 8
  %78 = load %class.Object*, %class.Object** %77, align 8
  %79 = icmp eq %class.Object* %78, null
  br i1 %79, label %if.then.15, label %if.else.15

if.then.15:
  call void @print_dispatch_on_void_error(i32 35)
  call void @exit(i32 1)
  br label %if.end.15

if.else.15:
  br label %if.end.15

if.end.15:
  %80 = call i8* @_CN6Object_FN9type_name_(%class.Object* %78)
  %81 = call i8* @_CN6String_FN6concat_(i8* %76, i8* %80)
  %82 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %74, i8* %81)
  %83 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 9
  %84 = load %class.IO*, %class.IO** %83, align 8
  %85 = icmp eq %class.IO* %84, null
  br i1 %85, label %if.then.16, label %if.else.16

if.then.16:
  call void @print_dispatch_on_void_error(i32 36)
  call void @exit(i32 1)
  br label %if.end.16

if.else.16:
  br label %if.end.16

if.end.16:
  %86 = getelementptr inbounds [11 x i8], [11 x i8]* @.str.12, i32 0, i32 0
  %87 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 9
  %88 = load %class.IO*, %class.IO** %87, align 8
  %89 = icmp eq %class.IO* %88, null
  br i1 %89, label %if.then.17, label %if.else.17

if.then.17:
  call void @print_dispatch_on_void_error(i32 36)
  call void @exit(i32 1)
  br label %if.end.17

if.else.17:
  br label %if.end.17

if.end.17:
  %90 = bitcast %class.IO* %88 to %class.Object*
  %91 = call i8* @_CN6Object_FN9type_name_(%class.Object* %90)
  %92 = call i8* @_CN6String_FN6concat_(i8* %86, i8* %91)
  %93 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %84, i8* %92)
  %94 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 9
  %95 = load %class.IO*, %class.IO** %94, align 8
  %96 = icmp eq %class.IO* %95, null
  br i1 %96, label %if.then.18, label %if.else.18

if.then.18:
  call void @print_dispatch_on_void_error(i32 37)
  call void @exit(i32 1)
  br label %if.end.18

if.else.18:
  br label %if.end.18

if.end.18:
  %97 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.13, i32 0, i32 0
  %98 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 10
  %99 = load %class.IO*, %class.IO** %98, align 8
  %100 = icmp eq %class.IO* %99, null
  br i1 %100, label %if.then.19, label %if.else.19

if.then.19:
  call void @print_dispatch_on_void_error(i32 37)
  call void @exit(i32 1)
  br label %if.end.19

if.else.19:
  br label %if.end.19

if.end.19:
  %101 = bitcast %class.IO* %99 to %class.Object*
  %102 = call i8* @_CN6Object_FN9type_name_(%class.Object* %101)
  %103 = call i8* @_CN6String_FN6concat_(i8* %97, i8* %102)
  %104 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %95, i8* %103)
  %105 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 9
  %106 = load %class.IO*, %class.IO** %105, align 8
  %107 = icmp eq %class.IO* %106, null
  br i1 %107, label %if.then.20, label %if.else.20

if.then.20:
  call void @print_dispatch_on_void_error(i32 38)
  call void @exit(i32 1)
  br label %if.end.20

if.else.20:
  br label %if.end.20

if.end.20:
  %108 = getelementptr inbounds [9 x i8], [9 x i8]* @.str.14, i32 0, i32 0
  %109 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 11
  %110 = load %class.B*, %class.B** %109, align 8
  %111 = icmp eq %class.B* %110, null
  br i1 %111, label %if.then.21, label %if.else.21

if.then.21:
  call void @print_dispatch_on_void_error(i32 38)
  call void @exit(i32 1)
  br label %if.end.21

if.else.21:
  br label %if.end.21

if.end.21:
  %112 = bitcast %class.B* %110 to %class.Object*
  %113 = call i8* @_CN6Object_FN9type_name_(%class.Object* %112)
  %114 = call i8* @_CN6String_FN6concat_(i8* %108, i8* %113)
  %115 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %106, i8* %114)
  ret i32 0
}

; Class: Main, Method: main
define i32 @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %1 = load %class.E*, %class.E** %0, align 8
  %2 = icmp eq %class.E* %1, null
  br i1 %2, label %if.then.22, label %if.else.22

if.then.22:
  call void @print_dispatch_on_void_error(i32 48)
  call void @exit(i32 1)
  br label %if.end.22

if.else.22:
  br label %if.end.22

if.end.22:
  %3 = call i32 @_CN1E_FN10checkTypes_(%class.E* %1)
  ret i32 %3
}

; Constructor of class 'Object'
define void @_CN6Object_FN6Object_(%class.Object* %this) {

entry:
  ret void
}

; Constructor of class 'B'
define void @_CN1B_FN1B_(%class.B* %this) {

entry:
  %0 = bitcast %class.B* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
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
  store i32 0, i32* %1, align 4
  ret void
}

; Constructor of class 'E'
define void @_CN1E_FN1E_(%class.E* %this) {

entry:
  %0 = bitcast %class.E* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 20)
  %3 = bitcast i8* %2 to %class.A*
  call void @_CN1A_FN1A_(%class.A* %3)
  %4 = bitcast %class.A* %3 to %class.Object*
  %5 = getelementptr inbounds %class.Object, %class.Object* %4, i32 0, i32 0
  %6 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.0, i32 0, i32 0
  store i8* %6, i8** %5, align 8
  store %class.A* %3, %class.A** %1, align 4
  %7 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 2
  %8 = call noalias i8* @malloc(i64 12)
  %9 = bitcast i8* %8 to %class.B*
  call void @_CN1B_FN1B_(%class.B* %9)
  %10 = bitcast %class.B* %9 to %class.Object*
  %11 = getelementptr inbounds %class.Object, %class.Object* %10, i32 0, i32 0
  %12 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.1, i32 0, i32 0
  store i8* %12, i8** %11, align 8
  store %class.B* %9, %class.B** %7, align 4
  %13 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 3
  %14 = call noalias i8* @malloc(i64 24)
  %15 = bitcast i8* %14 to %class.C*
  call void @_CN1C_FN1C_(%class.C* %15)
  %16 = bitcast %class.C* %15 to %class.Object*
  %17 = getelementptr inbounds %class.Object, %class.Object* %16, i32 0, i32 0
  %18 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  store i8* %18, i8** %17, align 8
  store %class.C* %15, %class.C** %13, align 4
  %19 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 4
  %20 = call noalias i8* @malloc(i64 20)
  %21 = bitcast i8* %20 to %class.A*
  call void @_CN1A_FN1A_(%class.A* %21)
  %22 = bitcast %class.A* %21 to %class.Object*
  %23 = getelementptr inbounds %class.Object, %class.Object* %22, i32 0, i32 0
  %24 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.0, i32 0, i32 0
  store i8* %24, i8** %23, align 8
  %25 = bitcast %class.A* %21 to %class.IO*
  %26 = bitcast %class.IO* %25 to %class.Object*
  store %class.Object* %26, %class.Object** %19, align 4
  %27 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 5
  %28 = call noalias i8* @malloc(i64 0)
  %29 = bitcast i8* %28 to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %29)
  %30 = getelementptr inbounds %class.Object, %class.Object* %29, i32 0, i32 0
  %31 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.25, i32 0, i32 0
  store i8* %31, i8** %30, align 8
  %32 = getelementptr inbounds %class.Object, %class.Object* %29, i32 0, i32 0
  %33 = getelementptr inbounds [4 x i8], [4 x i8]* @.str.28, i32 0, i32 0
  store i8* %33, i8** %32, align 8
  store %class.Object* %29, %class.Object** %27, align 4
  %34 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 6
  %35 = call noalias i8* @malloc(i64 8)
  %36 = bitcast i8* %35 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %36)
  %37 = bitcast %class.IO* %36 to %class.Object*
  %38 = getelementptr inbounds %class.Object, %class.Object* %37, i32 0, i32 0
  %39 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.26, i32 0, i32 0
  store i8* %39, i8** %38, align 8
  %40 = bitcast %class.IO* %36 to %class.Object*
  store %class.Object* %40, %class.Object** %34, align 4
  %41 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 7
  %42 = getelementptr inbounds [1 x i8], [1 x i8]* @.str.16, i32 0, i32 0
  %43 = call noalias i8* @malloc(i64 0)
  %44 = bitcast i8* %43 to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %44)
  %45 = getelementptr inbounds %class.Object, %class.Object* %44, i32 0, i32 0
  %46 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.25, i32 0, i32 0
  store i8* %46, i8** %45, align 8
  %47 = getelementptr inbounds %class.Object, %class.Object* %44, i32 0, i32 0
  %48 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.27, i32 0, i32 0
  store i8* %48, i8** %47, align 8
  store %class.Object* %44, %class.Object** %41, align 4
  %49 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 8
  %50 = call noalias i8* @malloc(i64 0)
  %51 = bitcast i8* %50 to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %51)
  %52 = getelementptr inbounds %class.Object, %class.Object* %51, i32 0, i32 0
  %53 = getelementptr inbounds [7 x i8], [7 x i8]* @.str.25, i32 0, i32 0
  store i8* %53, i8** %52, align 8
  %54 = getelementptr inbounds %class.Object, %class.Object* %51, i32 0, i32 0
  %55 = getelementptr inbounds [5 x i8], [5 x i8]* @.str.29, i32 0, i32 0
  store i8* %55, i8** %54, align 8
  store %class.Object* %51, %class.Object** %49, align 4
  %56 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 9
  %57 = call noalias i8* @malloc(i64 8)
  %58 = bitcast i8* %57 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %58)
  %59 = bitcast %class.IO* %58 to %class.Object*
  %60 = getelementptr inbounds %class.Object, %class.Object* %59, i32 0, i32 0
  %61 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.26, i32 0, i32 0
  store i8* %61, i8** %60, align 8
  store %class.IO* %58, %class.IO** %56, align 4
  %62 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 10
  %63 = call noalias i8* @malloc(i64 20)
  %64 = bitcast i8* %63 to %class.A*
  call void @_CN1A_FN1A_(%class.A* %64)
  %65 = bitcast %class.A* %64 to %class.Object*
  %66 = getelementptr inbounds %class.Object, %class.Object* %65, i32 0, i32 0
  %67 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.0, i32 0, i32 0
  store i8* %67, i8** %66, align 8
  %68 = bitcast %class.A* %64 to %class.IO*
  store %class.IO* %68, %class.IO** %62, align 4
  %69 = getelementptr inbounds %class.E, %class.E* %this, i32 0, i32 11
  %70 = call noalias i8* @malloc(i64 24)
  %71 = bitcast i8* %70 to %class.C*
  call void @_CN1C_FN1C_(%class.C* %71)
  %72 = bitcast %class.C* %71 to %class.Object*
  %73 = getelementptr inbounds %class.Object, %class.Object* %72, i32 0, i32 0
  %74 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  store i8* %74, i8** %73, align 8
  %75 = bitcast %class.C* %71 to %class.B*
  store %class.B* %75, %class.B** %69, align 4
  ret void
}

; Constructor of class 'Main'
define void @_CN4Main_FN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 96)
  %3 = bitcast i8* %2 to %class.E*
  call void @_CN1E_FN1E_(%class.E* %3)
  %4 = bitcast %class.E* %3 to %class.Object*
  %5 = getelementptr inbounds %class.Object, %class.Object* %4, i32 0, i32 0
  %6 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.3, i32 0, i32 0
  store i8* %6, i8** %5, align 8
  store %class.E* %3, %class.E** %1, align 4
  ret void
}

; Constructor of class 'IO'
define void @_CN2IO_FN2IO_(%class.IO* %this) {

entry:
  %0 = bitcast %class.IO* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  ret void
}

; Constructor of class 'A'
define void @_CN1A_FN1A_(%class.A* %this) {

entry:
  %0 = bitcast %class.A* %this to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %0)
  %1 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  store i32 0, i32* %1, align 4
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
  %2 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.18, i32 0, i32 0
  %3 = getelementptr inbounds [26 x i8], [26 x i8]* @.str.24, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %2, i8* %3)
  %5 = call i32 (i8*, ...) @printf(i8* %2, i8* %1)
  %6 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.17, i32 0, i32 0
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.18, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)
  %1 = call noalias i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: out_int
define %class.IO* @_CN2IO_FN7out_int_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.20, i32 0, i32 0
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
  %1 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.20, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: in_string
define i8* @_CN2IO_FN9in_string_(%class.IO* %this) {
entry:
  %0 = alloca i8*, align 8
  %1 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.19, i32 0, i32 0
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.18, i32 0, i32 0
  %1 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.22, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.20, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.17, i32 0, i32 0
  %6 = call i32 (i8*, ...) @printf(i8* %0, i8* %5)
  ret void
}
define void @print_dispatch_on_void_error(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.18, i32 0, i32 0
  %1 = getelementptr inbounds [30 x i8], [30 x i8]* @.str.23, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.20, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.17, i32 0, i32 0
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
