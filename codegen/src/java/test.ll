@.str.1 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.0 = private unnamed_addr constant [17 x i8] c"This is a string\00", align 1

%class.Object = type {}
%class.A = type { %class.Object, i32, %class.Object*, i8 }
%class.B = type { %class.A, i8*, %class.A* }
%class.Main = type { %class.Object, i32, i8, %class.A* }
%class.IO = type { %class.Object }


; Class: A, Method: test
define i32 @_CN1AFN4test_(%class.A* %this) {

entry:
  %0 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %0, i32 99)
  ret i32 %0
}

; Class: Main, Method: main
define i32 @_CN4MainFN4main_(%class.Main* %this) {

entry:
  %0 = call noalias i8* @malloc(i64 13)
  %1 = bitcast i8* %0 to %class.A*
  call void @_CN1AFN1A_(%class.A* %1)
  %2 = call %class.Int @_CN1AFN4test_(%class.A* %1)
  %3 = alloca %class.Int, align 8
  store %class.Int %2, %class.Int* %3, align 4
  ret i32 %3
}

; Class: Main, Method: xyz
define %class.A* @_CN4MainFN3xyz_(%class.Main* %this, i32 %x, i32 %y, i32 %z, %class.A* %v) {

entry:
  %x.addr = alloca i32, align 8
  store %class.i32 %x, %class.i32* %x.addr, align 4
  %y.addr = alloca i32, align 8
  store %class.i32 %y, %class.i32* %y.addr, align 4
  %z.addr = alloca i32, align 8
  store %class.i32 %z, %class.i32* %z.addr, align 4
  %v.addr = alloca %class.A*, align 8
  store %class.%class.A* %v, %class.%class.A** %v.addr, align 8
  %0 = call i32 @_CN3IntFN3get_(%class.Int* %x.addr)
  %1 = call i32 @_CN3IntFN3get_(%class.Int* %y.addr)
  %2 = add nsw i32 %0, %1
  %3 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %3, i32 %2)
  %4 = call i32 @_CN3IntFN3get_(%class.Int* %3)
  %5 = call i32 @_CN3IntFN3get_(%class.Int* %z.addr)
  %6 = add nsw i32 %4, %5
  %7 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %7, i32 %6)
  ret %class.A* %v.addr
}

; Constructor of class 'Object'
define void @_CN6ObjectFN6Object_(%class.Object* %this) {

entry:
  ret void
}

; Constructor of class 'A'
define void @_CN1AFN1A_(%class.A* %this) {

entry:
  %0 = bitcast %class.A* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  %2 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %2, i32 100)
  store %class.i32 %2, %class.i32* %1, align 4
  %3 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 2
  br label %while.cond

while.cond:
  %4 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 3
  %5 = call i8 @_CN4BoolFN3get_(%class.Bool* %4)
  %6 = trunc i8 %5 to i1
  br i1 %6, label %while.body, label %while.end

while.body:
  %7 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  %8 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %8, i32 1)
  %9 = call i32 @_CN3IntFN3get_(%class.Int* %7)
  %10 = call i32 @_CN3IntFN3get_(%class.Int* %8)
  %11 = add nsw i32 %9, %10
  %12 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %12, i32 %11)
  %13 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  %14 = call i32 @_CN3IntFN3get_(%class.Int* %12)
  call void @_CN3IntFN3set_(%class.Int* %13, i32 %14)
  br label %while.cond

while.end:
  %15 = alloca %class.Object, align 8
  store %class.Object undef, %class.Object* %15, align 4
  store %class.Object* %15, %class.Object** %3, align 4
  %16 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 3
  %17 = alloca %class.Bool, align 8
  call void @_CN4BoolFN3set_(%class.Bool* %17, i8 1)
  store %class.i8 %17, %class.i8* %16, align 4
  ret void
}

; Constructor of class 'B'
define void @_CN1BFN1B_(%class.B* %this) {

entry:
  %0 = bitcast %class.B* %this to %class.A*
  call void @_CN1AFN1A_(%class.A* %0)
  %1 = getelementptr inbounds %class.B, %class.B* %this, i32 0, i32 1
  %2 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.0, i32 0, i32 0
  %3 = alloca %class.String, align 8
  call void @_CN6StringFN3set_(%class.String* %3, i8* %2)
  store %class.i8* %3, %class.i8** %1, align 8
  %4 = getelementptr inbounds %class.B, %class.B* %this, i32 0, i32 2
  store %class.A* 0, %class.A** %4, align 4
  ret void
}

; Constructor of class 'Main'
define void @_CN4MainFN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  store %class.i32 0, %class.i32* %1, align 4
  %2 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  store %class.i8 0, %class.i8* %2, align 4
  %3 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  %4 = call noalias i8* @malloc(i64 13)
  %5 = bitcast i8* %4 to %class.A*
  call void @_CN1AFN1A_(%class.A* %5)
  store %class.A* %5, %class.A** %3, align 4
  ret void
}

; Constructor of class 'IO'
define void @_CN2IOFN2IO_(%class.IO* %this) {

entry:
  %0 = bitcast %class.IO* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  ret void
}

; C Malloc declaration
declare noalias i8* @malloc(i64)

; main() function
define i32 @main() {
entry:
  %retval = alloca i32, align 4
  %main = alloca %class.Main, align 8
  ret i32 0
}
