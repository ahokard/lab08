cmake_minimum_required(VERSION 3.10)

include("cmake/HunterGate.cmake")

HunterGate(
    URL "https://github.com/cpp-pm/hunter/archive/v0.23.251.tar.gz"
    SHA1 "5659b15dc0884d4b03dbd95710e6a1fa0fc3258d"
)

project(lab07)

set(CMAKE_CXX_STANDARD 11)

add_executable(main main.cpp)

option(BUILD_TESTS "Build tests" ON)

if(BUILD_TESTS)

    enable_testing()

    hunter_add_package(fmt)
    find_package(fmt CONFIG REQUIRED)

    add_executable(check tests/test1.cpp)

    target_link_libraries(check fmt::fmt)

    add_test(NAME check COMMAND $<TARGET_FILE:check>)

endif()
