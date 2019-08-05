---
layout: note
title: C/C++
---

# Temporary change of C/C++ compiler

~~~shell
gcc#press tab to list candidates
# say you have gcc44 listed after tab completion
CC="gcc44" cmake -G "Unix Makefiles"
CXX="g++44" cmake -G " Unix Makefiles"
~~~

# GNU ld link order

The GNU `ld` linker is a so-called smart linker. It will keep track of the functions used by preceding static libraries, permanently tossing out those functions that are not used from its lookup tables. The result is that if you link a static library too early, then the functions in that library are no longer available to static libraries later on the link line. The typical UNIX linker works from left to right, so put all your dependent libraries on the left, and the ones that satisfy those dependencies on the right of the link line. Here is a good reference page: http://stackoverflow.com/questions/45135/why-does-the-order-in-which-libraries-are-linked-sometimes-cause-errors-in-gcc.
