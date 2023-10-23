# Google Summer of Code 2023 Final Submission

This document is a summary of the work that I did during my participation in Google Summer of Code (GSoC) 2023. The surrounding repository contains a lot more information on the details of what I have done.

## Goals/Motivation

LLVM uses a heuristics-based approach for IR-based optimizations and the core objective of this project was to work on steps that would eventually replace the heuristics approach with an approach guided by an ML-based policy.

It was decided that the best way to begin this journey was by writing an LLVM transformation pass that is able to annotate a given function with the desired optimization level.

The optimization level that is added as an attribute to each function, will later be used by the ML model to modify the optimization pipeline.

## Work done as a part of GSoC 2023

- A pass to annotate functions was initially written, but later on, it was decided the best thing to do would be to extend an existing pass. `ForceFuncAttrs` pass was extended to consume values from a CSV file containing the function names and optimization values. See [here](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Transforms/IPO/ForceFunctionAttrs.cpp) and [here](https://github.com/llvm/llvm-project/blob/main/llvm/include/llvm/Transforms/IPO/ForceFunctionAttrs.h).

- A test case to verify that the newly added functionality works as intended was also written, It takes in a sample IR file and a CSV file and adds the desired optimization levels to the functions in the IR. See [here](https://github.com/llvm/llvm-project/tree/main/llvm/test/Transforms/ForcedFunctionAttrs).

- An RFC (Request for Comments) to modify the `addPass(...)` function in the `FunctionPassManager` to take in an additional argument, namely a set of optimization levels for which a pass should run, was written. Discussion on this RFC in the community is still actively going on. See [here](https://discourse.llvm.org/t/rfc-making-the-pass-manager-aware-of-function-level-optimization-attributes/73736).

- The `PassManager` was modified to fill the pipeline with passes that should be run when given a specific optimization level. See [here]().

- An ML model was built and tested with a dataset of functions and possible optimization levels that was extracted with a custom-written Python script.

## Future Steps.

- The exact way to modify the `FunctionPassManager` is still under discussion in the community (Because of the RFC). However, the initially proposed implementation is ready and needs to be upstreamed (After a consensus is reached).

- The ML model needs to be integrated as a final step, into the existing codebase.

## Summary

For me, the GSoC 2023 journey was an excellent learning experience. It was a terrific experience to work in an area that I'm very passionate about and where I have my core skills. I was able to learn various aspects of the development of a feature such as:

- Working with and navigating a massive codebase
- Writing clean, readable, and production-level code
- Working in a team to understand how a feature can be addressed using various techniques.

My experience participating in Google Summer of Code with LLVM Compiler Infrastructure organization has been enriching and significantly advanced my developer skills. I look forward to continuing to contribute to the feature and working to become a better developer.

I want to thank Mircea Trofin, Tarindu Jayatilaka, and Johannes Doerfert, my mentors, for being open to my ideas, looking over my code, reviewing my approaches, and helping me with implementations. Working with them was a remarkable learning experience and I was glad to be a mentee under them.

Ultimately, I would like to express my gratitude to the LLVM Compiler Infrastructure organization for providing me with this wonderful chance to spend my summer working on this project as part of GSoC 2023.
