cmake_minimum_required(VERSION 3.8 FATAL_ERROR)

project(cpp-pybind)

add_subdirectory(pybind11)


pybind11_add_module(luis_example example.cpp)

find_package(eigen3 REQUIRED)
pybind11_add_module(matrix_example matrix_example.cpp)

target_link_libraries(matrix_example PRIVATE Eigen3::Eigen)