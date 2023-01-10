# About

This repo contains three CMake projects, `subproject-a` and `subproject-b` and
`superproject`.

`subproject-a` produces three binaries `HelloJupiter`, `HelloMoon`, and
`HelloWorld`.

`superproject` uses `add_subdirectory(../subproject-a)` to build `subproject-a`
in the same build tree.

`subproject-b` requires you to firsr build `subproject-a` and have it installed.
It then tries to find the project by using `find_package`.

This simulates these two usages of `subproject-a`

1. from the same build-tree
2. from an installed location. 

## Usage

Run `make subproject-a` to build `subproject-a` in `build/subproject-a` and
install it to `install/subproject-a`.

Run `make subproject-b` to build `subproject-b` in `build/subproject-b`.

Run `make superproject` to build `superproject` and `subproject-a` as a direct
dependency in `build/superproject`.

## Experiments

* Build `subproject-a` and remove a binary from the installation folder. Notice
  how cmake complains when building `subproject-b`.
* Go to `subproject-b` and modify the `find_package` call to search for a higher
  version than `3.0.1`. Try to build `subproject-b`. Notice how the configuration
  file is not accepted because the version doesn't match.

## Documentation

https://cmake.org/cmake/help/latest/guide/importing-exporting/index.html

## See also

https://discourse.llvm.org/t/an-opinionated-way-to-outsource-simplify-and-unify-repetitive-cmake-code-in-standalone-build-mode/