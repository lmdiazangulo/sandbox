cmake_minimum_required(VERSION 3.8 FATAL_ERROR)

project(cpp-pybind)

add_subdirectory(pybind11)

pybind11_add_module(luis_example example.cpp)