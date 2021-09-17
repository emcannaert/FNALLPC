ALL_TOOLS      += cuda
ALL_LIB_TYPES += CUDA_LIB
cuda_EX_INCLUDE := /cvmfs/cms.cern.ch/slc6_amd64_gcc700/external/cuda/10.0.130/include
cuda_EX_LIB := cudart cudadevrt nvToolsExt
cuda_EX_CUDA_LIB := cudadevrt
cuda_EX_USE := cuda-stubs
cuda_EX_FLAGS_CUDA_HOST_CXXFLAGS  := -std=c++14
cuda_EX_FLAGS_CUDA_FLAGS  := -gencode arch=compute_60,code=sm_60 -gencode arch=compute_61,code=sm_61 -gencode arch=compute_70,code=sm_70 -O3 -std=c++14 --expt-relaxed-constexpr --expt-extended-lambda --generate-line-info --source-in-ptx
cuda_EX_FLAGS_CUDA_HOST_REM_CXXFLAGS  := -std=% %potentially-evaluated-expression

