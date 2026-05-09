# CMake generated Testfile for 
# Source directory: /home/anton/workspace/projects/lab06
# Build directory: /home/anton/workspace/projects/lab06/_build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(check "/home/anton/workspace/projects/lab06/_build/check")
set_tests_properties(check PROPERTIES  _BACKTRACE_TRIPLES "/home/anton/workspace/projects/lab06/CMakeLists.txt;22;add_test;/home/anton/workspace/projects/lab06/CMakeLists.txt;0;")
subdirs("third-party/gtest")
