cmake_minimum_required(VERSION 3.0)

# These flags prevent CMake from checking that our compiler works.
set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_LINKER ${CMAKE_CXX_COMPILER})

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_VERBOSE_MAKEFILE ON)

# This option here prevents CMake from adding an -rdynamic link flag, which
# otherwise breaks the build.
#
# https://cmake.org/cmake/help/latest/policy/CMP0065.html
cmake_policy(SET CMP0065 NEW)

project(os6_kernel)
enable_language(ASM)
include_directories(include)

add_executable(os6
				boot.S
				debug.cpp
        main.cpp)

set_target_properties(os6 PROPERTIES SUFFIX ".bin")
target_compile_options(os6
        PUBLIC -ffreestanding -nostdlib -fno-exceptions -fno-rtti)

target_link_libraries(os6
	gcc 
	-T "${CMAKE_CURRENT_LIST_DIR}/linker.ld"
	-ffreestanding -nostdlib)
