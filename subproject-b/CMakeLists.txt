cmake_minimum_required(VERSION 3.22)

project(subproject-b VERSION 0.0.1)

find_package(MyProject 3.0.1 EXACT)

get_target_property(HELLO_JUPITER_PATH
  # MyProjectNamespace::HelloJupiter
  HelloJupiter
  # _RELWITHDEBINFO is used because project-a was built and installed in that mode
  IMPORTED_LOCATION_RELWITHDEBINFO)

message(STATUS "Path to HelloJupiter is ${HELLO_JUPITER_PATH}")
