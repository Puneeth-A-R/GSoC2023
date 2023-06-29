#include "llvm/Transforms/Utils/PuneethPass.h"
#include "llvm/IR/Constants.h"
#include "llvm/Testing/Annotations/Annotations.h"
#include <random>

using namespace llvm;

PreservedAnalyses PuneethPass::run(Module &M,
                                    ModuleAnalysisManager &AM) {

  //outs() << "FUNCTION ANNOTATOR PASS IS BEING RUN FOR FUNCTION " << M.getName() << "\n";
  for(Function &F : M) {
  //outs() << F.getName() << "\n";
  //outs() << "Printing the attribute set----------------------" << "\n";
  //F.getAttributes().print(outs());
  // Analogous to ML model. Right now used to randomly annotate functions with O0, O1, O2, O3
  // Needs to be replaced with the actual model.
  std::random_device rd;
  std::mt19937 gen(rd());
  std::uniform_int_distribution<> dis(0, 3);
  int randomNumber = dis(gen);

  // Add attribute to functions
  if (randomNumber == 0) {
    F.addFnAttr("Run O0");
    //outs() << "Printing the attribute set of o0----------------------" << "\n";
    //F.getAttributes().print(outs());
  }
  else if (randomNumber == 1) {
    F.addFnAttr("Run O1");
    //outs() << "Printing the attribute set of 01----------------------" << "\n";
    //F.getAttributes().print(outs());
  }
  else if (randomNumber == 2) {
    F.addFnAttr("Run O2");
    //outs() << "Printing the attribute set of o2----------------------" << "\n";
    //F.getAttributes().print(outs());
  }
  else {
    F.addFnAttr("Run O3");
    //outs() << "Printing the attribute set of o3----------------------" << "\n";
    //F.getAttributes().print(outs());
  }

  // Running the actual optimization pipeline
  if (F.hasFnAttribute("Run O0")) {
    //outs() << "O0 pipeline (default) will be run\n";
    // TODO: Run O0 (default) pipeline
  }
  else if (F.hasFnAttribute("Run O1")) {
    //outs() << "O1 pipeline will be run\n";
    // TODO: Switch pipeline to O1
  }
  else if (F.hasFnAttribute("Run O2")) {
    //outs() << "O2 pipeline will be run\n";
    // TODO: Switch pipeline to O2
  }
  else {
    //outs() << "Run the O3 pipeline\n";
    // TODO: Switch pipeline to O3
  }

  }

  outs() << "Handling manual annotations\n";

  // Handling manual annotations
  if(GlobalVariable* GA = M.getGlobalVariable("llvm.global.annotations")) {
    // the first operand holds the metadata
    //GA->print(outs());
    auto tmp = GA->getAttribute("Run O3");
    if(tmp.hasAttribute("Run O1")) {
      outs() << "O1 ATTRIBUTE FOUND!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\t\n";
    }
    //outs() << "Print 1\n";
    for (Value *AOp : GA->operands()) {
      //AOp->print(outs());
      // all metadata are stored in an array of struct of metadata
      if (ConstantArray *CA = dyn_cast<ConstantArray>(AOp)) {
        //CA->print(outs());
        //outs() << "Print 2\n";
        // so iterate over the operands
        for (Value *CAOp : CA->operands()) {
          // get the struct, which holds a pointer to the annotated function
          // as first field, and the annotation as second field
            if (ConstantStruct *CS = dyn_cast<ConstantStruct>(CAOp)) {
              //CS->print(outs());
              //outs() << "\nPrint 3\n";
              //outs() << "NUMBER OF OPERANDS IN CS IS: "<< CS->getNumOperands() << "\n";
              if (CS->getNumOperands() >= 2) {
                //outs() << "Print 4\n";
                //outs() << cast<ConstantDataArray>(cast<GlobalVariable>(CS->getOperand(2)->getOperand(0)))->getElementAsConstant(1);
                auto Annotation = cast<ConstantDataArray>(cast<GlobalVariable>(CS->getOperand(1)->getOperand(0)))->getAsCString();
                outs() << "This is the manually annotated attribute: " << Annotation.str() << "\n";
                auto AnnAttr = Annotation.str();
                for (Function &F : M) {
                      //outs() << "Print 6\n";
                      if (AnnAttr.compare("Run O1")) {
                          //outs() << "Run O1\n";
                          F.addFnAttr("Run O1\n");
                      }
                }
                //AnnotatedFunction->getAttributes().print(outs());
                // the second field is a pointer to a global constant Array that holds the string
                if (GlobalVariable *GAnn =
                    dyn_cast<GlobalVariable>(CS->getOperand(1)->getOperand(0))) {
                      outs() << "Print 4\n";
                  if (ConstantDataArray *A =
                      dyn_cast<ConstantDataArray>(GAnn->getOperand(0))) {
                        if((A->getNumOperands())) {
                          outs() << "Nothing here \n";
                        }
                        outs() << GAnn->getOperand(0);
                        outs() << "Print 5\n";
                    // we have the annotation! Check for annotation type and add appropriate attribute
                    StringRef AS = A->getAsString();
                    outs() << AS;
                    for (Function &F : M) {
                      outs() << "Print 6\n";
                      if (AnnAttr.compare("Run O1")) {
                          outs() << "Run O1\n";
                          F.addFnAttr("Run O1\n");
                      }
                      if (AS.contains_insensitive("O1")) {
                        outs() << "Run O1\n";
                        F.addFnAttr("Run O1\n");
                    }
                    else if (AS.contains_insensitive("O2")) {
                      outs() << "Run O2\n";
                      F.addFnAttr("Run O2\n");
                    }
                    else if (AS.contains_insensitive("O3")) {
                      outs() << "Run O3\n";
                      F.addFnAttr("Run O3\n");
                    }
                    else {
                      outs() << "Run O0\n";
                      F.addFnAttr("Run O0\n");
                    }
                    }
                  }
                }
              }
            }
          }
        }
      }
  }

/*
if(GlobalVariable* GA = M.getGlobalVariable("llvm.global.annotations")) {
      // the first operand holds the metadata
      for (Value *AOp : GA->operands()) {
        // all metadata are stored in an array of struct of metadata
        if (ConstantArray *CA = dyn_cast<ConstantArray>(AOp)) {
          // so iterate over the operands
          for (Value *CAOp : CA->operands()) {
            // get the struct, which holds a pointer to the annotated function
            // as first field, and the annotation as second field
            if (ConstantStruct *CS = dyn_cast<ConstantStruct>(CAOp)) {
              if (CS->getNumOperands() >= 2) {
                Function* AnnotatedFunction = cast<Function>(CS->getOperand(1)->getOperand(0));
                // the second field is a pointer to a global constant Array that holds the string
                AnnotatedFunction->print(outs());
                if (auto *GAnn =
                    dyn_cast<GlobalVariable>(CS->getOperand(1)->getOperand(0))) {
                      GAnn->print(outs());
                  if (ConstantDataArray *A =
                      dyn_cast<ConstantDataArray>(GAnn->getOperand(0))) {
                    // we have the annotation! Check it's an epona annotation and process
                    StringRef AS = A->getAsString();
                    if (AS.startswith("Marker")) {
                      //FuncAnnotations[AnnotatedFunction].emplace_back(AS);
                      outs() << "It works!";
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
*/



  /*
auto global_annos = M.getNamedGlobal("llvm.global.annotations");
if (global_annos) {
  auto a = cast<ConstantArray>(global_annos->getOperand(0));
  outs() << global_annos->getOperand(0) << "\n";
  a->print(outs());
  outs() << a->getNumOperands() << "\n";
  for (unsigned int i=0; i<a->getNumOperands(); i++) {
    auto e = cast<ConstantStruct>(a->getOperand(i));
    outs() << "INSIDE THE FOR LOOP\n";
    if (auto fn = (e->getOperand(0)->getOperand(0))) {
      outs() << "INSIDE THE IF STATEMENT\n";
      //auto anno = cast<ConstantDataArray>(cast<GlobalVariable>(e->getOperand(1)->getOperand(0))->getOperand(0))->getAsCString();
      //fn->addFnAttr(anno); // <-- add function annotation here
    }
  }
}
*/

/*AttributeList[
  { function => noinline nounwind ssp uwtable(sync) "Run O3" "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
]*/

  return PreservedAnalyses::all();
}
