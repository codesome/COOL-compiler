@.str.0 = private unnamed_addr constant [1 x i8] c"\00", align 1

%class.Object = type {}
%class.A = type { %class.Object, %class.A* }
%class.Main = type { %class.Object, %class.A* }
%class.IO = type { %class.Object }


; Class: Main, Method: main
define i32 @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  ret i32 0
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
  %2 = call noalias i8* @malloc(i64 8)
  %3 = bitcast i8* %2 to %class.A*
  call void @_CN1A_FN1A_(%class.A* %3)
  store %class.A* %3, %class.A** %1, align 4
  ret void
}

; Constructor of class 'Main'
define void @_CN4Main_FN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  store %class.A* null, %class.A** %1, align 4
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
  %main = alloca %class.Main, align 8
  call void @_CN4Main_FN4Main_(%class.Main* %main)
  %retval = call i32 @_CN4Main_FN4main_(%class.Main* %main)
  ret i32 %retval
}
