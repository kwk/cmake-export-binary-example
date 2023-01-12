# About

This is all about how to use CMake's `find_package()` to find a package from an
intallation location or from a *build tree*.

This repo contains three CMake projects:

 1. `subproject-a`
 2. `subproject-b`
 3. `subproject-c`.

## subproject-a

`subproject-a` produces three binaries `HelloJupiter`, `HelloMoon`, and
`HelloWorld`. 

The other two projects, `subproject-b` and `subproject-c` are dependent on the
binaries/artifacts that `subproject-a` has produced. That's why both of them
call `find_package(SubPackageA)` in their CMakeLists files.

### CMake Package config files

In order to have `find_package(SubProjectA)` actually work, we must tell CMake
to generate a file for us that *adds imported executables* of with a proper
location. Now, if you're new to CMake let me make this a bit more simple. CMake
obviously knows about the binaries it produces in `subproject-a`. It also knows

 a) where the binaries are located in the **build tree** of `subproject-a` and
 b) where the binaries are located in the **install site** of `subproject-a`.

We ask cmake to create a file for each of those locations which on
configuration/installation show up:

 a) `build/subproject-a/SubProjectAConfig.cmake`
 b) `install/subproject-a/cmake/SubProjectAConfig.cmake`

Now, look at the `CMakeLists.txt` files for both, `subproject-c` and
`subproject-b`, and notice that they don't differ much! They both contain this
line:

```cmake
find_package(SubProjectA 3.0.1 EXACT REQUIRED HINTS "${MY_CMAKE_DIR}")
```

The difference is in how these projects are configured. That's done in the
`Makefile` where it says:

  * `-DMY_CMAKE_DIR=$(abspath install/subproject-a/cmake)` - for `subproject-b`
  * `-DMY_CMAKE_DIR=$(abspath build/subproject-a)` - for `subproject-c`

Obviously we can control from which location to use the artifacts of
`subproject-a` by setting `MY_CMAKE_DIR`.

## Usage

Run `make` to build all of the below.

Run `make subproject-a` to build `subproject-a` in `build/subproject-a` and
install it to `install/subproject-a`.

Run `make subproject-b` to build `subproject-b` in `build/subproject-b`.

Run `make subproject-c` to build `subproject-c` in `build/subproject-c`.

## Experiments

* Build `subproject-a` and remove a binary from the installation folder. Notice
  how cmake complains when building `subproject-b`.
  
  NOTE: When you remove a binary from the build tree in, i.e. `rm
  build/subproject-a/HelloMoon`, and you build subproject-c you will not get
  that error.
* Go to `subproject-b` and modify the `find_package` call to search for a higher
  version than `3.0.1`. Try to build `subproject-b`. Notice how the configuration
  file is not accepted because the version doesn't match.

## Documentation

https://cmake.org/cmake/help/latest/guide/importing-exporting/index.html

## See also

https://discourse.llvm.org/t/an-opinionated-way-to-outsource-simplify-and-unify-repetitive-cmake-code-in-standalone-build-mode/