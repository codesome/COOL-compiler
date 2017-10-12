@.str.0 = private unnamed_addr constant [1 x i8] c"\00", align 1

%class.Object = type {}
%class.Main = type { %class.Object, %class.Bool, %class.Int, %class.Object, %class.A }
%class.A = type { %class.Object, %class.Int, %class.Bool, %class.String }
%class.IO = type { %class.Object }
%class.Int = type { %class.Object, i32 }
%class.String = type { %class.Object, i8* }
%class.Bool = type { %class.Object, i8 }


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
  %5 = call i8 @_CN4BoolFN3get_(%class.Bool* %4)
  %6 = trunc i8 %5 to i1
  br i1 %6, label %while.body, label %while.end

while.body:
  br label %while.cond.1

while.cond.1:
  %7 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %8 = call i8 @_CN4BoolFN3get_(%class.Bool* %7)
  %9 = trunc i8 %8 to i1
  br i1 %9, label %while.body.1, label %while.end.1

while.body.1:
  %10 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %11 = call i32 @_CN3IntFN3get_(%class.Int* %10)
  %12 = call i32 @_CN3IntFN3get_(%class.Int* 1)
  %13 = add nsw i32 %11, %12
  %14 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %14, i32 %13)
  %15 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %16 = call i32 @_CN3IntFN3get_(%class.Int* %14)
  call void @_CN3IntFN3set_(%class.Int* %15, i32 %16)
  br label %while.cond.1

while.end.1:
  %17 = load %class.Object, %class.Object* undef, align 4
  %18 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %19 = call i32 @_CN3IntFN3get_(%class.Int* %18)
  %20 = call i32 @_CN3IntFN3get_(%class.Int* 1)
  %21 = add nsw i32 %19, %20
  %22 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %22, i32 %21)
  %23 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %24 = call i32 @_CN3IntFN3get_(%class.Int* %22)
  call void @_CN3IntFN3set_(%class.Int* %23, i32 %24)
  br label %while.cond

while.end:
  %25 = load %class.Object, %class.Object* undef, align 4
  %26 = load %class.Object, %class.Object* %25, align 4
  store %class.Object %26, %class.Object* %3, align 4
  %27 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %28 = call noalias i8* @malloc(i64 32)
  %29 = bitcast i8* %28 to A
  call void @_CN1AFN1A_(%class.A* %29)
  %30 = load %class.A, %class.A* %29, align 4
  store %class.A %30, %class.A* %27, align 4
  ret void
}

; Constructor of class 'A'
define void @_CN1AFN1A_(%class.A* %this) {

entry:
  %0 = bitcast %class.A* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  call void @_CN3IntFN3Int_(%class.Int* %1)
  %2 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 2
  call void @_CN4BoolFN4Bool_(%class.Bool* %2)
  %3 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 3
  call void @_CN6StringFN6String_(%class.String* %3)
  ret void
}

; Constructor of class 'IO'
define void @_CN2IOFN2IO_(%class.IO* %this) {

entry:
  %0 = bitcast %class.IO* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  ret void
}

; Constructor of class 'Int'
define void @_CN3IntFN3Int_(%class.Int* %this) {

entry:
  %0 = bitcast %class.Int* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Int, %class.Int* %this, i32 0, i32 1
  store %class.i32 0, %class.i32* %1, align 4
  ret void
}

; Constructor of class 'String'
define void @_CN6StringFN6String_(%class.String* %this) {

entry:
  %0 = bitcast %class.String* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.String, %class.String* %this, i32 0, i32 1
  %2 = getelementptr inbounds [1 x i8], [1 x i8]* @.str.0, i32 0, i32 0
  store %class.i8* %2, %class.i8** %1, align 8
  ret void
}

; Constructor of class 'Bool'
define void @_CN4BoolFN4Bool_(%class.Bool* %this) {

entry:
  %0 = bitcast %class.Bool* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1
  store %class.i8 0, %class.i8* %1, align 4
  ret void
}

; Class: String, Method: set
define void @_CN6StringFN3set_(%class.String* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds %class.String, %class.String* %this, i32 0, i32 1
  store %class.i8* %s, %class.i8** %0, align 8
  ret void
}

; Class: String, Method: get
define i8* @_CN6StringFN3get_(%class.String* %this) {
entry:
  %0 = getelementptr inbounds %class.String, %class.String* %this, i32 0, i32 1
  %1 = load %class.i8*, %class.i8** %0, align 8
  ret i8* %1
}

; Class: Int, Method: set
define void @_CN3IntFN3set_(%class.Int* %this, i32 %s) {
entry:
  %0 = getelementptr inbounds %class.Int, %class.Int* %this, i32 0, i32 1
  store %class.i32 %s, %class.i32* %0, align 4
  ret void
}

; Class: Int, Method: get
define i32 @_CN3IntFN3get_(%class.Int* %this) {
entry:
  %0 = getelementptr inbounds %class.Int, %class.Int* %this, i32 0, i32 1
  %1 = load %class.i32, %class.i32* %0, align 4
  ret i32 %1
}

; Class: Bool, Method: set
define void @_CN4BoolFN3set_(%class.Bool* %this, i8 %s) {
entry:
  %0 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1
  store %class.i8 %s, %class.i8* %0, align 4
  ret void
}

; Class: Bool, Method: get
define i8 @_CN4BoolFN3get_(%class.Bool* %this) {
entry:
  %0 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1
  %1 = load %class.i8, %class.i8* %0, align 4
  ret i8 %1
}

; C Malloc declaration
declare noalias i8* @malloc(i64)

; Class: Main, Method: main
define %class.Int @_CN4MainFN4main_(%class.Main* %this) {

entry:
  %2 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %3 = load %class.Int, %class.Int* 1, align 4
  %4 = call %class.Int* @_CN1AFN2f1_(%class.A* %2, %class.Int %3)
}

; Class: A, Method: f1
define %class.Int @_CN1AFN2f1_(%class.A* %this, %class.Int %x) {

entry:
  %x.addr = alloca %class.Int, align 8
  store %class.Int %x, %class.Int* %x.addr, align 4
  %5 = call i32 @_CN3IntFN3get_(%class.Int* %x.addr)
  %6 = call i32 @_CN3IntFN3get_(%class.Int* 1)
  %7 = add nsw i32 %5, %6
  %8 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %8, i32 %7)
  %9 = call i32 @_CN3IntFN3get_(%class.Int* %8)
  call void @_CN3IntFN3set_(%class.Int* %x.addr, i32 %9)
}

; Class: Object, Method: abort
define %class.Object @_CN6ObjectFN5abort_(%class.Object* %this) {

entry:
}

; Class: Object, Method: type_name
define %class.String @_CN6ObjectFN9type_name_(%class.Object* %this) {

entry:
}

; Class: Object, Method: copy
define %class.Object @_CN6ObjectFN4copy_(%class.Object* %this) {

entry:
}

; Class: IO, Method: out_string
define %class.IO @_CN2IOFN10out_string_(%class.IO* %this, %class.String %x) {

entry:
  %x.addr = alloca %class.String, align 8
  store %class.String %x, %class.String* %x.addr, align 4
}

; Class: IO, Method: out_int
define %class.IO @_CN2IOFN7out_int_(%class.IO* %this, %class.Int %x) {

entry:
  %x.addr = alloca %class.Int, align 8
  store %class.Int %x, %class.Int* %x.addr, align 4
}

; Class: IO, Method: in_string
define %class.String @_CN2IOFN9in_string_(%class.IO* %this) {

entry:
}

; Class: IO, Method: in_int
define %class.Int @_CN2IOFN6in_int_(%class.IO* %this) {

entry:
}

; Class: String, Method: length
define %class.Int @_CN6StringFN6length_(%class.String* %this) {

entry:
}

; Class: String, Method: concat
define %class.String @_CN6StringFN6concat_(%class.String* %this, %class.String %s) {

entry:
  %s.addr = alloca %class.String, align 8
  store %class.String %s, %class.String* %s.addr, align 4
}

; Class: String, Method: substr
define %class.String @_CN6StringFN6substr_(%class.String* %this, %class.Int %i, %class.Int %l) {

entry:
  %i.addr = alloca %class.Int, align 8
  store %class.Int %i, %class.Int* %i.addr, align 4
  %l.addr = alloca %class.Int, align 8
  store %class.Int %l, %class.Int* %l.addr, align 4
}
