cmake_minimum_required(VERSION 3.22)

project(project-b VERSION 0.0.1)

find_package(MyProject 3.0.1 EXACT)

get_target_property(HELLO_JUPITER_PATH
  MyProjectNamespace::HelloJupiter
  IMPORTED_LOCATION_NOCONFIG) # TODO(kwk): Figure out why it is _NOCONFIG

message(STATUS "Path to HelloJupiter is ${HELLO_JUPITER_PATH}")
