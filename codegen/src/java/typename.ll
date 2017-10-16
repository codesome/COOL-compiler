; ModuleID = '../test_cases/typename.cl'
source_filename = "../test_cases/typename.cl"

@.str.6 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.0 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"123456789\00", align 1
@.str.11 = private unnamed_addr constant [35 x i8] c"
Divide by 0 exception at line no \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.12 = private unnamed_addr constant [30 x i8] c"
Dispatch to void at line no \00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.15 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"Object\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"Main\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

%class.Object = type {i8*}
%class.A = type { %class.Object }
%class.B = type { %class.A }
%class.C = type { %class.B }
%class.IO = type { %class.Object }
%class.Main = type { %class.IO, %class.A*, %class.B*, %class.C*, %class.A*, %class.B*, %class.A* }


; Class: Main, Method: main
define i32 @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = icmp eq %class.Main* %this, null
  br i1 %0, label %if.then, label %if.else

if.then:
  call void @print_dispatch_on_void_error(i32 19)
  %1 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end

if.else:
  br label %if.end

if.end:
  %2 = bitcast %class.Main* %this to %class.IO*
  %3 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %4 = load %class.A*, %class.A** %3, align 8
  %5 = icmp eq %class.A* %4, null
  br i1 %5, label %if.then.1, label %if.else.1

if.then.1:
  call void @print_dispatch_on_void_error(i32 19)
  %6 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.1

if.else.1:
  br label %if.end.1

if.end.1:
  %7 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %8 = load %class.A*, %class.A** %7, align 8
  %9 = bitcast %class.A* %8 to %class.Object*
  %10 = getelementptr inbounds %class.Object, %class.Object* %9, i32 0, i32 0
  %11 = load i8*, i8** %10, align 8
  %12 = icmp eq i8* %11, null
  br i1 %12, label %if.then.2, label %if.else.2

if.then.2:
  call void @print_dispatch_on_void_error(i32 19)
  %13 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.2

if.else.2:
  br label %if.end.2

if.end.2:
  %14 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %15 = call i8* @_CN6String_FN6concat_(i8* %11, i8* %14)
  %16 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %2, i8* %15)
  %17 = icmp eq %class.Main* %this, null
  br i1 %17, label %if.then.3, label %if.else.3

if.then.3:
  call void @print_dispatch_on_void_error(i32 20)
  %18 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.3

if.else.3:
  br label %if.end.3

if.end.3:
  %19 = bitcast %class.Main* %this to %class.IO*
  %20 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %21 = load %class.B*, %class.B** %20, align 8
  %22 = icmp eq %class.B* %21, null
  br i1 %22, label %if.then.4, label %if.else.4

if.then.4:
  call void @print_dispatch_on_void_error(i32 20)
  %23 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.4

if.else.4:
  br label %if.end.4

if.end.4:
  %24 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %25 = load %class.B*, %class.B** %24, align 8
  %26 = bitcast %class.B* %25 to %class.Object*
  %27 = getelementptr inbounds %class.Object, %class.Object* %26, i32 0, i32 0
  %28 = load i8*, i8** %27, align 8
  %29 = icmp eq i8* %28, null
  br i1 %29, label %if.then.5, label %if.else.5

if.then.5:
  call void @print_dispatch_on_void_error(i32 20)
  %30 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.5

if.else.5:
  br label %if.end.5

if.end.5:
  %31 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %32 = call i8* @_CN6String_FN6concat_(i8* %28, i8* %31)
  %33 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %19, i8* %32)
  %34 = icmp eq %class.Main* %this, null
  br i1 %34, label %if.then.6, label %if.else.6

if.then.6:
  call void @print_dispatch_on_void_error(i32 21)
  %35 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.6

if.else.6:
  br label %if.end.6

if.end.6:
  %36 = bitcast %class.Main* %this to %class.IO*
  %37 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  %38 = load %class.C*, %class.C** %37, align 8
  %39 = icmp eq %class.C* %38, null
  br i1 %39, label %if.then.7, label %if.else.7

if.then.7:
  call void @print_dispatch_on_void_error(i32 21)
  %40 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.7

if.else.7:
  br label %if.end.7

if.end.7:
  %41 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  %42 = load %class.C*, %class.C** %41, align 8
  %43 = bitcast %class.C* %42 to %class.Object*
  %44 = getelementptr inbounds %class.Object, %class.Object* %43, i32 0, i32 0
  %45 = load i8*, i8** %44, align 8
  %46 = icmp eq i8* %45, null
  br i1 %46, label %if.then.8, label %if.else.8

if.then.8:
  call void @print_dispatch_on_void_error(i32 21)
  %47 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.8

if.else.8:
  br label %if.end.8

if.end.8:
  %48 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %49 = call i8* @_CN6String_FN6concat_(i8* %45, i8* %48)
  %50 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %36, i8* %49)
  %51 = icmp eq %class.Main* %this, null
  br i1 %51, label %if.then.9, label %if.else.9

if.then.9:
  call void @print_dispatch_on_void_error(i32 22)
  %52 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.9

if.else.9:
  br label %if.end.9

if.end.9:
  %53 = bitcast %class.Main* %this to %class.IO*
  %54 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %55 = load %class.A*, %class.A** %54, align 8
  %56 = icmp eq %class.A* %55, null
  br i1 %56, label %if.then.10, label %if.else.10

if.then.10:
  call void @print_dispatch_on_void_error(i32 22)
  %57 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.10

if.else.10:
  br label %if.end.10

if.end.10:
  %58 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %59 = load %class.A*, %class.A** %58, align 8
  %60 = bitcast %class.A* %59 to %class.Object*
  %61 = getelementptr inbounds %class.Object, %class.Object* %60, i32 0, i32 0
  %62 = load i8*, i8** %61, align 8
  %63 = icmp eq i8* %62, null
  br i1 %63, label %if.then.11, label %if.else.11

if.then.11:
  call void @print_dispatch_on_void_error(i32 22)
  %64 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.11

if.else.11:
  br label %if.end.11

if.end.11:
  %65 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %66 = call i8* @_CN6String_FN6concat_(i8* %62, i8* %65)
  %67 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %53, i8* %66)
  %68 = icmp eq %class.Main* %this, null
  br i1 %68, label %if.then.12, label %if.else.12

if.then.12:
  call void @print_dispatch_on_void_error(i32 23)
  %69 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.12

if.else.12:
  br label %if.end.12

if.end.12:
  %70 = bitcast %class.Main* %this to %class.IO*
  %71 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 5
  %72 = load %class.B*, %class.B** %71, align 8
  %73 = icmp eq %class.B* %72, null
  br i1 %73, label %if.then.13, label %if.else.13

if.then.13:
  call void @print_dispatch_on_void_error(i32 23)
  %74 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.13

if.else.13:
  br label %if.end.13

if.end.13:
  %75 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 5
  %76 = load %class.B*, %class.B** %75, align 8
  %77 = bitcast %class.B* %76 to %class.Object*
  %78 = getelementptr inbounds %class.Object, %class.Object* %77, i32 0, i32 0
  %79 = load i8*, i8** %78, align 8
  %80 = icmp eq i8* %79, null
  br i1 %80, label %if.then.14, label %if.else.14

if.then.14:
  call void @print_dispatch_on_void_error(i32 23)
  %81 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.14

if.else.14:
  br label %if.end.14

if.end.14:
  %82 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %83 = call i8* @_CN6String_FN6concat_(i8* %79, i8* %82)
  %84 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %70, i8* %83)
  %85 = icmp eq %class.Main* %this, null
  br i1 %85, label %if.then.15, label %if.else.15

if.then.15:
  call void @print_dispatch_on_void_error(i32 24)
  %86 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.15

if.else.15:
  br label %if.end.15

if.end.15:
  %87 = bitcast %class.Main* %this to %class.IO*
  %88 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 6
  %89 = load %class.A*, %class.A** %88, align 8
  %90 = icmp eq %class.A* %89, null
  br i1 %90, label %if.then.16, label %if.else.16

if.then.16:
  call void @print_dispatch_on_void_error(i32 24)
  %91 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.16

if.else.16:
  br label %if.end.16

if.end.16:
  %92 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 6
  %93 = load %class.A*, %class.A** %92, align 8
  %94 = bitcast %class.A* %93 to %class.Object*
  %95 = getelementptr inbounds %class.Object, %class.Object* %94, i32 0, i32 0
  %96 = load i8*, i8** %95, align 8
  %97 = icmp eq i8* %96, null
  br i1 %97, label %if.then.17, label %if.else.17

if.then.17:
  call void @print_dispatch_on_void_error(i32 24)
  %98 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.17

if.else.17:
  br label %if.end.17

if.end.17:
  %99 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %100 = call i8* @_CN6String_FN6concat_(i8* %96, i8* %99)
  %101 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %87, i8* %100)
  %102 = icmp eq %class.Main* %this, null
  br i1 %102, label %if.then.18, label %if.else.18

if.then.18:
  call void @print_dispatch_on_void_error(i32 25)
  %103 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.18

if.else.18:
  br label %if.end.18

if.end.18:
  %104 = bitcast %class.Main* %this to %class.IO*
  %105 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.5, i32 0, i32 0
  %106 = icmp eq i8* %105, null
  br i1 %106, label %if.then.19, label %if.else.19

if.then.19:
  call void @print_dispatch_on_void_error(i32 25)
  %107 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.19

if.else.19:
  br label %if.end.19

if.end.19:
  %108 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.5, i32 0, i32 0
  %109 = call i64 @strlen(i8* %108)
  %110 = trunc i64 %109 to i32
  %111 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %104, i32 %110)
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
  ret void
}

; Constructor of class 'B'
define void @_CN1B_FN1B_(%class.B* %this) {

entry:
  %0 = bitcast %class.B* %this to %class.A*
  call void @_CN1A_FN1A_(%class.A* %0)
  ret void
}

; Constructor of class 'C'
define void @_CN1C_FN1C_(%class.C* %this) {

entry:
  %0 = bitcast %class.C* %this to %class.B*
  call void @_CN1B_FN1B_(%class.B* %0)
  ret void
}

; Constructor of class 'IO'
define void @_CN2IO_FN2IO_(%class.IO* %this) {

entry:
  %0 = bitcast %class.IO* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  ret void
}

; Constructor of class 'Main'
define void @_CN4Main_FN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 8)
  %3 = bitcast i8* %2 to %class.C*
  call void @_CN1C_FN1C_(%class.C* %3)
  %4 = bitcast %class.C* %3 to %class.Object*
  %5 = getelementptr inbounds %class.Object, %class.Object* %4, i32 0, i32 0
  %6 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  store i8* %6, i8** %5, align 8
  %7 = bitcast %class.C* %3 to %class.A*
  store %class.A* %7, %class.A** %1, align 4
  %8 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %9 = call noalias i8* @malloc(i64 8)
  %10 = bitcast i8* %9 to %class.C*
  call void @_CN1C_FN1C_(%class.C* %10)
  %11 = bitcast %class.C* %10 to %class.Object*
  %12 = getelementptr inbounds %class.Object, %class.Object* %11, i32 0, i32 0
  %13 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  store i8* %13, i8** %12, align 8
  %14 = bitcast %class.C* %10 to %class.B*
  store %class.B* %14, %class.B** %8, align 4
  %15 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  %16 = call noalias i8* @malloc(i64 8)
  %17 = bitcast i8* %16 to %class.C*
  call void @_CN1C_FN1C_(%class.C* %17)
  %18 = bitcast %class.C* %17 to %class.Object*
  %19 = getelementptr inbounds %class.Object, %class.Object* %18, i32 0, i32 0
  %20 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  store i8* %20, i8** %19, align 8
  store %class.C* %17, %class.C** %15, align 4
  %21 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %22 = call noalias i8* @malloc(i64 8)
  %23 = bitcast i8* %22 to %class.B*
  call void @_CN1B_FN1B_(%class.B* %23)
  %24 = bitcast %class.B* %23 to %class.Object*
  %25 = getelementptr inbounds %class.Object, %class.Object* %24, i32 0, i32 0
  %26 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.1, i32 0, i32 0
  store i8* %26, i8** %25, align 8
  %27 = bitcast %class.B* %23 to %class.A*
  store %class.A* %27, %class.A** %21, align 4
  %28 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 5
  %29 = call noalias i8* @malloc(i64 8)
  %30 = bitcast i8* %29 to %class.B*
  call void @_CN1B_FN1B_(%class.B* %30)
  %31 = bitcast %class.B* %30 to %class.Object*
  %32 = getelementptr inbounds %class.Object, %class.Object* %31, i32 0, i32 0
  %33 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.1, i32 0, i32 0
  store i8* %33, i8** %32, align 8
  store %class.B* %30, %class.B** %28, align 4
  %34 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 6
  %35 = call noalias i8* @malloc(i64 8)
  %36 = bitcast i8* %35 to %class.A*
  call void @_CN1A_FN1A_(%class.A* %36)
  %37 = bitcast %class.A* %36 to %class.Object*
  %38 = getelementptr inbounds %class.Object, %class.Object* %37, i32 0, i32 0
  %39 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.0, i32 0, i32 0
  store i8* %39, i8** %38, align 8
  store %class.A* %36, %class.A** %34, align 4
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
  %0 = call noalias i8* @malloc(i64 8)
  %1 = bitcast i8* %0 to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %1)
  ret %class.Object* %1
}

; Class: IO, Method: out_string
define %class.IO* @_CN2IO_FN10out_string_(%class.IO* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.7, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)
  %1 = call noalias i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: out_int
define %class.IO* @_CN2IO_FN7out_int_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.9, i32 0, i32 0
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
  %1 = getelementptr inbounds [4 x i8], [4 x i8]* @.str.10, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: in_string
define i8* @_CN2IO_FN9in_string_(%class.IO* %this) {
entry:
  %0 = alloca i8*, align 8
  %1 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.8, i32 0, i32 0
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.7, i32 0, i32 0
  %1 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.11, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.9, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %6 = call i32 (i8*, ...) @printf(i8* %0, i8* %5)
  ret void
}
define void @print_dispatch_on_void_error(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.7, i32 0, i32 0
  %1 = getelementptr inbounds [30 x i8], [30 x i8]* @.str.12, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.9, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
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
