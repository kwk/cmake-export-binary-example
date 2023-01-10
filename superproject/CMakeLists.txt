cmake_minimum_required(VERSION 3.22)

project(superproject VERSION 0.0.1)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../subproject-a subproject-a)

# TODO(kwk): This currently doesn't work. Fix it.
get_target_property(HELLO_JUPITER_PATH
  HelloJupiter
  # _RELEASE is used because we build THIS project in that mode
  IMPORTED_LOCATION_RELEASE)

message(STATUS "Path to HelloJupiter is ${HELLO_JUPITER_PATH}")
