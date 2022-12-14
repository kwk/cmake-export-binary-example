# About

This repo contains two CMake projects, `project-a` and `project-b`.

Run `make project-a` to build `project-a` in `build/project-a` and install it
to `install/project-a`.

Run `make project-b` to build `project-b` in `build/project-b`.

The idea is that `project-a` produces three binaries `HelloJupiter`,
`HelloMoon`, `HelloWorld` and installs them to `install/project-a/bin`.

Then `project-b` is supposed to find these binaries using `find_package`.

## Experiments

* Build `project-a` and remove a binary from the installation folder. Notice
  how cmake complains when building `project-b`.
* Go to `project-b` and modify the `find_package` call to search for a higher
  version than `3.0.1`. Try to build `project-b`. Notice how the configuration
  file is not accepted because the version doesn't match.

## Documentation

https://cmake.org/cmake/help/latest/guide/importing-exporting/index.html