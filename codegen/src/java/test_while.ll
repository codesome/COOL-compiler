@.str.0 = private unnamed_addr constant [1 x i8] c"\00", align 1

%class.Object = type {}
%class.Main = type { %class.Object, %class.Bool, %class.Int, %class.Object, %class.A }
%class.A = type { %class.Object, %class.Int, %class.Bool, %class.String }
%class.IO = type { %class.Object }
%class.String = type { %class.Object, i8* }
%class.Int = type { %class.Object, i32 }
%class.Bool = type { %class.Object, i8 }


; Class: Main, Method: main
define %class.Int @_CN4MainFN4main_(%class.Main* %this) {

entry:
  %0 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %1 = load %class.A*, %class.A** %0, align 8
  %2 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %2, i32 1)
  %3 = load %class.Int, %class.Int* %2, align 4
  %4 = call %class.Int @_CN1AFN2f1_(%class.A* %1, %class.Int %3)
  %5 = alloca %class.Int, align 8
  store %class.Int %4, %class.Int* %5, align 4
  %6 = load %class.Int, %class.Int* %5, align 4
  ret %class.Int %6
}

; Class: A, Method: f1
define %class.Int @_CN1AFN2f1_(%class.A* %this, %class.Int %x) {

entry:
  %x.addr = alloca %class.Int, align 8
  store %class.Int %x, %class.Int* %x.addr, align 4
  %0 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %0, i32 1)
  %1 = call i32 @_CN3IntFN3get_(%class.Int* %x.addr)
  %2 = call i32 @_CN3IntFN3get_(%class.Int* %0)
  %3 = add nsw i32 %1, %2
  %4 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %4, i32 %3)
  %5 = call i32 @_CN3IntFN3get_(%class.Int* %4)
  call void @_CN3IntFN3set_(%class.Int* %x.addr, i32 %5)
  %6 = load %class.Int, %class.Int* %4, align 4
  ret %class.Int %6
}

; Constructor of class 'Object'
define void @_CN6ObjectFN6Object_(%class.Object* %this) {

entry:
  ret void
}

; Constructor of class 'Main'
define void @_CN4MainFN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  call void @_CN4BoolFN4Bool_(%class.Bool* %1)
  %2 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  call void @_CN3IntFN3Int_(%class.Int* %2)
  %3 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  br label %while.cond

while.cond:
  %4 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %5 = load %class.Bool*, %class.Bool** %4, align 8
  %6 = call i8 @_CN4BoolFN3get_(%class.Bool* %5)
  %7 = trunc i8 %6 to i1
  br i1 %7, label %while.body, label %while.end

while.body:
  br label %while.cond.1

while.cond.1:
  %8 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %9 = load %class.Bool*, %class.Bool** %8, align 8
  %10 = call i8 @_CN4BoolFN3get_(%class.Bool* %9)
  %11 = trunc i8 %10 to i1
  br i1 %11, label %while.body.1, label %while.end.1

while.body.1:
  %12 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %13 = load %class.Int*, %class.Int** %12, align 8
  %14 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %14, i32 1)
  %15 = call i32 @_CN3IntFN3get_(%class.Int* %13)
  %16 = call i32 @_CN3IntFN3get_(%class.Int* %14)
  %17 = add nsw i32 %15, %16
  %18 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %18, i32 %17)
  %19 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %20 = load %class.Int*, %class.Int** %19, align 8
  %21 = call i32 @_CN3IntFN3get_(%class.Int* %18)
  call void @_CN3IntFN3set_(%class.Int* %20, i32 %21)
  br label %while.cond.1

while.end.1:
  %22 = alloca %class.Object, align 8
  store %class.Object undef, %class.Object* %22, align 4
  %23 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %24 = load %class.Int*, %class.Int** %23, align 8
  %25 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %25, i32 1)
  %26 = call i32 @_CN3IntFN3get_(%class.Int* %24)
  %27 = call i32 @_CN3IntFN3get_(%class.Int* %25)
  %28 = add nsw i32 %26, %27
  %29 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %29, i32 %28)
  %30 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %31 = load %class.Int*, %class.Int** %30, align 8
  %32 = call i32 @_CN3IntFN3get_(%class.Int* %29)
  call void @_CN3IntFN3set_(%class.Int* %31, i32 %32)
  br label %while.cond

while.end:
  %33 = alloca %class.Object, align 8
  store %class.Object undef, %class.Object* %33, align 4
  %34 = load %class.Object, %class.Object* %33, align 4
  store %class.Object %34, %class.Object* %3, align 4
  %35 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %36 = call noalias i8* @malloc(i64 13)
  %37 = bitcast i8* %36 to %class.A*
  call void @_CN1AFN1A_(%class.A* %37)
  %38 = load %class.A, %class.A* %37, align 4
  store %class.A %38, %class.A* %35, align 4
  ret void
}

; Constructor of class 'A'
define void @_CN1AFN1A_(%class.A* %this) {

entry:
  %0 = bitcast %class.A* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 4)
  %3 = bitcast i8* %2 to %class.Int*
  call void @_CN3IntFN3Int_(%class.Int* %3)
  %4 = call i32 @_CN3IntFN3get_(%class.Int* %3)
  call void @_CN3IntFN3set_(%class.Int* %1, i32 %4)
  %5 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 2
  %6 = call noalias i8* @malloc(i64 1)
  %7 = bitcast i8* %6 to %class.Bool*
  call void @_CN4BoolFN4Bool_(%class.Bool* %7)
  %8 = call i8 @_CN4BoolFN3get_(%class.Bool* %7)
  call void @_CN4BoolFN3set_(%class.Bool* %5, i8 %8)
  %9 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 3
  call void @_CN6StringFN6String_(%class.String* %9)
  ret void
}

; Constructor of class 'IO'
define void @_CN2IOFN2IO_(%class.IO* %this) {

entry:
  %0 = bitcast %class.IO* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  ret void
}

; Constructor of class 'String'
define void @_CN6StringFN6String_(%class.String* %this) {

entry:
  %0 = bitcast %class.String* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.String, %class.String* %this, i32 0, i32 1
  %2 = getelementptr inbounds [1 x i8], [1 x i8]* @.str.0, i32 0, i32 0
  store i8* %2, i8** %1, align 8
  ret void
}

; Constructor of class 'Int'
define void @_CN3IntFN3Int_(%class.Int* %this) {

entry:
  %0 = bitcast %class.Int* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Int, %class.Int* %this, i32 0, i32 1
  store i32 0, i32* %1, align 4
  ret void
}

; Constructor of class 'Bool'
define void @_CN4BoolFN4Bool_(%class.Bool* %this) {

entry:
  %0 = bitcast %class.Bool* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1
  store i8 0, i8* %1, align 4
  ret void
}

; Class: String, Method: set
define void @_CN6StringFN3set_(%class.String* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds %class.String, %class.String* %this, i32 0, i32 1
  store i8* %s, i8** %0, align 8
  ret void
}

; Class: String, Method: get
define i8* @_CN6StringFN3get_(%class.String* %this) {
entry:
  %0 = getelementptr inbounds %class.String, %class.String* %this, i32 0, i32 1
  %1 = load i8*, i8** %0, align 8
  ret i8* %1
}

; Class: Int, Method: set
define void @_CN3IntFN3set_(%class.Int* %this, i32 %s) {
entry:
  %0 = getelementptr inbounds %class.Int, %class.Int* %this, i32 0, i32 1
  store i32 %s, i32* %0, align 8
  ret void
}

; Class: Int, Method: get
define i32 @_CN3IntFN3get_(%class.Int* %this) {
entry:
  %0 = getelementptr inbounds %class.Int, %class.Int* %this, i32 0, i32 1
  %1 = load i32, i32* %0, align 8
  ret i32 %1
}

; Class: Bool, Method: set
define void @_CN4BoolFN3set_(%class.Bool* %this, i8 %s) {
entry:
  %0 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1
  store i8 %s, i8* %0, align 8
  ret void
}

; Class: Bool, Method: get
define i8 @_CN4BoolFN3get_(%class.Bool* %this) {
entry:
  %0 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1
  %1 = load i8, i8* %0, align 8
  ret i8 %1
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
