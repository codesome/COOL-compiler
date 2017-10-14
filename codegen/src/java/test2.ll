@.str.2 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"Main\00", align 1
@.str.0 = private unnamed_addr constant [4 x i8] c"Fib\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

%class.Object = type {}
%class.Fib = type { %class.Object, i32 }
%class.IO = type { %class.Object }
%class.Main = type { %class.IO, %class.Fib* }


; Class: Fib, Method: fff
define i32 @_CN3Fib_FN3fff_(%class.Fib* %this) {

entry:
  %0 = getelementptr inbounds %class.Fib, %class.Fib* %this, i32 0, i32 1
  %1 = load i32, i32* %0, align 4
  %2 = call i32 @_CN3Fib_FN3fib_(%class.Fib* %this, i32 %1)
  ret i32 %2
}

; Class: Fib, Method: fib
define i32 @_CN3Fib_FN3fib_(%class.Fib* %this, i32 %i) {

entry:
  %i.addr = alloca i32, align 8
  store i32 %i, i32* %i.addr, align 4
  %0 = alloca i32, align 8
  %1 = load i32, i32* %i.addr, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %if.then, label %if.else

if.then:
  store i32 0, i32* %0, align 4
  br label %if.end

if.else:
  %3 = alloca i32, align 8
  %4 = load i32, i32* %i.addr, align 4
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %if.then.1, label %if.else.1

if.then.1:
  store i32 1, i32* %3, align 4
  br label %if.end.1

if.else.1:
  %6 = load i32, i32* %i.addr, align 4
  %7 = sub nsw i32 %6, 1
  %8 = call i32 @_CN3Fib_FN3fib_(%class.Fib* %this, i32 %7)
  %9 = load i32, i32* %i.addr, align 4
  %10 = sub nsw i32 %9, 2
  %11 = call i32 @_CN3Fib_FN3fib_(%class.Fib* %this, i32 %10)
  %12 = add nsw i32 %8, %11
  store i32 %12, i32* %3, align 4
  br label %if.end.1

if.end.1:
  %13 = load i32, i32* %3, align 4
  store i32 %13, i32* %0, align 4
  br label %if.end

if.end:
  %14 = load i32, i32* %0, align 4
  ret i32 %14
}

; Class: Main, Method: main
define i32 @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.IO*
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %2 = load %class.Fib*, %class.Fib** %1, align 8
  %3 = call i32 @_CN3Fib_FN3fff_(%class.Fib* %2)
  %4 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %0, i32 %3)
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

; C exit declaration
declare i32 @printf(i8*, ...)

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
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.3, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)
  %1 = call noalias i8* @malloc(i64 0)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: out_int
define %class.IO* @_CN2IO_FN7out_int_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.4, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i32 %d)
  %1 = call noalias i8* @malloc(i64 0)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; C main() function
define i32 @main() {
entry:
  %main = alloca %class.Main, align 8
  call void @_CN4Main_FN4Main_(%class.Main* %main)
  %retval = call i32 @_CN4Main_FN4main_(%class.Main* %main)
  ret i32 %retval
}
