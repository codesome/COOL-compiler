; ModuleID = '../test_cases/test2.cl'
source_filename = "../test_cases/test2.cl"

; String constant declarations
@.str.2 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.8 = private unnamed_addr constant [35 x i8] c"
Divide by 0 exception at line no \00", align 1
@.str.10 = private unnamed_addr constant [26 x i8] c"
Abort called from class \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.9 = private unnamed_addr constant [30 x i8] c"
Dispatch to void at line no \00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"Object\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"Main\00", align 1
@.str.0 = private unnamed_addr constant [4 x i8] c"Fib\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Struct declarations
%class.Object = type {i8*}
%class.Fib = type { %class.Object, i32 }
%class.IO = type { %class.Object }
%class.Main = type { %class.IO, %class.Fib* }


; Class: Fib, Method: fff
define i32 @_CN3Fib_FN3fff_(%class.Fib* %this) {

entry:
  %0 = icmp eq %class.Fib* %this, null
  br i1 %0, label %if.then, label %if.else

if.then:
  call void @print_dispatch_on_void_error(i32 4)
  call void @exit(i32 1)
  br label %if.end

if.else:
  br label %if.end

if.end:
  %1 = getelementptr inbounds %class.Fib, %class.Fib* %this, i32 0, i32 1
  %2 = load i32, i32* %1, align 4
  %3 = call i32 @_CN3Fib_FN3fib_(%class.Fib* %this, i32 %2)
  ret i32 %3
}

; Class: Fib, Method: fib
define i32 @_CN3Fib_FN3fib_(%class.Fib* %this, i32 %i) {

entry:
  %i.addr = alloca i32, align 8
  store i32 %i, i32* %i.addr, align 4
  %0 = alloca i32, align 8
  %1 = load i32, i32* %i.addr, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i1 %2 to i8
  %4 = trunc i8 %3 to i1
  br i1 %4, label %if.then.1, label %if.else.1

if.then.1:
  store i32 0, i32* %0, align 4
  br label %if.end.1

if.else.1:
  %5 = alloca i32, align 8
  %6 = load i32, i32* %i.addr, align 4
  %7 = icmp eq i32 %6, 1
  %8 = zext i1 %7 to i8
  %9 = trunc i8 %8 to i1
  br i1 %9, label %if.then.2, label %if.else.2

if.then.2:
  store i32 1, i32* %5, align 4
  br label %if.end.2

if.else.2:
  %10 = icmp eq %class.Fib* %this, null
  br i1 %10, label %if.then.3, label %if.else.3

if.then.3:
  call void @print_dispatch_on_void_error(i32 10)
  call void @exit(i32 1)
  br label %if.end.3

if.else.3:
  br label %if.end.3

if.end.3:
  %11 = load i32, i32* %i.addr, align 4
  %12 = sub nsw i32 %11, 1
  %13 = call i32 @_CN3Fib_FN3fib_(%class.Fib* %this, i32 %12)
  %14 = icmp eq %class.Fib* %this, null
  br i1 %14, label %if.then.4, label %if.else.4

if.then.4:
  call void @print_dispatch_on_void_error(i32 10)
  call void @exit(i32 1)
  br label %if.end.4

if.else.4:
  br label %if.end.4

if.end.4:
  %15 = load i32, i32* %i.addr, align 4
  %16 = sub nsw i32 %15, 2
  %17 = call i32 @_CN3Fib_FN3fib_(%class.Fib* %this, i32 %16)
  %18 = add nsw i32 %13, %17
  store i32 %18, i32* %5, align 4
  br label %if.end.2

if.end.2:
  %19 = load i32, i32* %5, align 4
  store i32 %19, i32* %0, align 4
  br label %if.end.1

if.end.1:
  %20 = load i32, i32* %0, align 4
  ret i32 %20
}

; Class: Main, Method: main
define i32 @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = icmp eq %class.Main* %this, null
  br i1 %0, label %if.then.5, label %if.else.5

if.then.5:
  call void @print_dispatch_on_void_error(i32 20)
  call void @exit(i32 1)
  br label %if.end.5

if.else.5:
  br label %if.end.5

if.end.5:
  %1 = bitcast %class.Main* %this to %class.IO*
  %2 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %3 = load %class.Fib*, %class.Fib** %2, align 8
  %4 = icmp eq %class.Fib* %3, null
  br i1 %4, label %if.then.6, label %if.else.6

if.then.6:
  call void @print_dispatch_on_void_error(i32 20)
  call void @exit(i32 1)
  br label %if.end.6

if.else.6:
  br label %if.end.6

if.end.6:
  %5 = call i32 @_CN3Fib_FN3fff_(%class.Fib* %3)
  %6 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %1, i32 %5)
  ret i32 99
}

; Constructor of class 'Object'
define void @_CN6Object_FN6Object_(%class.Object* %this) {

entry:
  ret void
}

; Constructor of class 'Fib'
define void @_CN3Fib_FN3Fib_(%class.Fib* %this) {

entry:
  %0 = bitcast %class.Fib* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Fib, %class.Fib* %this, i32 0, i32 1
  store i32 10, i32* %1, align 4
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
  store %class.Fib* null, %class.Fib** %1, align 4
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
  %2 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.4, i32 0, i32 0
  %3 = getelementptr inbounds [26 x i8], [26 x i8]* @.str.10, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %2, i8* %3)
  %5 = call i32 (i8*, ...) @printf(i8* %2, i8* %1)
  %6 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.3, i32 0, i32 0
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.4, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)
  %1 = call noalias i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: out_int
define %class.IO* @_CN2IO_FN7out_int_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
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
  %1 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: in_string
define i8* @_CN2IO_FN9in_string_(%class.IO* %this) {
entry:
  %0 = alloca i8*, align 8
  %1 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.5, i32 0, i32 0
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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.4, i32 0, i32 0
  %1 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.8, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.3, i32 0, i32 0
  %6 = call i32 (i8*, ...) @printf(i8* %0, i8* %5)
  ret void
}
define void @print_dispatch_on_void_error(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.4, i32 0, i32 0
  %1 = getelementptr inbounds [30 x i8], [30 x i8]* @.str.9, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.3, i32 0, i32 0
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
