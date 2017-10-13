@.str.0 = private unnamed_addr constant [1 x i8] c"\00", align 1

%class.Object = type {}
%class.Main = type { %class.Object, i8, i32, %class.Object*, %class.A* }
%class.A = type { %class.Object, i32, i8, i8* }
%class.IO = type { %class.Object }


; Class: Main, Method: main
define i32 @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %1 = load %class.A*, %class.A** %0, align 8
  %2 = call i32 @_CN1A_FN2f1_(%class.A* %1, i32 1)
  ret i32 %2
}

; Class: A, Method: f1
define i32 @_CN1A_FN2f1_(%class.A* %this, i32 %x) {

entry:
  %x.addr = alloca i32, align 8
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32, i32* %x.addr, align 4
  %1 = add nsw i32 %0, 1
  store i32 %1, i32* %x.addr, align 4
  ret i32 %1
}

; Constructor of class 'Object'
define void @_CN6Object_FN6Object_(%class.Object* %this) {

entry:
  ret void
}

; Constructor of class 'Main'
define void @_CN4Main_FN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  store i8 0, i8* %1, align 4
  %2 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  br label %while.cond

while.cond:
  %4 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %5 = load i8, i8* %4, align 4
  %6 = trunc i8 %5 to i1
  br i1 %6, label %while.body, label %while.end

while.body:
  %7 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %8 = load i32, i32* %7, align 4
  %9 = add nsw i32 %8, 1
  %10 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  store i32 %9, i32* %10, align 4
  br label %while.cond

while.end:
  store %class.Object* null, %class.Object** %3, align 4
  %11 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %12 = call noalias i8* @malloc(i64 13)
  %13 = bitcast i8* %12 to %class.A*
  call void @_CN1A_FN1A_(%class.A* %13)
  store %class.A* %13, %class.A** %11, align 4
  ret void
}

; Constructor of class 'A'
define void @_CN1A_FN1A_(%class.A* %this) {

entry:
  %0 = bitcast %class.A* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 1
  store i32 0, i32* %1, align 4
  %2 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 2
  store i8 0, i8* %2, align 4
  %3 = getelementptr inbounds %class.A, %class.A* %this, i32 0, i32 3
  %4 = getelementptr inbounds [1 x i8], [1 x i8]* @.str.0, i32 0, i32 0
  store i8* %4, i8** %3, align 8
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
