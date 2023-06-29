; RUN: opt -passes='module(FunctionAnnotatorPass)' -S < %s | FileCheck %s

; CHECK-LABEL: @llvm.global.annotations

@llvm.global.annotations = appending global [3 x { ptr, ptr, ptr, i32, ptr }] [{ ptr, ptr, ptr, i32, ptr } { ptr @first_function, ptr @.str, ptr @.str.1, i32 1, ptr null }, { ptr, ptr, ptr, i32, ptr } { ptr @second_function, ptr @.str.2, ptr @.str.1, i32 9, ptr null }, { ptr, ptr, ptr, i32, ptr } { ptr @fifth_function, ptr @.str.3, ptr @.str.1, i32 33, ptr null }], section "llvm.metadata"

; CHECK-LABEL: @.str = private unnamed_addr constant [7 x i8] c"Run O1\00", section "llvm.metadata"
; CHECK-LABEL: @.str.2 = private unnamed_addr constant [7 x i8] c"Run O3\00", section "llvm.metadata"
; CHECK-LABEL: @.str.3 = private unnamed_addr constant [7 x i8] c"Run O2\00", section "llvm.metadata"

; TODO: Add test support for manual annotations
