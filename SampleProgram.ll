; ModuleID = 'SampleProgram.c'
source_filename = "SampleProgram.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

@.str = private unnamed_addr constant [7 x i8] c"Run O1\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [16 x i8] c"SampleProgram.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [7 x i8] c"Run O3\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [7 x i8] c"Run O2\00", section "llvm.metadata"
@llvm.global.annotations = appending global [3 x { ptr, ptr, ptr, i32, ptr }] [{ ptr, ptr, ptr, i32, ptr } { ptr @first_function, ptr @.str, ptr @.str.1, i32 1, ptr null }, { ptr, ptr, ptr, i32, ptr } { ptr @second_function, ptr @.str.2, ptr @.str.1, i32 9, ptr null }, { ptr, ptr, ptr, i32, ptr } { ptr @fifth_function, ptr @.str.3, ptr @.str.1, i32 33, ptr null }], section "llvm.metadata"

; Function Attrs: noinline nounwind ssp uwtable(sync)
define float @first_function() #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  store float 9.000000e+00, ptr %1, align 4
  store float 1.200000e+01, ptr %2, align 4
  %4 = load float, ptr %2, align 4
  %5 = fsub float 9.000000e+00, %4
  %6 = load float, ptr %1, align 4
  %7 = fadd float %5, %6
  %8 = fpext float %7 to double
  %9 = fmul double 2.000000e-01, %8
  %10 = fptrunc double %9 to float
  store float %10, ptr %3, align 4
  %11 = load float, ptr %3, align 4
  ret float %11
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define double @second_function() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 5, ptr %1, align 4
  store i32 7, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  %5 = load i32, ptr %2, align 4
  %6 = add nsw i32 %4, %5
  store i32 %6, ptr %3, align 4
  %7 = load i32, ptr %3, align 4
  %8 = sitofp i32 %7 to double
  ret double %8
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @third_function() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 -3, ptr %1, align 4
  store i32 4, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  %5 = load i32, ptr %2, align 4
  %6 = sub nsw i32 %4, %5
  store i32 %6, ptr %3, align 4
  %7 = load i32, ptr %3, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @fourth_function() #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  store float 0x4022CCCCC0000000, ptr %1, align 4
  store float 0xC0059999A0000000, ptr %2, align 4
  %4 = load float, ptr %1, align 4
  %5 = load float, ptr %2, align 4
  %6 = fdiv float %4, %5
  store float %6, ptr %3, align 4
  %7 = load float, ptr %3, align 4
  %8 = fptosi float %7 to i32
  ret i32 %8
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define double @fifth_function() #0 {
  ret double -1.000000e+00
}

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"clang version 17.0.0 (https://github.com/Puneeth-A-R/llvm-project.git c67a326dc59c31410eb723c6f765083b20259ac3)"}
