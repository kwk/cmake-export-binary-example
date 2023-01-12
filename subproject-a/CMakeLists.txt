cmake_minimum_required(VERSION 3.22)

project(subproject-a VERSION 3.0.1)

message(STATUS "SUBPROJECT_A_BUILT_STANDALONE=${SUBPROJECT_A_BUILT_STANDALONE}")

# Add three executables
add_executable(HelloJupiter src/hellojupiter.cpp)
add_executable(HelloMoon src/hellomoon.cpp)
add_executable(HelloWorld src/helloworld.cpp)

# SUPPORT BUILD TREE METHOD ----------------------------------------------------

# Create exports for the targets above so they can be used in a build tree
# situation and when we're not installing this project beforehand.
export(TARGETS
         HelloJupiter
         HelloMoon
         HelloWorld
       NAMESPACE SubProjectANamespace::
       FILE ${CMAKE_BINARY_DIR}/SubProjectAConfig.cmake)

# SUPPORT BUILD INSTALL METHOD -------------------------------------------------

# The rest of this file is for the situation when this project is actually
# installed and you want to import it into another project (here: subproject-b).

# Install the binaries
install(
  TARGETS
    HelloJupiter
    HelloMoon
    HelloWorld
  EXPORT MyCustomExportName)

# Install the cmake config file
install(
  EXPORT MyCustomExportName
  # We can't have a namespace because that would require us to drop when we
  # build using "build-tree" mode
  NAMESPACE SubProjectANamespace::
  FILE SubProjectAConfig.cmake
  DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake")

# Write and install the version file
# see https://cmake.org/cmake/help/latest/module/CMakePackageConfigHelpers.html#command:write_basic_package_version_file
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
  SubProjectAConfigVersion.cmake
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY SameMajorVersion)

install(
  FILES "${CMAKE_CURRENT_BINARY_DIR}/SubProjectAConfigVersion.cmake"
	DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake")
