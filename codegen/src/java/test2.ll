@.str.0 = private unnamed_addr constant [1 x i8] c"\00", align 1

%class.Object = type {}
%class.Fib = type { %class.Object }
%class.Main = type { %class.Object, %class.Fib* }
%class.IO = type { %class.Object }


; Class: Fib, Method: fib
define i32 @_CN3Fib_FN3fib_(%class.Fib* %this, i32 %i, %class.Fib* %ff) {

entry:
  %i.addr = alloca i32, align 8
  store i32 %i, i32* %i.addr, align 4
  %ff.addr = alloca %class.Fib*, align 8
  store %class.Fib* %ff, %class.Fib** %ff.addr, align 8
  %0 = load i32, i32* %i.addr, align 4
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %if.then, label %if.else

if.then:
  br label %if.end

if.else:
  %2 = load i32, i32* %i.addr, align 4
  %3 = icmp eq i32 %2, 1
  br i1 %3, label %if.then.1, label %if.else.1

if.then.1:
  br label %if.end.1

if.else.1:
  %4 = load %class.Fib*, %class.Fib** %ff.addr, align 8
  %5 = load i32, i32* %i.addr, align 4
  %6 = sub nsw i32 %5, 1
  %7 = load %class.Fib*, %class.Fib** %ff.addr, align 8
  %8 = call i32 @_CN3Fib_FN3fib_(%class.Fib* %4, i32 %6, %class.Fib* %7)
  %9 = load %class.Fib*, %class.Fib** %ff.addr, align 8
  %10 = load i32, i32* %i.addr, align 4
  %11 = sub nsw i32 %10, 2
  %12 = load %class.Fib*, %class.Fib** %ff.addr, align 8
  %13 = call i32 @_CN3Fib_FN3fib_(%class.Fib* %9, i32 %11, %class.Fib* %12)
  %14 = add nsw i32 %8, %13
  br label %if.end.1

if.end.1:
  %15 = phi i32* [ 1, %if.then.1 ] , [ %14, %if.else.1 ]
  br label %if.end

if.end:
  %16 = phi i32* [ 0, %if.then ] , [ %15, %if.else ]
  ret i32 %16
}

; Class: Main, Method: main
define i32 @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %1 = load %class.Fib*, %class.Fib** %0, align 8
  %2 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %3 = load %class.Fib*, %class.Fib** %2, align 8
  %4 = call i32 @_CN3Fib_FN3fib_(%class.Fib* %1, i32 10, %class.Fib* %3)
  ret i32 %4
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
  ret void
}

; Constructor of class 'Main'
define void @_CN4Main_FN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  store %class.Fib* null, %class.Fib** %1, align 4
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

; Class: Object, Method: abort
define void @_CN6Object_FN5abort_() {
  call void @exit(i32 0)
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
