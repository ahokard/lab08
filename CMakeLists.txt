cmake_minimum_required(VERSION 3.10)

project(lab05)

set(CMAKE_CXX_STANDARD 11)

add_executable(main main.cpp)

option(BUILD_TESTS "Build tests" ON)

if(BUILD_TESTS)
    enable_testing()

    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-error")

    add_subdirectory(third-party/gtest)

    add_executable(check tests/test1.cpp)

    target_link_libraries(check gtest_main)

    add_test(NAME check COMMAND $<TARGET_FILE:check>)
endif()

set(CPACK_PACKAGE_NAME "lab06")
set(CPACK_PACKAGE_VERSION "0.1.0")
set(CPACK_PACKAGE_CONTACT "deew5571@gmail.com")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "C++ project with tests and CPack")
set(CPACK_PACKAGE_VENDOR "ahokard")

set(CPACK_GENERATOR "TGZ;DEB")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "ahokard")

include(CPack)
