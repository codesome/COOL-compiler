; I am a comment in LLVM-IR. Feel free to remove me.
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
  br label while.cond

while.cond:
  %4 = getelementptr inbounds %class.Bool, %class.Bool* %this,null
  %5 = call i8 _CN4BoolFN3get_(%4)
  %6 = trunc i8 %5 to i1
  br i1 %6, label while.body, label while.end

while.body:
  br label while.cond.1

while.cond.1:
  %7 = getelementptr inbounds %class.Bool, %class.Bool* %this,null
  %8 = call i8 _CN4BoolFN3get_(%7)
  %9 = trunc i8 %8 to i1
  br i1 %9, label while.body.1, label while.end.1

while.body.1:
  %10 = getelementptr inbounds %class.Int, %class.Int* %this,null
  %11 = call i32 _CN3IntFN3get_(%10)
  %12 = add nsw i32 %11, 1
  %13 = getelementptr inbounds %class.Int, %class.Int* %this,null
  call void _CN1cFN3set_(%13, %12)
  br label while.cond.1

while.end.1:
  %14 = load %class.Object, %class.Object* undef, align 4
  %15 = getelementptr inbounds %class.Int, %class.Int* %this,null
  %16 = call i32 _CN3IntFN3get_(%15)
  %17 = add nsw i32 %16, 1
  %18 = getelementptr inbounds %class.Int, %class.Int* %this,null
  call void _CN1cFN3set_(%18, %17)
  br label while.cond

while.end:
  %19 = load %class.Object, %class.Object* undef, align 4
  store %class.Object %19, %class.Object* %3, align 4
  %20 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %21 = call i8* _CN1AFN1A_()
  %22 = bitcast i8* %21 to %class.A*
  store %class.A undef, %class.A* %20, align 4
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
