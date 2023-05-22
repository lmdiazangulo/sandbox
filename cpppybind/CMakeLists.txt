cmake_minimum_required(VERSION 3.8 FATAL_ERROR)

project(cpp-pybind)

add_subdirectory(pybind11)

pybind11_add_module(luis_example example.cpp)


# target_link_libraries(
#     example PRIVATE 
#     Python3::Python 
#     pybind11::lto 
#     pybind11::embed 
#     pybind11::module 
#     pybind11::headers
# )




