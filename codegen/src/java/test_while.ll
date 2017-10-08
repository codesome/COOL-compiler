; I am a comment in LLVM-IR. Feel free to remove me.
@.str.0 = private unnamed_addr constant [1 x i8] c"\00", align 1

%class.Object = type {}
%class.Main = type { %class.Object, %class.Bool, %class.Int, %class.Object }
%class.IO = type { %class.Object }
%class.Int = type { %class.Object, i32 }
%class.String = type { %class.Object, i8* }
%class.Bool = type { %class.Object, i8 }


define void @_CN6ObjectFN6Object_(%class.Object* %this) {

entry:
  ret void
}

define void @_CN4MainFN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  call void @_CN4BoolFN4Bool_(%class.Bool* %1)
  %2 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  call void @_CN3IntFN3Int_(%class.Int* %2)
  %3 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  br label while.cond.1

while.cond.1:
  %4 = load i8, i8* b, align 4
  %5 = trunc i8 %4 to i1
  br i1 %5, label while.body.1, label while.end.1

while.body.1:
  %6 = load i32, i32* c, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* c, align 4
  br label while.cond.1

while.end.1:
  %8 = load %class.Object*, %class.Object** undef, align 8
  store %class.Object* %8, %class.Object** %3, align 8
  ret void
}

define void @_CN2IOFN2IO_(%class.IO* %this) {

entry:
  %0 = bitcast %class.IO* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  ret void
}

define void @_CN3IntFN3Int_(%class.Int* %this) {

entry:
  %0 = bitcast i32 %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Int, %class.Int* %this, i32 0, i32 1
  store i32 0, i32* %1, align 4
  ret void
}

define void @_CN6StringFN6String_(%class.String* %this) {

entry:
  %0 = bitcast %class.String* %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.String, %class.String* %this, i32 0, i32 1
  %2 = getelementptr inbounds [1 x i8], [1 x i8]* @.str.0, i32 0, i32 0
  store i8* %2, i8** %1, align 8
  ret void
}

define void @_CN4BoolFN4Bool_(%class.Bool* %this) {

entry:
  %0 = bitcast i8 %this to %class.Object*
  call void @_CN6ObjectFN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1
  store i8 0, i8* %1, align 4
  ret void
}

define void @_CN6StringFN3set_(%class.String* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds %class.String, %class.String* %this, i32 0, i32 1
  store i8* %s, i8** %0, align 8
  ret void
}

define void @_CN3IntFN3set_(%class.Int* %this, i32 %s) {
entry:
  %0 = getelementptr inbounds %class.Int, %class.Int* %this, i32 0, i32 1
  store i32 %s, i32* %0, align 4
  ret void
}

define void @_CN4BoolFN3set_(%class.Bool* %this, i8 %s) {
entry:
  %0 = getelementptr inbounds %class.Bool, %class.Bool* %this, i32 0, i32 1
  store i8 %s, i8* %0, align 4
  ret void
}
