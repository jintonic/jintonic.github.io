---
layout: note
title: Doxygen
---

# Installation

[Graphviz][] is recommended to be installed to provide the [dot][] command that can be used by Doxygen to generate diagrams showing class relationship.

# Get started

~~~sh
cd /path/to/project
doxygen -g # generate configuration file Doxyfile
vi Doxyfile # tune settings
doxygen Doxyfile # generate documents according to settings in Doxyfile
~~~

The configuration file `Doxyfile` generated above is very long since it contains a lot of comments. If you want to put it under version control, it is better to strip off all the comments using the `s` option:

~~~sh
# update existing Doxyfile and strip off all comments in it
doxygen -s -u Doxyfile
~~~

The following setup needs to be enabled to use [dot][] to generate diagrams:

~~~
HAVE_DOT = YES
~~~

The following setup needs to be set to *NO* in order not to include into the generated documents the absolute file path, which is likely to be different in different developer's local disk.

~~~
FULL_PATH_NAMES = NO
~~~

# Documenting

- Doxygen is designed to document interfaces between different parts of a program. Concrete implementation of a function, such as local variables are not meant to be shown in the generated web pages.
- The `main` function will not be automatically documented. One has to explicitly include the `fn` keyword in the comment block before it. Moreover, the file that contains the `main` function has to be documented as well, otherwise, the `main` function documentation won't appear in the generated web pages. The easiest way to document a file is to simply add the `file` keyword in it.

# Version information
- Markdown support is available with Doxygen version >= 1.8.0.
- README.md as mainpage is possible with Doxygen version >= 1.8.3:

~~~
INPUT = README.md src/
USE_MDFILE_AS_MAINPAGE = README.md
~~~

- g++4.1 cannot be used to compile Doxygen, g++4.4 works.

[Graphviz]: http://www.graphviz.org 
[dot]: http://www.graphviz.org/pdf/dotguide.pdf
