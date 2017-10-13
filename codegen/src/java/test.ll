@.str.1 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.0 = private unnamed_addr constant [17 x i8] c"This is a string\00", align 1

%class.Object = type {}
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
  %0 = call noalias i8* @malloc(i64 13)
  %1 = bitcast i8* %0 to %class.A*
  call void @_CN1A_FN1A_(%class.A* %1)
  %2 = call %class.Int @_CN1A_FN4test_(%class.A* %1)
  ret i32 %2
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
  %0 = add nsw i32 %x.addr, %y.addr
  %1 = add nsw i32 %0, %z.addr
  ret %class.A* %v.addr
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
  %4 = load %class.Bool, %class.Bool* %3, align 4
  %5 = call i8 @_CN4Bool_FN3get_(%class.Bool* %4)
  %6 = trunc i8 %5 to i1
  br i1 %6, label %while.body, label %while.end

while.body:
  %7 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  %8 = load %class.Int, %class.Int* %7, align 4
  %9 = add nsw i32 %8, 1
  %10 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  store Int %9, Int* %10, align 4
  br label %while.cond

while.end:
  %11 = alloca %class.%class.Object*, align 8
  store Object 0, Object* %11, align 4
  store %class.Object* %11, %class.Object** %2, align 4
  %12 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 3
  store i8 1, i8* %12, align 4
  ret void
}

; Constructor of class 'B'
define void @_CN1B_FN1B_(%class.B* %this) {

entry:
  %0 = bitcast %class.B* %this to %class.A*
  call void @_CN1A_FN1A_(%class.A* %0)
  %1 = getelementptr inbounds %class.B, %class.B* %this, i32 0, i32 1
  %2 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.0, i32 0, i32 0
  store i8* %2, i8** %1, align 8
  %3 = getelementptr inbounds %class.B, %class.B* %this, i32 0, i32 2
  store %class.A* 0, %class.A** %3, align 4
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
  %4 = call noalias i8* @malloc(i64 13)
  %5 = bitcast i8* %4 to %class.A*
  call void @_CN1A_FN1A_(%class.A* %5)
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

; Class: Object, Method: abort
define void @_CN6Object_FN5abort_() {
  call void @exit(i32 0)
  ret void
}

; C main() function
define i32 @main() {
entry:
  %retval = alloca i32, align 4
  %main = alloca %class.Main, align 8
  ret i32 0
}
