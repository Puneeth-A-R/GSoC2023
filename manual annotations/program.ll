; ModuleID = 'program.c'
source_filename = "program.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Factorial of %d: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"%d is a prime number.\0A\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"%d is not a prime number.\0A\00", align 1
@.str.3 = private unnamed_addr constant [48 x i8] c"The maximum number among %d, %d, and %d is %d.\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"O2\00", section "llvm.metadata"
@.str.5 = private unnamed_addr constant [10 x i8] c"program.c\00", section "llvm.metadata"
@.str.6 = private unnamed_addr constant [3 x i8] c"O3\00", section "llvm.metadata"
@.str.7 = private unnamed_addr constant [34 x i8] c"Fibonacci Series up to %d terms:\0A\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.10 = private unnamed_addr constant [29 x i8] c"Multiplication Table of %d:\0A\00", align 1
@.str.11 = private unnamed_addr constant [14 x i8] c"%d x %d = %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"O1\00", section "llvm.metadata"
@llvm.global.annotations = appending global [5 x { ptr, ptr, ptr, i32, ptr }] [{ ptr, ptr, ptr, i32, ptr } { ptr @factorial, ptr @.str.4, ptr @.str.5, i32 27, ptr null }, { ptr, ptr, ptr, i32, ptr } { ptr @isPrime, ptr @.str.6, ptr @.str.5, i32 36, ptr null }, { ptr, ptr, ptr, i32, ptr } { ptr @fibonacciSeries, ptr @.str.4, ptr @.str.5, i32 49, ptr null }, { ptr, ptr, ptr, i32, ptr } { ptr @multiplicationTable, ptr @.str.12, ptr @.str.5, i32 62, ptr null }, { ptr, ptr, ptr, i32, ptr } { ptr @findMax, ptr @.str.6, ptr @.str.5, i32 70, ptr null }], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 5, ptr %2, align 4
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr %2, align 4
  %11 = call i32 @factorial(i32 noundef %10)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %9, i32 noundef %11)
  %13 = load i32, ptr %2, align 4
  %14 = call i32 @isPrime(i32 noundef %13)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %19

16:                                               ; preds = %0
  %17 = load i32, ptr %2, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %17)
  br label %22

19:                                               ; preds = %0
  %20 = load i32, ptr %2, align 4
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %20)
  br label %22

22:                                               ; preds = %19, %16
  store i32 10, ptr %3, align 4
  %23 = load i32, ptr %3, align 4
  call void @fibonacciSeries(i32 noundef %23)
  store i32 7, ptr %4, align 4
  %24 = load i32, ptr %4, align 4
  call void @multiplicationTable(i32 noundef %24)
  store i32 12, ptr %5, align 4
  store i32 8, ptr %6, align 4
  store i32 15, ptr %7, align 4
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %6, align 4
  %27 = load i32, ptr %7, align 4
  %28 = call i32 @findMax(i32 noundef %25, i32 noundef %26, i32 noundef %27)
  store i32 %28, ptr %8, align 4
  %29 = load i32, ptr %5, align 4
  %30 = load i32, ptr %6, align 4
  %31 = load i32, ptr %7, align 4
  %32 = load i32, ptr %8, align 4
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %29, i32 noundef %30, i32 noundef %31, i32 noundef %32)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @factorial(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %3, align 4
  store i32 1, ptr %4, align 4
  br label %5

5:                                                ; preds = %13, %1
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp sle i32 %6, %7
  br i1 %8, label %9, label %16

9:                                                ; preds = %5
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %3, align 4
  %12 = mul nsw i32 %11, %10
  store i32 %12, ptr %3, align 4
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %4, align 4
  br label %5, !llvm.loop !6

16:                                               ; preds = %5
  %17 = load i32, ptr %3, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @isPrime(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %5 = load i32, ptr %3, align 4
  %6 = icmp sle i32 %5, 1
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %26

8:                                                ; preds = %1
  store i32 2, ptr %4, align 4
  br label %9

9:                                                ; preds = %22, %8
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %4, align 4
  %12 = mul nsw i32 %10, %11
  %13 = load i32, ptr %3, align 4
  %14 = icmp sle i32 %12, %13
  br i1 %14, label %15, label %25

15:                                               ; preds = %9
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = srem i32 %16, %17
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %15
  store i32 0, ptr %2, align 4
  br label %26

21:                                               ; preds = %15
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %4, align 4
  br label %9, !llvm.loop !8

25:                                               ; preds = %9
  store i32 1, ptr %2, align 4
  br label %26

26:                                               ; preds = %25, %20, %7
  %27 = load i32, ptr %2, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @fibonacciSeries(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %4, align 4
  %7 = load i32, ptr %2, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %7)
  store i32 1, ptr %6, align 4
  br label %9

9:                                                ; preds = %21, %1
  %10 = load i32, ptr %6, align 4
  %11 = load i32, ptr %2, align 4
  %12 = icmp sle i32 %10, %11
  br i1 %12, label %13, label %24

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %14)
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %5, align 4
  %19 = load i32, ptr %4, align 4
  store i32 %19, ptr %3, align 4
  %20 = load i32, ptr %5, align 4
  store i32 %20, ptr %4, align 4
  br label %21

21:                                               ; preds = %13
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %6, align 4
  br label %9, !llvm.loop !9

24:                                               ; preds = %9
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @multiplicationTable(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %4)
  store i32 1, ptr %3, align 4
  br label %6

6:                                                ; preds = %16, %1
  %7 = load i32, ptr %3, align 4
  %8 = icmp sle i32 %7, 10
  br i1 %8, label %9, label %19

9:                                                ; preds = %6
  %10 = load i32, ptr %2, align 4
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %3, align 4
  %14 = mul nsw i32 %12, %13
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %10, i32 noundef %11, i32 noundef %14)
  br label %16

16:                                               ; preds = %9
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %3, align 4
  br label %6, !llvm.loop !10

19:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @findMax(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = load i32, ptr %4, align 4
  store i32 %8, ptr %7, align 4
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %7, align 4
  %11 = icmp sgt i32 %9, %10
  br i1 %11, label %12, label %14

12:                                               ; preds = %3
  %13 = load i32, ptr %5, align 4
  store i32 %13, ptr %7, align 4
  br label %14

14:                                               ; preds = %12, %3
  %15 = load i32, ptr %6, align 4
  %16 = load i32, ptr %7, align 4
  %17 = icmp sgt i32 %15, %16
  br i1 %17, label %18, label %20

18:                                               ; preds = %14
  %19 = load i32, ptr %6, align 4
  store i32 %19, ptr %7, align 4
  br label %20

20:                                               ; preds = %18, %14
  %21 = load i32, ptr %7, align 4
  ret i32 %21
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git bdc2771911cb181fe0144800000b4c19d94ff52e)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
