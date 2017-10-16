; ModuleID = '../test_cases/test5.cl'
source_filename = "../test_cases/test5.cl"

@.str.4 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c" , and appended new string
\00", align 1
@.str.0 = private unnamed_addr constant [17 x i8] c"This is a string\00", align 1
@.str.10 = private unnamed_addr constant [35 x i8] c"
Divide by 0 exception at line no \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c"
Dispatch to void at line no \00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"Main\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

%class.Object = type {}
%class.A = type { %class.Object, i32 }
%class.IO = type { %class.Object }
%class.Main = type { %class.IO, i32, i32, i8*, i8*, i32, %class.A* }


; Class: A, Method: f
define i32 @_CN1A_FN1f_(%class.A* %this) {

entry:
  ret i32 99
}

; Class: Main, Method: main
define %class.IO* @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = icmp eq %class.Main* %this, null
  br i1 %0, label %if.then, label %if.else

if.then:
  call void @print_dispatch_on_void_error(i32 17)
  %1 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end

if.else:
  br label %if.end

if.end:
  %2 = bitcast %class.Main* %this to %class.IO*
  %3 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %4 = load i8*, i8** %3, align 8
  %5 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %2, i8* %4)
  ret %class.IO* %5
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
  store i32 5, i32* %1, align 4
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
  store i32 10, i32* %1, align 4
  %2 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  %4 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.0, i32 0, i32 0
  store i8* %4, i8** %3, align 8
  %5 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %6 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  %7 = load i8*, i8** %6, align 8
  %8 = icmp eq i8* %7, null
  br i1 %8, label %if.then, label %if.else

if.then:
  call void @print_dispatch_on_void_error(i32 13)
  %9 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end

if.else:
  br label %if.end

if.end:
  %10 = getelementptr inbounds [28 x i8], [28 x i8]* @.str.1, i32 0, i32 0
  %11 = call i8* @_CN6String_FN6concat_(i8* %7, i8* %10)
  store i8* %11, i8** %5, align 8
  %12 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 5
  %13 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  %14 = load i8*, i8** %13, align 8
  %15 = icmp eq i8* %14, null
  br i1 %15, label %if.then.1, label %if.else.1

if.then.1:
  call void @print_dispatch_on_void_error(i32 14)
  %16 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.1

if.else.1:
  br label %if.end.1

if.end.1:
  %17 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  %18 = load i8*, i8** %17, align 8
  %19 = call i64 @strlen(i8* %18)
  %20 = trunc i64 %19 to i32
  store i32 %20, i32* %12, align 4
  %21 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 6
  %22 = call noalias i8* @malloc(i64 4)
  %23 = bitcast i8* %22 to %class.A*
  call void @_CN1A_FN1A_(%class.A* %23)
  store %class.A* %23, %class.A** %21, align 4
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)
  %1 = call noalias i8* @malloc(i64 0)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: out_int
define %class.IO* @_CN2IO_FN7out_int_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.8, i32 0, i32 0
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
  %dummyretval = call %class.IO* @_CN4Main_FN4main_(%class.Main* %main)
  ret i32 0
}
