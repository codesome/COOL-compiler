; ModuleID = '../test_cases/test.cl'
source_filename = "../test_cases/test.cl"

@.str.4 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.0 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.10 = private unnamed_addr constant [35 x i8] c"
Divide by 0 exception at line no \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c"
Dispatch to void at line no \00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.14 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.15 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"This is a string\00", align 1
@.str.16 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@.str.12 = private unnamed_addr constant [7 x i8] c"Object\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"Main\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

%class.Object = type {i8*}
%class.A = type { %class.Object, i32, %class.Object*, i8 }
%class.B = type { %class.A, i8*, %class.A* }
%class.Main = type { %class.Object, i32, i8, %class.A* }
%class.IO = type { %class.Object }


; Class: A, Method: test
define i32 @_CN1A_FN4test_(%class.A* %this) {

entry:
  ret i32 99
}

; Class: Main, Method: main
define i32 @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = call noalias i8* @malloc(i64 21)
  %1 = bitcast i8* %0 to %class.A*
  call void @_CN1A_FN1A_(%class.A* %1)
  %2 = bitcast %class.A* %1 to %class.Object*
  %3 = getelementptr inbounds %class.Object, %class.Object* %2, i32 0, i32 0
  %4 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.0, i32 0, i32 0
  store i8* %4, i8** %3, align 8
  %5 = icmp eq %class.A* %1, null
  br i1 %5, label %if.then, label %if.else

if.then:
  call void @print_dispatch_on_void_error(i32 21)
  %6 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end

if.else:
  br label %if.end

if.end:
  %7 = call i32 @_CN1A_FN4test_(%class.A* %1)
  ret i32 %7
}

; Class: Main, Method: xyz
define %class.A* @_CN4Main_FN3xyz_(%class.Main* %this, i32 %x, i32 %y, i32 %z, %class.A* %v) {

entry:
  %x.addr = alloca i32, align 8
  store i32 %x, i32* %x.addr, align 4
  %y.addr = alloca i32, align 8
  store i32 %y, i32* %y.addr, align 4
  %z.addr = alloca i32, align 8
  store i32 %z, i32* %z.addr, align 4
  %v.addr = alloca %class.A*, align 8
  store %class.A* %v, %class.A** %v.addr, align 8
  %0 = load i32, i32* %x.addr, align 4
  %1 = load i32, i32* %y.addr, align 4
  %2 = add nsw i32 %0, %1
  %3 = load i32, i32* %z.addr, align 4
  %4 = add nsw i32 %2, %3
  %5 = load %class.A*, %class.A** %v.addr, align 8
  ret %class.A* %5
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
  store i32 100, i32* %1, align 4
  %2 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 2
  br label %while.cond

while.cond:
  %3 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 3
  %4 = load i8, i8* %3, align 4
  %5 = trunc i8 %4 to i1
  br i1 %5, label %while.body, label %while.end

while.body:
  %6 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  %7 = load i32, i32* %6, align 4
  %8 = add nsw i32 %7, 1
  %9 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  store i32 %8, i32* %9, align 4
  br label %while.cond

while.end:
  store %class.Object* null, %class.Object** %2, align 4
  %10 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 3
  store i8 1, i8* %10, align 4
  ret void
}

; Constructor of class 'B'
define void @_CN1B_FN1B_(%class.B* %this) {

entry:
  %0 = bitcast %class.B* %this to %class.A*
  call void @_CN1A_FN1A_(%class.A* %0)
  %1 = getelementptr inbounds %class.B, %class.B* %this, i32 0, i32 1
  %2 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.2, i32 0, i32 0
  store i8* %2, i8** %1, align 8
  %3 = getelementptr inbounds %class.B, %class.B* %this, i32 0, i32 2
  store %class.A* null, %class.A** %3, align 4
  ret void
}

; Constructor of class 'Main'
define void @_CN4Main_FN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  store i32 0, i32* %1, align 4
  %2 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  store i8 0, i8* %2, align 4
  %3 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  %4 = call noalias i8* @malloc(i64 21)
  %5 = bitcast i8* %4 to %class.A*
  call void @_CN1A_FN1A_(%class.A* %5)
  %6 = bitcast %class.A* %5 to %class.Object*
  %7 = getelementptr inbounds %class.Object, %class.Object* %6, i32 0, i32 0
  %8 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.0, i32 0, i32 0
  store i8* %8, i8** %7, align 8
  store %class.A* %5, %class.A** %3, align 4
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
  %0 = call noalias i8* @malloc(i64 8)
  %1 = bitcast i8* %0 to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %1)
  ret %class.Object* %1
}

; Class: IO, Method: out_string
define %class.IO* @_CN2IO_FN10out_string_(%class.IO* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)
  %1 = call noalias i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: out_int
define %class.IO* @_CN2IO_FN7out_int_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.8, i32 0, i32 0
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
  %1 = getelementptr inbounds [4 x i8], [4 x i8]* @.str.9, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: in_string
define i8* @_CN2IO_FN9in_string_(%class.IO* %this) {
entry:
  %0 = alloca i8*, align 8
  %1 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.7, i32 0, i32 0
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
  %1 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.10, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.8, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.5, i32 0, i32 0
  %6 = call i32 (i8*, ...) @printf(i8* %0, i8* %5)
  ret void
}
define void @print_dispatch_on_void_error(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
  %1 = getelementptr inbounds [30 x i8], [30 x i8]* @.str.11, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.8, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.5, i32 0, i32 0
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
