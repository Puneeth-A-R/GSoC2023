; ModuleID = '/Users/shashank/llvm-project/llvm/test/Transforms/Annotations/FunctionAnnotation.c'
source_filename = "/Users/shashank/llvm-project/llvm/test/Transforms/Annotations/FunctionAnnotation.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @first_function() #0 {
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @second_function() #0 {
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @third_function() #0 {
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @fourth_function() #0 {
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @fifth_function() #0 {
  ret void
}

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"clang version 17.0.0 (https://github.com/Puneeth-A-R/llvm-project.git 28dbbceb867a6b6a25bb8f77cc083932c3582cb2)"}
