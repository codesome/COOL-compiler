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
  %4 = getelementptr inbounds %class.Bool, %class.Bool* %this,null
  %5 = call i8 @_CN4BoolFN3get_(%class.Bool* %4)
  %6 = trunc i8 %5 to i1
  br i1 %6, label %while.body, label %while.end

while.body:
  br label %while.cond.1

while.cond.1:
  %7 = getelementptr inbounds %class.Bool, %class.Bool* %this,null
  %8 = call i8 @_CN4BoolFN3get_(%class.Bool* %7)
  %9 = trunc i8 %8 to i1
  br i1 %9, label %while.body.1, label %while.end.1

while.body.1:
  %10 = getelementptr inbounds %class.Int, %class.Int* %this,null
  %11 = call i32 @_CN3IntFN3get_(%class.Int* %10)
  %12 = add nsw i32* %11, 1
  %13 = getelementptr inbounds %class.Int, %class.Int* %this,null
  call void @_CN1cFN3set_(%class.Int* %13, i32* %12)
  br label %while.cond.1

while.end.1:
  %14 = load %class.Object*, %class.Object** undef, align 8
  %15 = getelementptr inbounds %class.Int, %class.Int* %this,null
  %16 = call i32 @_CN3IntFN3get_(%class.Int* %15)
  %17 = add nsw i32* %16, 1
  %18 = getelementptr inbounds %class.Int, %class.Int* %this,null
  call void @_CN1cFN3set_(%class.Int* %18, i32* %17)
  br label %while.cond

while.end:
  %19 = load %class.Object*, %class.Object** undef, align 8
  store %class.Object* %19, %class.Object** %3, align 8
  %20 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %21 = call noalias i8* @malloc(i64 32)
  %22 = bitcast i8* %21 to %class.A*
  call void @_CN1AFN1A_(%class.A* %22)
  store %class.A* %22, %class.A** %20, align 8
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
  store %class.i32* 0, %class.i32** %1, align 8
  ret void
}

; Constructor of class 'String'
define void @_CN6StringFN6String_(%class.String* %this) {

entry:
  %0 = bitcast %class.String* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.String, %class.String* %this, i32 0, i32 1
  %2 = getelementptr inbounds [1 x i8], [1 x i8]* @.str.0, i32 0, i32 0
  store %class.i8** %2, %class.i8*** %1, align 8
  ret void
}

; Constructor of class 'Bool'
define void @_CN4BoolFN4Bool_(%class.Bool* %this) {

entry:
  %0 = bitcast %class.Bool* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1
  store %class.i8* 0, %class.i8** %1, align 8
  ret void
}

; Class: String, Method: set
define void @_CN6StringFN3set_(%class.String* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds %class.String, %class.String* %this, i32 0, i32 1
  store %class.i8** %s, %class.i8*** %0, align 8
  ret void
}

; Class: String, Method: get
define i8* @_CN6StringFN3get_(%class.String* %this) {
entry:
  %0 = getelementptr inbounds %class.String, %class.String* %this, i32 0, i32 1
  %1 = load %class.i8**, %class.i8*** %0, align 8
  ret i8* %1
}

; Class: Int, Method: set
define void @_CN3IntFN3set_(%class.Int* %this, i32 %s) {
entry:
  %0 = getelementptr inbounds %class.Int, %class.Int* %this, i32 0, i32 1
  store %class.i32* %s, %class.i32** %0, align 8
  ret void
}

; Class: Int, Method: get
define i32 @_CN3IntFN3get_(%class.Int* %this) {
entry:
  %0 = getelementptr inbounds %class.Int, %class.Int* %this, i32 0, i32 1
  %1 = load %class.i32*, %class.i32** %0, align 8
  ret i32 %1
}

; Class: Bool, Method: set
define void @_CN4BoolFN3set_(%class.Bool* %this, i8 %s) {
entry:
  %0 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1
  store %class.i8* %s, %class.i8** %0, align 8
  ret void
}

; Class: Bool, Method: get
define i8 @_CN4BoolFN3get_(%class.Bool* %this) {
entry:
  %0 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1
  %1 = load %class.i8*, %class.i8** %0, align 8
  ret i8 %1
}

; C Malloc declaration
declare noalias i8* @malloc(i64)

; Class: Main, Method: main
define %class.Int @_CN4MainFN4main_() {

entry:
  %2 = load %class.A*, %class.A** e, align 8
  %3 = call %class.Int* @_CN4MainFN2f1_(%class.Int* 1, )
}

; Class: A, Method: f1
define %class.Int @_CN1AFN2f1_(%class.Int %x) {

entry:
  %4 = load i32*, i32** x, align 8
  %5 = add nsw i32* %4, 1
  store i32* %5, i32** x, align 8
  %6 = getelementptr inbounds %class.Int, %class.Int* %this,null
  call void @_CN1xFN3set_(%class.Int* %6, i32* %5)
}

; Class: Object, Method: abort
define %class.Object @_CN6ObjectFN5abort_() {

entry:
}

; Class: Object, Method: type_name
define %class.String @_CN6ObjectFN9type_name_() {

entry:
}

; Class: Object, Method: copy
define %class.Object @_CN6ObjectFN4copy_() {

entry:
}

; Class: IO, Method: out_string
define %class.IO @_CN2IOFN10out_string_(%class.String %x) {

entry:
}

; Class: IO, Method: out_int
define %class.IO @_CN2IOFN7out_int_(%class.Int %x) {

entry:
}

; Class: IO, Method: in_string
define %class.String @_CN2IOFN9in_string_() {

entry:
}

; Class: IO, Method: in_int
define %class.Int @_CN2IOFN6in_int_() {

entry:
}

; Class: String, Method: length
define %class.Int @_CN6StringFN6length_() {

entry:
}

; Class: String, Method: concat
define %class.String @_CN6StringFN6concat_(%class.String %s) {

entry:
}

; Class: String, Method: substr
define %class.String @_CN6StringFN6substr_(%class.Int %i, %class.Int %l) {

entry:
}
