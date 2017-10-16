; ModuleID = '../test_cases/full_test.cl'
source_filename = "../test_cases/full_test.cl"

@.str.34 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"
Sum : \00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"n = \00", align 1
@.str.39 = private unnamed_addr constant [35 x i8] c"
Divide by 0 exception at line no \00", align 1
@.str.26 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.38 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"
Quotient : \00", align 1
@.str.15 = private unnamed_addr constant [20 x i8] c"Bool value is true
\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Operands are : \00", align 1
@.str.8 = private unnamed_addr constant [31 x i8] c"
Comparing these operands now
\00", align 1
@.str.13 = private unnamed_addr constant [16 x i8] c"Both are equal
\00", align 1
@.str.14 = private unnamed_addr constant [20 x i8] c"Both are not equal
\00", align 1
@.str.20 = private unnamed_addr constant [58 x i8] c"Testing if-else by finding the smallest of three numbers
\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"
Difference : \00", align 1
@.str.10 = private unnamed_addr constant [26 x i8] c"First is lesser or equal
\00", align 1
@.str.22 = private unnamed_addr constant [31 x i8] c"
The smallest among them is : \00", align 1
@.str.32 = private unnamed_addr constant [16 x i8] c"SimpleExprTests\00", align 1
@.str.0 = private unnamed_addr constant [38 x i8] c"Testing binary arithmetic operations
\00", align 1
@.str.18 = private unnamed_addr constant [26 x i8] c"It's complement is false
\00", align 1
@.str.16 = private unnamed_addr constant [21 x i8] c"Bool value is false
\00", align 1
@.str.17 = private unnamed_addr constant [25 x i8] c"It's complement is true
\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"
Product : \00", align 1
@.str.28 = private unnamed_addr constant [24 x i8] c"Value returned is void
\00", align 1
@.str.11 = private unnamed_addr constant [27 x i8] c"First is greater or equal
\00", align 1
@.str.37 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.24 = private unnamed_addr constant [41 x i8] c"Loop Test 1 : Print numbers from 1 to n
\00", align 1
@.str.21 = private unnamed_addr constant [20 x i8] c"The numbers are : 
\00", align 1
@.str.30 = private unnamed_addr constant [70 x i8] c"Loop Test 2 : Print a right angled triangle using * given the size n
\00", align 1
@.str.12 = private unnamed_addr constant [18 x i8] c"First is greater
\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"
Negation of first : \00", align 1
@.str.31 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str.40 = private unnamed_addr constant [30 x i8] c"
Dispatch to void at line no \00", align 1
@.str.27 = private unnamed_addr constant [34 x i8] c"
Checking value returned by loop
\00", align 1
@.str.35 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.19 = private unnamed_addr constant [11 x i8] c"Completed
\00", align 1
@.str.29 = private unnamed_addr constant [28 x i8] c"Value returned is not void
\00", align 1
@.str.9 = private unnamed_addr constant [13 x i8] c"Less than : \00", align 1
@.str.23 = private unnamed_addr constant [12 x i8] c"
Completed
\00", align 1
@.str.33 = private unnamed_addr constant [5 x i8] c"Main\00", align 1
@.str.36 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1

%class.Object = type {}
%class.Main = type { %class.Object, %class.SimpleExprTests* }
%class.IO = type { %class.Object }
%class.SimpleExprTests = type { %class.IO, i32, i8, %class.Object*, i32, %class.Object* }


; Class: SimpleExprTests, Method: binOpTest
define i32 @_CN15SimpleExprTests_FN9binOpTest_(%class.SimpleExprTests* %this, i32 %x, i32 %y) {

entry:
  %x.addr = alloca i32, align 8
  store i32 %x, i32* %x.addr, align 4
  %y.addr = alloca i32, align 8
  store i32 %y, i32* %y.addr, align 4
  %0 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %0, label %if.then, label %if.else

if.then:
  call void @print_dispatch_on_void_error(i32 10)
  %1 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end

if.else:
  br label %if.end

if.end:
  %2 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %3 = getelementptr inbounds [38 x i8], [38 x i8]* @.str.0, i32 0, i32 0
  %4 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %2, i8* %3)
  %5 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %5, label %if.then.1, label %if.else.1

if.then.1:
  call void @print_dispatch_on_void_error(i32 11)
  %6 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.1

if.else.1:
  br label %if.end.1

if.end.1:
  %7 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %8 = getelementptr inbounds [16 x i8], [16 x i8]* @.str.1, i32 0, i32 0
  %9 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %7, i8* %8)
  %10 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %10, label %if.then.2, label %if.else.2

if.then.2:
  call void @print_dispatch_on_void_error(i32 12)
  %11 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.2

if.else.2:
  br label %if.end.2

if.end.2:
  %12 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %13 = load i32, i32* %x.addr, align 4
  %14 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %12, i32 %13)
  %15 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %15, label %if.then.3, label %if.else.3

if.then.3:
  call void @print_dispatch_on_void_error(i32 13)
  %16 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.3

if.else.3:
  br label %if.end.3

if.end.3:
  %17 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %18 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  %19 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %17, i8* %18)
  %20 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %20, label %if.then.4, label %if.else.4

if.then.4:
  call void @print_dispatch_on_void_error(i32 14)
  %21 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.4

if.else.4:
  br label %if.end.4

if.end.4:
  %22 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %23 = load i32, i32* %y.addr, align 4
  %24 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %22, i32 %23)
  %25 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %25, label %if.then.5, label %if.else.5

if.then.5:
  call void @print_dispatch_on_void_error(i32 15)
  %26 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.5

if.else.5:
  br label %if.end.5

if.end.5:
  %27 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %28 = getelementptr inbounds [8 x i8], [8 x i8]* @.str.3, i32 0, i32 0
  %29 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %27, i8* %28)
  %30 = load i32, i32* %x.addr, align 4
  %31 = load i32, i32* %y.addr, align 4
  %32 = add nsw i32 %30, %31
  %33 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  store i32 %32, i32* %33, align 4
  %34 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %34, label %if.then.6, label %if.else.6

if.then.6:
  call void @print_dispatch_on_void_error(i32 17)
  %35 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.6

if.else.6:
  br label %if.end.6

if.end.6:
  %36 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %37 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  %38 = load i32, i32* %37, align 4
  %39 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %36, i32 %38)
  %40 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %40, label %if.then.7, label %if.else.7

if.then.7:
  call void @print_dispatch_on_void_error(i32 18)
  %41 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.7

if.else.7:
  br label %if.end.7

if.end.7:
  %42 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %43 = getelementptr inbounds [15 x i8], [15 x i8]* @.str.4, i32 0, i32 0
  %44 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %42, i8* %43)
  %45 = load i32, i32* %x.addr, align 4
  %46 = load i32, i32* %y.addr, align 4
  %47 = sub nsw i32 %45, %46
  %48 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  store i32 %47, i32* %48, align 4
  %49 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %49, label %if.then.8, label %if.else.8

if.then.8:
  call void @print_dispatch_on_void_error(i32 20)
  %50 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.8

if.else.8:
  br label %if.end.8

if.end.8:
  %51 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %52 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  %53 = load i32, i32* %52, align 4
  %54 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %51, i32 %53)
  %55 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %55, label %if.then.9, label %if.else.9

if.then.9:
  call void @print_dispatch_on_void_error(i32 21)
  %56 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.9

if.else.9:
  br label %if.end.9

if.end.9:
  %57 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %58 = getelementptr inbounds [12 x i8], [12 x i8]* @.str.5, i32 0, i32 0
  %59 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %57, i8* %58)
  %60 = load i32, i32* %x.addr, align 4
  %61 = load i32, i32* %y.addr, align 4
  %62 = mul nsw i32 %60, %61
  %63 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  store i32 %62, i32* %63, align 4
  %64 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %64, label %if.then.10, label %if.else.10

if.then.10:
  call void @print_dispatch_on_void_error(i32 23)
  %65 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.10

if.else.10:
  br label %if.end.10

if.end.10:
  %66 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %67 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  %68 = load i32, i32* %67, align 4
  %69 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %66, i32 %68)
  %70 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %70, label %if.then.11, label %if.else.11

if.then.11:
  call void @print_dispatch_on_void_error(i32 24)
  %71 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.11

if.else.11:
  br label %if.end.11

if.end.11:
  %72 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %73 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.6, i32 0, i32 0
  %74 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %72, i8* %73)
  %75 = load i32, i32* %x.addr, align 4
  %76 = load i32, i32* %y.addr, align 4
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %if.then.12, label %if.else.12

if.then.12:
  call void @print_div_by_zero_err_msg(i32 25)
  %78 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.12

if.else.12:
  br label %if.end.12

if.end.12:
  %79 = sdiv i32 %75, %76
  %80 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  store i32 %79, i32* %80, align 4
  %81 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %81, label %if.then.13, label %if.else.13

if.then.13:
  call void @print_dispatch_on_void_error(i32 26)
  %82 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.13

if.else.13:
  br label %if.end.13

if.end.13:
  %83 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %84 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  %85 = load i32, i32* %84, align 4
  %86 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %83, i32 %85)
  %87 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %87, label %if.then.14, label %if.else.14

if.then.14:
  call void @print_dispatch_on_void_error(i32 27)
  %88 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.14

if.else.14:
  br label %if.end.14

if.end.14:
  %89 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %90 = getelementptr inbounds [22 x i8], [22 x i8]* @.str.7, i32 0, i32 0
  %91 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %89, i8* %90)
  %92 = load i32, i32* %x.addr, align 4
  %93 = sub nsw i32 0, %92
  %94 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  store i32 %93, i32* %94, align 4
  %95 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %95, label %if.then.15, label %if.else.15

if.then.15:
  call void @print_dispatch_on_void_error(i32 29)
  %96 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.15

if.else.15:
  br label %if.end.15

if.end.15:
  %97 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %98 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  %99 = load i32, i32* %98, align 4
  %100 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %97, i32 %99)
  %101 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %101, label %if.then.16, label %if.else.16

if.then.16:
  call void @print_dispatch_on_void_error(i32 30)
  %102 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.16

if.else.16:
  br label %if.end.16

if.end.16:
  %103 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %104 = getelementptr inbounds [31 x i8], [31 x i8]* @.str.8, i32 0, i32 0
  %105 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %103, i8* %104)
  %106 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %106, label %if.then.17, label %if.else.17

if.then.17:
  call void @print_dispatch_on_void_error(i32 31)
  %107 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.17

if.else.17:
  br label %if.end.17

if.end.17:
  %108 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %109 = getelementptr inbounds [13 x i8], [13 x i8]* @.str.9, i32 0, i32 0
  %110 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %108, i8* %109)
  %111 = alloca i32, align 8
  %112 = load i32, i32* %x.addr, align 4
  %113 = load i32, i32* %y.addr, align 4
  %114 = icmp slt i32 %112, %113
  %115 = zext i1 %114 to i8
  %116 = trunc i8 %115 to i1
  br i1 %116, label %if.then.18, label %if.else.18

if.then.18:
  %117 = load i32, i32* %x.addr, align 4
  store i32 %117, i32* %111, align 4
  br label %if.end.18

if.else.18:
  %118 = load i32, i32* %y.addr, align 4
  store i32 %118, i32* %111, align 4
  br label %if.end.18

if.end.18:
  %119 = load i32, i32* %111, align 4
  %120 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  store i32 %119, i32* %120, align 4
  %121 = alloca %class.IO, align 8
  %122 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  %123 = load i32, i32* %122, align 4
  %124 = load i32, i32* %x.addr, align 4
  %125 = icmp eq i32 %123, %124
  %126 = zext i1 %125 to i8
  %127 = trunc i8 %126 to i1
  br i1 %127, label %if.then.19, label %if.else.19

if.then.19:
  %128 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %128, label %if.then.20, label %if.else.20

if.then.20:
  call void @print_dispatch_on_void_error(i32 34)
  %129 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.20

if.else.20:
  br label %if.end.20

if.end.20:
  %130 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %131 = getelementptr inbounds [26 x i8], [26 x i8]* @.str.10, i32 0, i32 0
  %132 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %130, i8* %131)
  %133 = load %class.IO, %class.IO* %132, align 4
  store %class.IO %133, %class.IO* %121, align 4
  br label %if.end.19

if.else.19:
  %134 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %134, label %if.then.21, label %if.else.21

if.then.21:
  call void @print_dispatch_on_void_error(i32 35)
  %135 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.21

if.else.21:
  br label %if.end.21

if.end.21:
  %136 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %137 = getelementptr inbounds [27 x i8], [27 x i8]* @.str.11, i32 0, i32 0
  %138 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %136, i8* %137)
  %139 = load %class.IO, %class.IO* %138, align 4
  store %class.IO %139, %class.IO* %121, align 4
  br label %if.end.19

if.end.19:
  %140 = alloca %class.IO, align 8
  %141 = load i32, i32* %x.addr, align 4
  %142 = load i32, i32* %y.addr, align 4
  %143 = icmp sle i32 %141, %142
  %144 = zext i1 %143 to i8
  %145 = trunc i8 %144 to i1
  br i1 %145, label %if.then.22, label %if.else.22

if.then.22:
  %146 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %146, label %if.then.23, label %if.else.23

if.then.23:
  call void @print_dispatch_on_void_error(i32 38)
  %147 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.23

if.else.23:
  br label %if.end.23

if.end.23:
  %148 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %149 = getelementptr inbounds [26 x i8], [26 x i8]* @.str.10, i32 0, i32 0
  %150 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %148, i8* %149)
  %151 = load %class.IO, %class.IO* %150, align 4
  store %class.IO %151, %class.IO* %140, align 4
  br label %if.end.22

if.else.22:
  %152 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %152, label %if.then.24, label %if.else.24

if.then.24:
  call void @print_dispatch_on_void_error(i32 39)
  %153 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.24

if.else.24:
  br label %if.end.24

if.end.24:
  %154 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %155 = getelementptr inbounds [18 x i8], [18 x i8]* @.str.12, i32 0, i32 0
  %156 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %154, i8* %155)
  %157 = load %class.IO, %class.IO* %156, align 4
  store %class.IO %157, %class.IO* %140, align 4
  br label %if.end.22

if.end.22:
  %158 = alloca %class.IO, align 8
  %159 = load i32, i32* %x.addr, align 4
  %160 = load i32, i32* %y.addr, align 4
  %161 = icmp eq i32 %159, %160
  %162 = zext i1 %161 to i8
  %163 = trunc i8 %162 to i1
  br i1 %163, label %if.then.25, label %if.else.25

if.then.25:
  %164 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %164, label %if.then.26, label %if.else.26

if.then.26:
  call void @print_dispatch_on_void_error(i32 42)
  %165 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.26

if.else.26:
  br label %if.end.26

if.end.26:
  %166 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %167 = getelementptr inbounds [16 x i8], [16 x i8]* @.str.13, i32 0, i32 0
  %168 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %166, i8* %167)
  %169 = load %class.IO, %class.IO* %168, align 4
  store %class.IO %169, %class.IO* %158, align 4
  br label %if.end.25

if.else.25:
  %170 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %170, label %if.then.27, label %if.else.27

if.then.27:
  call void @print_dispatch_on_void_error(i32 43)
  %171 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.27

if.else.27:
  br label %if.end.27

if.end.27:
  %172 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %173 = getelementptr inbounds [20 x i8], [20 x i8]* @.str.14, i32 0, i32 0
  %174 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %172, i8* %173)
  %175 = load %class.IO, %class.IO* %174, align 4
  store %class.IO %175, %class.IO* %158, align 4
  br label %if.end.25

if.end.25:
  %176 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 2
  store i8 1, i8* %176, align 4
  %177 = alloca %class.IO, align 8
  %178 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 2
  %179 = load i8, i8* %178, align 4
  %180 = trunc i8 %179 to i1
  br i1 %180, label %if.then.28, label %if.else.28

if.then.28:
  %181 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %181, label %if.then.29, label %if.else.29

if.then.29:
  call void @print_dispatch_on_void_error(i32 47)
  %182 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.29

if.else.29:
  br label %if.end.29

if.end.29:
  %183 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %184 = getelementptr inbounds [20 x i8], [20 x i8]* @.str.15, i32 0, i32 0
  %185 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %183, i8* %184)
  %186 = load %class.IO, %class.IO* %185, align 4
  store %class.IO %186, %class.IO* %177, align 4
  br label %if.end.28

if.else.28:
  %187 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %187, label %if.then.30, label %if.else.30

if.then.30:
  call void @print_dispatch_on_void_error(i32 48)
  %188 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.30

if.else.30:
  br label %if.end.30

if.end.30:
  %189 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %190 = getelementptr inbounds [21 x i8], [21 x i8]* @.str.16, i32 0, i32 0
  %191 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %189, i8* %190)
  %192 = load %class.IO, %class.IO* %191, align 4
  store %class.IO %192, %class.IO* %177, align 4
  br label %if.end.28

if.end.28:
  %193 = alloca %class.IO, align 8
  %194 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 2
  %195 = load i8, i8* %194, align 4
  %196 = xor i8 %195, 1
  %197 = trunc i8 %196 to i1
  br i1 %197, label %if.then.31, label %if.else.31

if.then.31:
  %198 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %198, label %if.then.32, label %if.else.32

if.then.32:
  call void @print_dispatch_on_void_error(i32 51)
  %199 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.32

if.else.32:
  br label %if.end.32

if.end.32:
  %200 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %201 = getelementptr inbounds [25 x i8], [25 x i8]* @.str.17, i32 0, i32 0
  %202 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %200, i8* %201)
  %203 = load %class.IO, %class.IO* %202, align 4
  store %class.IO %203, %class.IO* %193, align 4
  br label %if.end.31

if.else.31:
  %204 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %204, label %if.then.33, label %if.else.33

if.then.33:
  call void @print_dispatch_on_void_error(i32 52)
  %205 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.33

if.else.33:
  br label %if.end.33

if.end.33:
  %206 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %207 = getelementptr inbounds [26 x i8], [26 x i8]* @.str.18, i32 0, i32 0
  %208 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %206, i8* %207)
  %209 = load %class.IO, %class.IO* %208, align 4
  store %class.IO %209, %class.IO* %193, align 4
  br label %if.end.31

if.end.31:
  %210 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %210, label %if.then.34, label %if.else.34

if.then.34:
  call void @print_dispatch_on_void_error(i32 54)
  %211 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.34

if.else.34:
  br label %if.end.34

if.end.34:
  %212 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %213 = getelementptr inbounds [11 x i8], [11 x i8]* @.str.19, i32 0, i32 0
  %214 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %212, i8* %213)
  ret i32 0
}

; Class: SimpleExprTests, Method: ifElseTest
define i32 @_CN15SimpleExprTests_FN10ifElseTest_(%class.SimpleExprTests* %this, i32 %x, i32 %y, i32 %z) {

entry:
  %x.addr = alloca i32, align 8
  store i32 %x, i32* %x.addr, align 4
  %y.addr = alloca i32, align 8
  store i32 %y, i32* %y.addr, align 4
  %z.addr = alloca i32, align 8
  store i32 %z, i32* %z.addr, align 4
  %0 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %0, label %if.then.35, label %if.else.35

if.then.35:
  call void @print_dispatch_on_void_error(i32 61)
  %1 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.35

if.else.35:
  br label %if.end.35

if.end.35:
  %2 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %3 = getelementptr inbounds [58 x i8], [58 x i8]* @.str.20, i32 0, i32 0
  %4 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %2, i8* %3)
  %5 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %5, label %if.then.36, label %if.else.36

if.then.36:
  call void @print_dispatch_on_void_error(i32 62)
  %6 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.36

if.else.36:
  br label %if.end.36

if.end.36:
  %7 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %8 = getelementptr inbounds [20 x i8], [20 x i8]* @.str.21, i32 0, i32 0
  %9 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %7, i8* %8)
  %10 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %10, label %if.then.37, label %if.else.37

if.then.37:
  call void @print_dispatch_on_void_error(i32 63)
  %11 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.37

if.else.37:
  br label %if.end.37

if.end.37:
  %12 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %13 = load i32, i32* %x.addr, align 4
  %14 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %12, i32 %13)
  %15 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %15, label %if.then.38, label %if.else.38

if.then.38:
  call void @print_dispatch_on_void_error(i32 64)
  %16 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.38

if.else.38:
  br label %if.end.38

if.end.38:
  %17 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %18 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  %19 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %17, i8* %18)
  %20 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %20, label %if.then.39, label %if.else.39

if.then.39:
  call void @print_dispatch_on_void_error(i32 65)
  %21 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.39

if.else.39:
  br label %if.end.39

if.end.39:
  %22 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %23 = load i32, i32* %y.addr, align 4
  %24 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %22, i32 %23)
  %25 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %25, label %if.then.40, label %if.else.40

if.then.40:
  call void @print_dispatch_on_void_error(i32 66)
  %26 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.40

if.else.40:
  br label %if.end.40

if.end.40:
  %27 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %28 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  %29 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %27, i8* %28)
  %30 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %30, label %if.then.41, label %if.else.41

if.then.41:
  call void @print_dispatch_on_void_error(i32 67)
  %31 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.41

if.else.41:
  br label %if.end.41

if.end.41:
  %32 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %33 = load i32, i32* %z.addr, align 4
  %34 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %32, i32 %33)
  %35 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %35, label %if.then.42, label %if.else.42

if.then.42:
  call void @print_dispatch_on_void_error(i32 68)
  %36 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.42

if.else.42:
  br label %if.end.42

if.end.42:
  %37 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %38 = getelementptr inbounds [31 x i8], [31 x i8]* @.str.22, i32 0, i32 0
  %39 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %37, i8* %38)
  %40 = alloca i32, align 8
  %41 = load i32, i32* %x.addr, align 4
  %42 = load i32, i32* %y.addr, align 4
  %43 = icmp sle i32 %41, %42
  %44 = zext i1 %43 to i8
  %45 = trunc i8 %44 to i1
  br i1 %45, label %if.then.43, label %if.else.43

if.then.43:
  %46 = alloca i32, align 8
  %47 = load i32, i32* %x.addr, align 4
  %48 = load i32, i32* %z.addr, align 4
  %49 = icmp sle i32 %47, %48
  %50 = zext i1 %49 to i8
  %51 = trunc i8 %50 to i1
  br i1 %51, label %if.then.44, label %if.else.44

if.then.44:
  %52 = load i32, i32* %x.addr, align 4
  store i32 %52, i32* %46, align 4
  br label %if.end.44

if.else.44:
  %53 = load i32, i32* %z.addr, align 4
  store i32 %53, i32* %46, align 4
  br label %if.end.44

if.end.44:
  %54 = load i32, i32* %46, align 4
  store i32 %54, i32* %40, align 4
  br label %if.end.43

if.else.43:
  %55 = alloca i32, align 8
  %56 = load i32, i32* %y.addr, align 4
  %57 = load i32, i32* %z.addr, align 4
  %58 = icmp sle i32 %56, %57
  %59 = zext i1 %58 to i8
  %60 = trunc i8 %59 to i1
  br i1 %60, label %if.then.45, label %if.else.45

if.then.45:
  %61 = load i32, i32* %y.addr, align 4
  store i32 %61, i32* %55, align 4
  br label %if.end.45

if.else.45:
  %62 = load i32, i32* %z.addr, align 4
  store i32 %62, i32* %55, align 4
  br label %if.end.45

if.end.45:
  %63 = load i32, i32* %55, align 4
  store i32 %63, i32* %40, align 4
  br label %if.end.43

if.end.43:
  %64 = load i32, i32* %40, align 4
  %65 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  store i32 %64, i32* %65, align 4
  %66 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %66, label %if.then.46, label %if.else.46

if.then.46:
  call void @print_dispatch_on_void_error(i32 76)
  %67 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.46

if.else.46:
  br label %if.end.46

if.end.46:
  %68 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %69 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  %70 = load i32, i32* %69, align 4
  %71 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %68, i32 %70)
  %72 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %72, label %if.then.47, label %if.else.47

if.then.47:
  call void @print_dispatch_on_void_error(i32 77)
  %73 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.47

if.else.47:
  br label %if.end.47

if.end.47:
  %74 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %75 = getelementptr inbounds [12 x i8], [12 x i8]* @.str.23, i32 0, i32 0
  %76 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %74, i8* %75)
  ret i32 0
}

; Class: SimpleExprTests, Method: loopTest1
define i32 @_CN15SimpleExprTests_FN9loopTest1_(%class.SimpleExprTests* %this, i32 %x) {

entry:
  %x.addr = alloca i32, align 8
  store i32 %x, i32* %x.addr, align 4
  %0 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %0, label %if.then.48, label %if.else.48

if.then.48:
  call void @print_dispatch_on_void_error(i32 84)
  %1 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.48

if.else.48:
  br label %if.end.48

if.end.48:
  %2 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %3 = getelementptr inbounds [41 x i8], [41 x i8]* @.str.24, i32 0, i32 0
  %4 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %2, i8* %3)
  %5 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %5, label %if.then.49, label %if.else.49

if.then.49:
  call void @print_dispatch_on_void_error(i32 85)
  %6 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.49

if.else.49:
  br label %if.end.49

if.end.49:
  %7 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %8 = getelementptr inbounds [5 x i8], [5 x i8]* @.str.25, i32 0, i32 0
  %9 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %7, i8* %8)
  %10 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %10, label %if.then.50, label %if.else.50

if.then.50:
  call void @print_dispatch_on_void_error(i32 86)
  %11 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.50

if.else.50:
  br label %if.end.50

if.end.50:
  %12 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %13 = load i32, i32* %x.addr, align 4
  %14 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %12, i32 %13)
  %15 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %15, label %if.then.51, label %if.else.51

if.then.51:
  call void @print_dispatch_on_void_error(i32 87)
  %16 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.51

if.else.51:
  br label %if.end.51

if.end.51:
  %17 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %18 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.26, i32 0, i32 0
  %19 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %17, i8* %18)
  %20 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  store i32 1, i32* %20, align 4
  br label %while.cond

while.cond:
  %21 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  %22 = load i32, i32* %21, align 4
  %23 = load i32, i32* %x.addr, align 4
  %24 = icmp sle i32 %22, %23
  %25 = zext i1 %24 to i8
  %26 = trunc i8 %25 to i1
  br i1 %26, label %while.body, label %while.end

while.body:
  %27 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %27, label %if.then.52, label %if.else.52

if.then.52:
  call void @print_dispatch_on_void_error(i32 90)
  %28 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.52

if.else.52:
  br label %if.end.52

if.end.52:
  %29 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %30 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  %31 = load i32, i32* %30, align 4
  %32 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %29, i32 %31)
  %33 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %33, label %if.then.53, label %if.else.53

if.then.53:
  call void @print_dispatch_on_void_error(i32 91)
  %34 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.53

if.else.53:
  br label %if.end.53

if.end.53:
  %35 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %36 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  %37 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %35, i8* %36)
  %38 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  %39 = load i32, i32* %38, align 4
  %40 = add nsw i32 %39, 1
  %41 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  store i32 %40, i32* %41, align 4
  br label %while.cond

while.end:
  %42 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 3
  store %class.Object* null, %class.Object** %42, align 8
  %43 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %43, label %if.then.54, label %if.else.54

if.then.54:
  call void @print_dispatch_on_void_error(i32 94)
  %44 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.54

if.else.54:
  br label %if.end.54

if.end.54:
  %45 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %46 = getelementptr inbounds [34 x i8], [34 x i8]* @.str.27, i32 0, i32 0
  %47 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %45, i8* %46)
  %48 = alloca %class.IO, align 8
  %49 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 3
  %50 = load %class.Object*, %class.Object** %49, align 8
  %51 = icmp eq %class.Object* %50, null
  %52 = zext i1 %51 to i8
  %53 = trunc i8 %52 to i1
  br i1 %53, label %if.then.55, label %if.else.55

if.then.55:
  %54 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %54, label %if.then.56, label %if.else.56

if.then.56:
  call void @print_dispatch_on_void_error(i32 96)
  %55 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.56

if.else.56:
  br label %if.end.56

if.end.56:
  %56 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %57 = getelementptr inbounds [24 x i8], [24 x i8]* @.str.28, i32 0, i32 0
  %58 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %56, i8* %57)
  %59 = load %class.IO, %class.IO* %58, align 4
  store %class.IO %59, %class.IO* %48, align 4
  br label %if.end.55

if.else.55:
  %60 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %60, label %if.then.57, label %if.else.57

if.then.57:
  call void @print_dispatch_on_void_error(i32 99)
  %61 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.57

if.else.57:
  br label %if.end.57

if.end.57:
  %62 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %63 = getelementptr inbounds [28 x i8], [28 x i8]* @.str.29, i32 0, i32 0
  %64 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %62, i8* %63)
  %65 = load %class.IO, %class.IO* %64, align 4
  store %class.IO %65, %class.IO* %48, align 4
  br label %if.end.55

if.end.55:
  %66 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  %67 = load i32, i32* %66, align 4
  %68 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %68, label %if.then.58, label %if.else.58

if.then.58:
  call void @print_dispatch_on_void_error(i32 103)
  %69 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.58

if.else.58:
  br label %if.end.58

if.end.58:
  %70 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %71 = getelementptr inbounds [11 x i8], [11 x i8]* @.str.19, i32 0, i32 0
  %72 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %70, i8* %71)
  ret i32 0
}

; Class: SimpleExprTests, Method: loopTest2
define i32 @_CN15SimpleExprTests_FN9loopTest2_(%class.SimpleExprTests* %this, i32 %x) {

entry:
  %x.addr = alloca i32, align 8
  store i32 %x, i32* %x.addr, align 4
  %0 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %0, label %if.then.59, label %if.else.59

if.then.59:
  call void @print_dispatch_on_void_error(i32 110)
  %1 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.59

if.else.59:
  br label %if.end.59

if.end.59:
  %2 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %3 = getelementptr inbounds [70 x i8], [70 x i8]* @.str.30, i32 0, i32 0
  %4 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %2, i8* %3)
  %5 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %5, label %if.then.60, label %if.else.60

if.then.60:
  call void @print_dispatch_on_void_error(i32 111)
  %6 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.60

if.else.60:
  br label %if.end.60

if.end.60:
  %7 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %8 = getelementptr inbounds [5 x i8], [5 x i8]* @.str.25, i32 0, i32 0
  %9 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %7, i8* %8)
  %10 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %10, label %if.then.61, label %if.else.61

if.then.61:
  call void @print_dispatch_on_void_error(i32 112)
  %11 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.61

if.else.61:
  br label %if.end.61

if.end.61:
  %12 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %13 = load i32, i32* %x.addr, align 4
  %14 = call %class.IO* @_CN2IO_FN7out_int_(%class.IO* %12, i32 %13)
  %15 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %15, label %if.then.62, label %if.else.62

if.then.62:
  call void @print_dispatch_on_void_error(i32 113)
  %16 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.62

if.else.62:
  br label %if.end.62

if.end.62:
  %17 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %18 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.26, i32 0, i32 0
  %19 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %17, i8* %18)
  %20 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  store i32 0, i32* %20, align 4
  br label %while.cond.1

while.cond.1:
  %21 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  %22 = load i32, i32* %21, align 4
  %23 = load i32, i32* %x.addr, align 4
  %24 = icmp slt i32 %22, %23
  %25 = zext i1 %24 to i8
  %26 = trunc i8 %25 to i1
  br i1 %26, label %while.body.1, label %while.end.1

while.body.1:
  %27 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 4
  store i32 0, i32* %27, align 4
  br label %while.cond.2

while.cond.2:
  %28 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 4
  %29 = load i32, i32* %28, align 4
  %30 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  %31 = load i32, i32* %30, align 4
  %32 = icmp sle i32 %29, %31
  %33 = zext i1 %32 to i8
  %34 = trunc i8 %33 to i1
  br i1 %34, label %while.body.2, label %while.end.2

while.body.2:
  %35 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %35, label %if.then.63, label %if.else.63

if.then.63:
  call void @print_dispatch_on_void_error(i32 118)
  %36 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.63

if.else.63:
  br label %if.end.63

if.end.63:
  %37 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %38 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.31, i32 0, i32 0
  %39 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %37, i8* %38)
  %40 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 4
  %41 = load i32, i32* %40, align 4
  %42 = add nsw i32 %41, 1
  %43 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 4
  store i32 %42, i32* %43, align 4
  br label %while.cond.2

while.end.2:
  %44 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %44, label %if.then.64, label %if.else.64

if.then.64:
  call void @print_dispatch_on_void_error(i32 122)
  %45 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.64

if.else.64:
  br label %if.end.64

if.end.64:
  %46 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %47 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.26, i32 0, i32 0
  %48 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %46, i8* %47)
  %49 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  %50 = load i32, i32* %49, align 4
  %51 = add nsw i32 %50, 1
  %52 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  store i32 %51, i32* %52, align 4
  br label %while.cond.1

while.end.1:
  %53 = icmp eq %class.SimpleExprTests* %this, null
  br i1 %53, label %if.then.65, label %if.else.65

if.then.65:
  call void @print_dispatch_on_void_error(i32 126)
  %54 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.65

if.else.65:
  br label %if.end.65

if.end.65:
  %55 = bitcast %class.SimpleExprTests* %this to %class.IO*
  %56 = getelementptr inbounds [11 x i8], [11 x i8]* @.str.19, i32 0, i32 0
  %57 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %55, i8* %56)
  ret i32 0
}

; Class: Main, Method: main
define i32 @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %1 = load %class.SimpleExprTests*, %class.SimpleExprTests** %0, align 8
  %2 = icmp eq %class.SimpleExprTests* %1, null
  br i1 %2, label %if.then.66, label %if.else.66

if.then.66:
  call void @print_dispatch_on_void_error(i32 136)
  %3 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.66

if.else.66:
  br label %if.end.66

if.end.66:
  %4 = call i32 @_CN15SimpleExprTests_FN9binOpTest_(%class.SimpleExprTests* %1, i32 3, i32 4)
  %5 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %6 = load %class.SimpleExprTests*, %class.SimpleExprTests** %5, align 8
  %7 = icmp eq %class.SimpleExprTests* %6, null
  br i1 %7, label %if.then.67, label %if.else.67

if.then.67:
  call void @print_dispatch_on_void_error(i32 137)
  %8 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.67

if.else.67:
  br label %if.end.67

if.end.67:
  %9 = call i32 @_CN15SimpleExprTests_FN9binOpTest_(%class.SimpleExprTests* %6, i32 2, i32 2)
  %10 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %11 = load %class.SimpleExprTests*, %class.SimpleExprTests** %10, align 8
  %12 = icmp eq %class.SimpleExprTests* %11, null
  br i1 %12, label %if.then.68, label %if.else.68

if.then.68:
  call void @print_dispatch_on_void_error(i32 138)
  %13 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.68

if.else.68:
  br label %if.end.68

if.end.68:
  %14 = call i32 @_CN15SimpleExprTests_FN10ifElseTest_(%class.SimpleExprTests* %11, i32 6, i32 3, i32 8)
  %15 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %16 = load %class.SimpleExprTests*, %class.SimpleExprTests** %15, align 8
  %17 = icmp eq %class.SimpleExprTests* %16, null
  br i1 %17, label %if.then.69, label %if.else.69

if.then.69:
  call void @print_dispatch_on_void_error(i32 139)
  %18 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.69

if.else.69:
  br label %if.end.69

if.end.69:
  %19 = call i32 @_CN15SimpleExprTests_FN9loopTest1_(%class.SimpleExprTests* %16, i32 10)
  %20 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %21 = load %class.SimpleExprTests*, %class.SimpleExprTests** %20, align 8
  %22 = icmp eq %class.SimpleExprTests* %21, null
  br i1 %22, label %if.then.70, label %if.else.70

if.then.70:
  call void @print_dispatch_on_void_error(i32 140)
  %23 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.70

if.else.70:
  br label %if.end.70

if.end.70:
  %24 = call i32 @_CN15SimpleExprTests_FN9loopTest2_(%class.SimpleExprTests* %21, i32 10)
  %25 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %26 = load %class.SimpleExprTests*, %class.SimpleExprTests** %25, align 8
  %27 = icmp eq %class.SimpleExprTests* %26, null
  br i1 %27, label %if.then.71, label %if.else.71

if.then.71:
  call void @print_dispatch_on_void_error(i32 141)
  %28 = call %class.Object* @_CN6Object_FN5abort_()
  br label %if.end.71

if.else.71:
  br label %if.end.71

if.end.71:
  %29 = call i32 @_CN15SimpleExprTests_FN9binOpTest_(%class.SimpleExprTests* %26, i32 4, i32 0)
  ret i32 %29
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
  %2 = call noalias i8* @malloc(i64 25)
  %3 = bitcast i8* %2 to %class.SimpleExprTests*
  call void @_CN15SimpleExprTests_FN15SimpleExprTests_(%class.SimpleExprTests* %3)
  store %class.SimpleExprTests* %3, %class.SimpleExprTests** %1, align 4
  ret void
}

; Constructor of class 'IO'
define void @_CN2IO_FN2IO_(%class.IO* %this) {

entry:
  %0 = bitcast %class.IO* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  ret void
}

; Constructor of class 'SimpleExprTests'
define void @_CN15SimpleExprTests_FN15SimpleExprTests_(%class.SimpleExprTests* %this) {

entry:
  %0 = bitcast %class.SimpleExprTests* %this to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %0)
  %1 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 1
  store i32 0, i32* %1, align 4
  %2 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 2
  store i8 0, i8* %2, align 4
  %3 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 3
  store %class.Object* null, %class.Object** %3, align 4
  %4 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 4
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds %class.SimpleExprTests, %class.SimpleExprTests* %this, i32 0, i32 5
  store %class.Object* null, %class.Object** %5, align 4
  ret void
}

; C malloc declaration
declare noalias i8* @malloc(i64)

; C exit declaration
declare void @exit(i32)

; C printf declaration
declare i32 @printf(i8*, ...)

; C scanf declaration
declare i32 @scanf(i8*, ...)

; C strlen declaration
declare i64 @strlen(i8*)

; C strlen declaration
declare i8* @strcpy(i8*, i8*)

; C strlen declaration
declare i8* @strcat(i8*, i8*)

; Class: Object, Method: abort
define %class.Object* @_CN6Object_FN5abort_() {
entry:
  call void @exit(i32 0)
  %0 = call noalias i8* @malloc(i64 0)
  %1 = bitcast i8* %0 to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %1)
  ret %class.Object* %1
}

; Class: IO, Method: out_string
define %class.IO* @_CN2IO_FN10out_string_(%class.IO* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.35, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)
  %1 = call noalias i8* @malloc(i64 0)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: out_int
define %class.IO* @_CN2IO_FN7out_int_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.37, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i32 %d)
  %1 = call noalias i8* @malloc(i64 0)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: in_int
define i32 @_CN2IO_FN6in_int_(%class.IO* %this) {
entry:
  %0 = alloca i32, align 8
  %1 = getelementptr inbounds [4 x i8], [4 x i8]* @.str.38, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: in_string
define i8* @_CN2IO_FN9in_string_(%class.IO* %this) {
entry:
  %0 = alloca i8*, align 8
  %1 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.36, i32 0, i32 0
  %2 = load i8*, i8** %0, align 8
  %call = call i32 (i8*, ...) @scanf(i8* %1, i8* %2)
  %3 = load i8*, i8** %0, align 8
  ret i8* %3
}

; Class: String, Method: concat
define i8* @_CN6String_FN6concat_(i8* %s1, i8* %s2) {
entry:
  %0 = call i64 @strlen(i8* %s1)
  %1 = call i64 @strlen(i8* %s2)
  %2 = add nsw i64 %0, %1
  %3 = add nsw i64 %2, 1
  %4 = call noalias i8* @malloc(i64 %3)
  %5 = call i8* @strcpy(i8* %4, i8* %s1)
  %6 = call i8* @strcat(i8* %4, i8* %s2)
  ret i8* %4
}
define void @print_div_by_zero_err_msg(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.35, i32 0, i32 0
  %1 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.39, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.37, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.26, i32 0, i32 0
  %6 = call i32 (i8*, ...) @printf(i8* %0, i8* %5)
  ret void
}
define void @print_dispatch_on_void_error(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.35, i32 0, i32 0
  %1 = getelementptr inbounds [30 x i8], [30 x i8]* @.str.40, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.37, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.26, i32 0, i32 0
  %6 = call i32 (i8*, ...) @printf(i8* %0, i8* %5)
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
