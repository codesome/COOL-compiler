@.str.8 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.0 = private unnamed_addr constant [16 x i8] c"Your number is \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"Main\00", align 1
@.str.10 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Your string is \00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"I will return a string\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

%class.Object = type {}
%class.A = type { %class.Object }
%class.B = type { %class.A }
%class.C = type { %class.B }
%class.IO = type { %class.Object }
%class.Main = type { %class.IO, %class.C*, %class.B*, i32, i8* }


; Class: A, Method: f
define i32 @_CN1A_FN1f_(%class.A* %this) {

entry:
  ret i32 10
}

; Class: B, Method: f
define i32 @_CN1B_FN1f_(%class.B* %this) {

entry:
  ret i32 20
}

; Class: Main, Method: main
define i8* @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.IO*
  %1 = call i32 @_CN2IO_FN6in_int_(%class.IO* %0)
  %2 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  store i32 %1, i32* %2, align 4
  %3 = bitcast %class.Main* %this to %class.IO*
  %4 = getelementptr inbounds [16 x i8], [16 x i8]* @.str.0, i32 0, i32 0
  %5 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %3, i8* %4)
  %6 = bitcast %class.Main* %this to %class.IO*
  %7 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  %8 = load i32, i32* %7, align 4
  %9 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %6, i32 %8)
  %10 = bitcast %class.Main* %this to %class.IO*
  %11 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.1, i32 0, i32 0
  %12 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %10, i8* %11)
  %13 = bitcast %class.Main* %this to %class.IO*
  %14 = call i8* @_CN2IO_FN9in_string_(%class.IO* %13)
  %15 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  store i8* %14, i8** %15, align 8
  %16 = bitcast %class.Main* %this to %class.IO*
  %17 = getelementptr inbounds [16 x i8], [16 x i8]* @.str.2, i32 0, i32 0
  %18 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %16, i8* %17)
  %19 = bitcast %class.Main* %this to %class.IO*
  %20 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %21 = load i8*, i8** %20, align 8
  %22 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %19, i8* %21)
  %23 = bitcast %class.Main* %this to %class.IO*
  %24 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.1, i32 0, i32 0
  %25 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %23, i8* %24)
  %26 = getelementptr inbounds [23 x i8], [23 x i8]* @.str.3, i32 0, i32 0
  ret i8* %26
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
  %2 = call noalias i8* @malloc(i64 0)
  %3 = bitcast i8* %2 to %class.C*
  call void @_CN1C_FN1C_(%class.C* %3)
  store %class.C* %3, %class.C** %1, align 4
  %4 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %5 = call noalias i8* @malloc(i64 0)
  %6 = bitcast i8* %5 to %class.C*
  call void @_CN1C_FN1C_(%class.C* %6)
  %7 = bitcast %class.C* %6 to %class.B*
  store %class.B* %7, %class.B** %4, align 4
  %8 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  store i32 0, i32* %8, align 4
  %9 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %10 = getelementptr inbounds [1 x i8], [1 x i8]* @.str.8, i32 0, i32 0
  store i8* %10, i8** %9, align 8
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.9, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)
  %1 = call noalias i8* @malloc(i64 0)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: out_int
define %class.IO* @_CN2IO_FN7out_int_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.11, i32 0, i32 0
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
  %1 = getelementptr inbounds [4 x i8], [4 x i8]* @.str.12, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: in_string
define i8* @_CN2IO_FN9in_string_(%class.IO* %this) {
entry:
  %0 = alloca i8*, align 8
  %1 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.10, i32 0, i32 0
  %2 = load i8*, i8** %0, align 8
  %call = call i32 (i8*, ...) @scanf(i8* %1, i8* %2)
  %3 = load i8*, i8** %0, align 8
  ret i8* %3
}

; C main() function
define i32 @main() {
entry:
  %main = alloca %class.Main, align 8
  call void @_CN4Main_FN4Main_(%class.Main* %main)
  %dummyretval = call i8* @_CN4Main_FN4main_(%class.Main* %main)
  ret i32 0
}
