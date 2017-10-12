@.str.1 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.0 = private unnamed_addr constant [17 x i8] c"This is a string\00", align 1

%class.Object = type {}
%class.A = type { %class.Object, %class.Int, %class.Object, %class.Bool }
%class.B = type { %class.A, %class.String, %class.A }
%class.Main = type { %class.Object, %class.Int, %class.Bool, %class.A }
%class.IO = type { %class.Object }
%class.Int = type { %class.Object, i32 }
%class.String = type { %class.Object, i8* }
%class.Bool = type { %class.Object, i8 }


; Class: A, Method: test
define %class.Int* @_CN1AFN4test_(%class.A* %this) {

entry:
  %0 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %0, i32 99)
}

; Class: Main, Method: main
define %class.Int* @_CN4MainFN4main_(%class.Main* %this) {

entry:
  %1 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %1, i32 0)
}

; Class: Object, Method: abort
define %class.Object* @_CN6ObjectFN5abort_(%class.Object* %this) {

entry:
}

; Class: Object, Method: type_name
define %class.String* @_CN6ObjectFN9type_name_(%class.Object* %this) {

entry:
}

; Class: Object, Method: copy
define %class.Object* @_CN6ObjectFN4copy_(%class.Object* %this) {

entry:
}

; Class: IO, Method: out_string
define %class.IO* @_CN2IOFN10out_string_(%class.IO* %this, %class.String %x) {

entry:
  %x.addr = alloca %class.String, align 8
  store %class.String %x, %class.String* %x.addr, align 4
}

; Class: IO, Method: out_int
define %class.IO* @_CN2IOFN7out_int_(%class.IO* %this, %class.Int %x) {

entry:
  %x.addr = alloca %class.Int, align 8
  store %class.Int %x, %class.Int* %x.addr, align 4
}

; Class: IO, Method: in_string
define %class.String* @_CN2IOFN9in_string_(%class.IO* %this) {

entry:
}

; Class: IO, Method: in_int
define %class.Int* @_CN2IOFN6in_int_(%class.IO* %this) {

entry:
}

; Class: String, Method: length
define %class.Int* @_CN6StringFN6length_(%class.String* %this) {

entry:
}

; Class: String, Method: concat
define %class.String* @_CN6StringFN6concat_(%class.String* %this, %class.String %s) {

entry:
  %s.addr = alloca %class.String, align 8
  store %class.String %s, %class.String* %s.addr, align 4
}

; Class: String, Method: substr
define %class.String* @_CN6StringFN6substr_(%class.String* %this, %class.Int %i, %class.Int %l) {

entry:
  %i.addr = alloca %class.Int, align 8
  store %class.Int %i, %class.Int* %i.addr, align 4
  %l.addr = alloca %class.Int, align 8
  store %class.Int %l, %class.Int* %l.addr, align 4
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
  %3 = call i32 @_CN3IntFN3get_(%class.Int* %2)
  call void @_CN3IntFN3set_(%class.Int* %1, i32 %3)
  %4 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 2
  br label %while.cond

while.cond:
  %5 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 3
  %6 = call i8 @_CN4BoolFN3get_(%class.Bool* %5)
  %7 = trunc i8 %6 to i1
  br i1 %7, label %while.body, label %while.end

while.body:
  %8 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  %9 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %9, i32 1)
  %10 = call i32 @_CN3IntFN3get_(%class.Int* %8)
  %11 = call i32 @_CN3IntFN3get_(%class.Int* %9)
  %12 = add nsw i32 %10, %11
  %13 = alloca %class.Int, align 8
  call void @_CN3IntFN3set_(%class.Int* %13, i32 %12)
  %14 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  %15 = call i32 @_CN3IntFN3get_(%class.Int* %13)
  call void @_CN3IntFN3set_(%class.Int* %14, i32 %15)
  br label %while.cond

while.end:
  %16 = load %class.Object, %class.Object* undef, align 4
  %17 = load %class.Object, %class.Object* %16, align 4
  store %class.Object %17, %class.Object* %4, align 4
  %18 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 3
  %19 = alloca %class.Bool, align 8
  call void @_CN4BoolFN3set_(%class.Bool* %19, i8 1)
  %20 = call i8 @_CN4BoolFN3get_(%class.Bool* %19)
  call void @_CN4BoolFN3set_(%class.Bool* %18, i8 %20)
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
  %4 = call i8* @_CN6StringFN3get_(%class.String* %3)
  call void @_CN6StringFN3set_(%class.String* %1, i8* %4)
  %5 = getelementptr inbounds %class.B, %class.B* %this, i32 0, i32 2
  store %class.A undef, %class.A* %5, align 4
  ret void
}

; Constructor of class 'Main'
define void @_CN4MainFN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  call void @_CN3IntFN3Int_(%class.Int* %1)
  %2 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  call void @_CN4BoolFN4Bool_(%class.Bool* %2)
  %3 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  %4 = call noalias i8* @malloc(i64 32)
  %5 = bitcast i8* %4 to A
  call void @_CN1AFN1A_(%class.A* %5)
  %6 = load %class.A, %class.A* %5, align 4
  store %class.A %6, %class.A* %3, align 4
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
  %2 = getelementptr inbounds [1 x i8], [1 x i8]* @.str.1, i32 0, i32 0
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
  ret i32 %1
}

; C Malloc declaration
declare noalias i8* @malloc(i64)
