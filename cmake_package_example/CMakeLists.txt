cmake_minimum_required(VERSION 3.0)

if(NOT DEFINED _VCPKG_INSTALLED_DIR AND DEFINED ENV{_VCPKG_INSTALLED_DIR})
   set(_VCPKG_INSTALLED_DIR $ENV{_VCPKG_INSTALLED_DIR})
endif()

if(NOT DEFINED CMAKE_TOOLCHAIN_FILE AND DEFINED ENV{CMAKE_TOOLCHAIN_FILE})
   set(CMAKE_TOOLCHAIN_FILE $ENV{CMAKE_TOOLCHAIN_FILE})
endif()

# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

project(eigentest)

set(CMAKE_CXX_STANDARD 17)

find_package(Eigen3 CONFIG REQUIRED)
include_directories(${EIGEN3_INCLUDE_DIRS})

add_library(libexample "src/libexample.cpp")
target_link_libraries(libexample Eigen3::Eigen)
include(cmake_packaging/libexample_installation.cmake)
