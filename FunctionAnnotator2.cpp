#include "llvm/Transforms/Utils/PuneethPass.h"
#include "llvm/IR/Constants.h"
#include "llvm/Testing/Annotations/Annotations.h"
#include <string>
#include "llvm/Support/CommandLine.h"
#include <fstream>
#include <sstream>

using namespace llvm;

PreservedAnalyses PuneethPass::run(Module &M,
                                    ModuleAnalysisManager &AM) {
  /* cl::opt<std::string>
  ForceAnnotate("force-annotate", cl::init(""), cl::desc("Force annotate functions with desired optimization level"));

  enum optLev {
  O0, O1, O2, O3
};

// Enable Optimization Options to be specified on the command line
cl::opt<optLev> DebugLevel("optimization-level", cl::desc("Set the optimization level:"),
  cl::values(
    clEnumValN(O0, "none", "Default Optimization"),
    clEnumVal(O1, "Optimization level O1"),
    clEnumVal(O2, "Optimization level 02"),
    clEnumVal(O3, "Optimization level 02")));

*/

cl::opt<std::string> OptLevelAttributeName(
    "opt-level-attribute-name", cl::init(""), cl::Hidden,
    cl::desc("Optimization attribute name"));

cl::opt<std::string> CSVFilePath(
    "csv-file-path", cl::init(""), cl::Hidden,
    cl::desc("CSV file containing function names and optimization level as attribute"));

std::ifstream CSVFile;
CSVFile.open(CSVFilePath);

if (!CSVFile.is_open()) {
  report_fatal_error("CSV Fie does not exist");
}

std::string Line;
for(Function &F : M) {
  while (std::getline(CSVFile, Line)) {

    std::istringstream stringObj(Line);
    std::string FuncName, OptLevel;

    if (std::getline(stringObj, FuncName) && std::getline(stringObj, OptLevel)) {
      if (FuncName == F.getName()) {
        F.addFnAttr(OptLevelAttributeName, OptLevel);
        break;

      }
    }
  }

  CSVFile.close();
}

  return PreservedAnalyses::all();
}
