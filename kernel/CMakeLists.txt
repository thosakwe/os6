cmake_minimum_required(VERSION 3.0)

# These flags prevent CMake from checking that our compiler works.
# set(CMAKE_C_COMPILER_WORKS 1)
# set(CMAKE_CXX_COMPILER_WORKS 1)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

project(os6_kernel)
