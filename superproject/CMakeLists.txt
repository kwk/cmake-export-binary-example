cmake_minimum_required(VERSION 3.22)

project(superproject VERSION 0.0.1)

# Have a direct dependency on the subproject-a
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../subproject-a subproject-a)

# When having the add_subdirectory, we cannot get the location to the binary
# because at this stage the binary has yet to be built.
if (NOT TARGET HelloJupiter)
  message(FATAL_ERROR "No target found with this name: HelloJupiter")
else()
  message(STATUS "Congrats, found target with this name: HelloJupiter")
endif()
