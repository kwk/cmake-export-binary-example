cmake_minimum_required(VERSION 3.22)

project(subproject-c VERSION 0.0.4)

find_package(SubProjectA 3.0.1 EXACT REQUIRED HINTS "${MY_CMAKE_DIR}")

get_target_property(HELLO_JUPITER_PATH
  SubProjectANamespace::HelloJupiter
  # _RELWITHDEBINFO is used because project-a was built and installed in that mode
  IMPORTED_LOCATION_RELWITHDEBINFO)

message(STATUS "Path to HelloJupiter is ${HELLO_JUPITER_PATH}")
