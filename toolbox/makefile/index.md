---
layout: note
title: Makefile
---

# pkg-config

`pkg-config` is a program written in c to provide metadata of a package installed in a system by checking a file suffixed with `.pc`, which is provided by the installation process of that package. The default path where `pkg-config` searches for `.pc` files can be found using the following command:

~~~sh
pkg-config --variable pc_path pkg-config
~~~

To add extra path to this list, one needs to set an environment variable `PKG_CONFIG_PATH` as follows:

~~~sh
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/some/other/path/pkgconfig
~~~

The `.pc` file (or a file that can be used to generate the `.pc` file) is written manually by the package provider.

The developer of a new `C/C++` program can use the following command to find out the compile flags of a package that his/her program depends on:

~~~sh
pkg-config --cflags name-of-package-depended
~~~

`ROOT` and `Geant4` use similar mechanism. They provide `root-config` and `geant4-config` commands for developers to retrieve their metadata.
