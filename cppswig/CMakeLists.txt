cmake_minimum_required(VERSION 3.8 FATAL_ERROR)

project(cpp-py-swig)

find_package(Python3 COMPONENTS Development REQUIRED)

add_library(example SHARED example.cxx example_wrap.cxx)
target_link_libraries(example
    PRIVATE 
    Python3::Python 
)
set_target_properties(example PROPERTIES OUTPUT_NAME "_example")
set_target_properties(example PROPERTIES SUFFIX ".pyd")