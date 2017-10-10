; I am a comment in LLVM-IR. Feel free to remove me.
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
  call void _CN3IntFN3set_(%class.Int* %1, i32 100)
  %2 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 2
  br label while.cond.1

while.cond.1:
  %3 = load i8, i8* b, align 4
  %4 = trunc i8 %3 to i1
  br i1 %4, label while.body.1, label while.end.1

while.body.1:
  %5 = load i32, i32* e, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* e, align 4
  br label while.cond.1

while.end.1:
  %7 = load %class.Object*, %class.Object** undef, align 8
  store %class.Object* %7, %class.Object** %2, align 8
  %8 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 3
  call void _CN4BoolFN3set_(%class.Bool* %8, i8 1)
  ret void
}

; Constructor of class 'B'
define void @_CN1BFN1B_(%class.B* %this) {

entry:
  %0 = bitcast %class.B* %this to %class.A*
  call void @_CN1AFN1A_(%class.A* %0)
  %1 = getelementptr inbounds %class.B, %class.B* %this, i32 0, i32 1
  %2 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.0, i32 0, i32 0
  call void _CN6StringFN3set_(%class.String* %1, i8* %2)
  %3 = getelementptr inbounds %class.B, %class.B* %this, i32 0, i32 2
  store %class.A* undef, %class.A** %3, align 8
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
  %4 = call i8* _CN1AFN1A_()
  %5 = bitcast i8* %4 to %class.A*
  store %class.A* undef, %class.A** %3, align 8
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
  %0 = bitcast i32 %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Int, %class.Int* %this, i32 0, i32 1
  store i32 0, i32* %1, align 4
  ret void
}

; Constructor of class 'String'
define void @_CN6StringFN6String_(%class.String* %this) {

entry:
  %0 = bitcast %class.String* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.String, %class.String* %this, i32 0, i32 1
  %2 = getelementptr inbounds [1 x i8], [1 x i8]* @.str.1, i32 0, i32 0
  store i8* %2, i8** %1, align 8
  ret void
}

; Constructor of class 'Bool'
define void @_CN4BoolFN4Bool_(%class.Bool* %this) {

entry:
  %0 = bitcast i8 %this to %class.Object*
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
  store i32 %s, i32* %0, align 4
  ret void
}

; Class: Int, Method: get
define i32 @_CN3IntFN3get_(%class.Int* %this) {
entry:
  %0 = getelementptr inbounds %class.Int, %class.Int* %this, i32 0, i32 1
  %1 = load i32, i32* %0, align 4
  ret i32 %1
}

; Class: Bool, Method: set
define void @_CN4BoolFN3set_(%class.Bool* %this, i8 %s) {
entry:
  %0 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1
  store i8 %s, i8* %0, align 4
  ret void
}

; Class: Bool, Method: get
define i8 @_CN4BoolFN3get_(%class.Bool* %this) {
entry:
  %0 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1
  %1 = load i8, i8* %0, align 4
  ret i8 %1
}
