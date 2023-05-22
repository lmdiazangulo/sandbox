cmake_minimum_required(VERSION 3.8 FATAL_ERROR)
project(cudaTest LANGUAGES CXX CUDA)

add_executable(cudaTest cudaTest.cu)
target_compile_features(cudaTest PUBLIC cxx_std_11)

# Required for CUDA builds
set_target_properties(cudaTest PROPERTIES CUDA_SEPARABLE_COMPILATION ON)