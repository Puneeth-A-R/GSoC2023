#ifndef LLVM_TRANSFORMS_FUNCTIONANNOTATORPASS_H
#define LLVM_TRANSFORMS_FUNCTIONANNOTATORPASS_H

#include "llvm/IR/PassManager.h"

namespace llvm {
    class FunctionAnnotatorPass : public PassInfoMixin<FUNCTIONANNOTATORPass> {
    public:
      PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);
    };

    } // namespace llvm

    #endif // LLVM_TRANSFORMS_FUNCTIONANNOTATORPASS_H
