---
tags: [C++, Makefile, ROOT]
---

```cpp
main()
{
  int a = 2;
  int b = 3;
  int c = a*b;
}
```

### Get started

Let's start with this short and not-quit-correct program. Save it to a file called `test.cc`. `test.C` or `test.cpp` works just as well.

Your computer does not understand this at all. You need to convert it to a format that the machine can understand using a program called **compiler**. A standard C++ compiler in Linux is called `g++`. So you can run

```sh
$ g++ test.cc # compile test.cc using g++
$ ls # check what is created by g++
a.out  test.cc
```

to create `a.out` from `test.cc` using `g++`. `a.out` is an executable, you can run it this way:

```sh
$ ./a.out # run a.out in the current directory (./)
```

Of course, nothing will show up in your terminal. To print out the result of the calculation, you need to modify your program a bit:

```cpp
#include <iostream>
main()
{
  int a = 2;
  int b = 3;
  int c = a*b;
  std::cout<<c<<std::endl; // print the value of c on screen
}
```

`<<` indicates the flow of data. `std::cout` is something declared in `iostream.h`. It means the standard output, or your terminal screen. `std::endl` is declared in `iostream.h` as well. It means the end of a line, or an <kbd>Enter</kbd> to start a new line. Everything behind `//` are comments and will be ignored by the compiler. `#include <iostream>` tells the compiler where to search for declarations of `std::cout` and `std::endl`.

Compile the modified `test.cc` again and run it:

```sh
$ g++ test.cc
$ ./a.out
6
```

Now the calculation result is printed in your terminal screen.

`a.out` is not a very good name. You can change the name of the comfile file using the `o` (outut) option of `g++`:

```sh
$ g++ test.cc -o test.exe
$ ls
test.exe  test.cc
```

As I mentioned at the beginning, `test.cc` is not quit correct. To see what's wrong, you can instruct `g++` to print out useful warning messages to help us debug:

```sh
$ g++ -Wall test.cc # turn on "all" Warnings
test.cc:3:7: warning: ISO C++ forbids declaration of 'main' with no type [-Wreturn-type]
 main ()
       ^
```

The warning message is quite clear. The C++ standard forbids to declear the `main` function without any return type. To get rid of this warning, you need to add `int` in front of `main`:

```cpp
int main()
```

Try to compile again. The warning message should disappear.

### Use libraries

From the simple program above we learned that you can call functions written by others in your program, for example, `std::cout` in `iostream`.  Now we are going to call a random number generating function provided by [ROOT][]:


```cpp
#include <iostream>
#include <TRandom.h>
int main()
{
  TRandom generator; // create an object of the class TRandom
  std::cout<<generator.Rndm()<<std::endl; // call TRandom's public member function Rndm()
}
```

Run `g++ test.cc` and you will get

```sh
test.cc:2:22: fatal error: TRandom.h: No such file or directory
 #include <TRandom.h>
                    ^
compilation terminated.
```

The second `include` causes the problem while the first does not. This is because the second is not as standard as the first one. You need to instruct `g++` the location of `TRandom.h`:

```sh
$ g++ -I /path/to/include/ test.cc
```

This will fixed the previous error, but create more error messages, which is so long that you'd better save them to a log file so that you can check the start of them easily:

```sh
$ g++ -I /path/to/include/ test.cc > log 2>&1
```

Search on Google `bash error redirect` if you don't understand the meaning of `2>&1`. Now open `log` and you should be able to allocate the following two lines close to the beginning of the output:

```sh
#  error "ROOT requires support for C++11 or higher."
#  error "Pass `-std=c++11` as compiler argument."
```

which says that ROOT related program needs to be compiled with `c++11` standard. Follow this instruction:

```sh
$ g++ -std=c++11 -I /path/to/include/ test.cc
```

You will get some new error messages:

```sh
/tmp/ccmm4zlO.o: In function `main':
test.cc:(.text+0x1c): undefined reference to `TRandom::TRandom(unsigned int)'
test.cc:(.text+0x2b): undefined reference to `TRandom::Rndm()'
test.cc:(.text+0x6f): undefined reference to `TRandom::~TRandom()'
test.cc:(.text+0x88): undefined reference to `TRandom::~TRandom()'
/tmp/ccmm4zlO.o: In function `__static_initialization_and_destruction_0(int, int)':
test.cc:(.text+0xe7): undefined reference to `TVersionCheck::TVersionCheck(int)'
collect2: error: ld returned 1 exit status
```

This is because `TRandom.h` only declares the class `TRandom` and the function `Rndom()`, but the real definition of them are saved in a separated file called `libMathCore.so`, which is a shared object (`.so`), or a shared library file. You need to instruct `g++` to link your executable with this library for the executable to run properly:

```sh
$ g++ -std=c++11 -I /path/to/include/ test.cc -L /path/to/ROOT/lib -lCore -lMathCore
```

### Makefile

It is too much to type such a long command just to compile such a simple program. You'd better save this command somewhere so that you can use it later. A standard way to do this is to create a `Makefile` together with your `test.cc`:

```makefile
test.exe: test.cc
	g++ -std=c++11 -I /path/to/include/ test.cc -o test.exe -L /path/to/ROOT/lib -lCore -lMathCore
```

This is called a rule. Check the [make manual](https://www.gnu.org/software/make/manual/html_node/Rule-Introduction.html#Rule-Introduction) to understand the structure of a Makefile rule. Be aware that the second line (called recipe of rule) must start with a real `Tab` instead of a few spaces.

Now you can run

```sh
$ make
```

to compile `test.cc` to `test.exe`.

#### Automatic Variables
We typed `test.cc` and `test.exe` in the recipe of the rule above. But they are simply the prerequisite and the target of that rule. In principle, you have already told make all the information it needs. Indeed, make remembers them. You can use two automatic variables in your recipe to refer to them without defining the two variables (that's why they are called automatic ones):

```makefile
test.exe: test.cc
	g++ -std=c++11 -I /path/to/include/ $? -o $@ -L /path/to/ROOT/lib -lCore -lMathCore
```

where `$?` refers to `test.cc` and `$@` refers to `test.exe`. There is a full [list of automatic variables in the make manual](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables).

#### Implicit Variables
There is a standard name for each part of the recipe. For example, `g++` is called the compiler, `-std=c++ -I...` are flags. Make maintains a [list of standard names](https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html#Implicit-Variables) (Implicit variables) to refer to the individual parts. If we use these standard names, the `Makefile` can be rewritten as

```makefile
CXXFLAGS = -std=c++11 -I/path/to/include/
LDLIBS = -L/path/to/ROOT/lib -lCore -lMathCore
test.exe: test.cc
	$(CXX) $(CXXFLAGS) $? -o $@ $(LDFLAGS) $(LDLIBS)
```

You don't have to define `$(CXX)`, since it has a default value of `g++`.

#### root-config
ROOT provides a command `root-config` for you to figure out the contents of these standard parts. Run `root-config --help` to learn more about it. Our `Makefile` can be modified to work on any machine that have ROOT properly installed:

```makefile
CXXFLAGS = $(shell root-config --cflags)
LDLIBS = $(shell root-config --libs)
test.exe: test.cc
	$(CXX) $(CXXFLAGS) $? -o $@ $(LDFLAGS) $(LDLIBS)
```

`$(shell a-shell-command)` is how you call `a-shell-command` in a Makefile and get the output of it.

#### Multiple targets

Now let's add another C++ source file, `gaus.cc` into this directory. We need to add another rule in our Makefile to compile it:

```makefile
CXXFLAGS = $(shell root-config --cflags)
LDLIBS = $(shell root-config --libs)
test.exe: test.cc
	$(CXX) $(CXXFLAGS) $? -o $@ $(LDFLAGS) $(LDLIBS)
gaus.exe: gaus.cc
	$(CXX) $(CXXFLAGS) $? -o $@ $(LDFLAGS) $(LDLIBS)
```

However, if you run `make` in your terminal, only `test.cc` will be compiled. This is because `make` without any argument will only run the first rule. To run a specific rule, you need to pass the target name of that rule to `make`:

```sh
$ make gaus.exe
```

What if you want to compile both of them? You need to add a special rule that depends on both exe files:

```makefile
all: test.exe gaus.exe
```

Keep this as the first rule so that you can run it when you call `make` without any argument. This rule does not have any recipe. The sole purpose of it is to call rules related to `test.exe` and `gaus.exe`.

#### Phony targets

Unlike `test.exe` and `gaus.exe`, `all` is not really a file. It is just the name of a target. We call it a phony target. To make this point clear so that make won't do something for a file named `all` in the directory, we need to add the following line to your Makefile:

```makefile
.PHONY: all
```

There are some standard phony targets you may consider to add in your Makefile:

```makefile
.PHONY: all clean install info
clean:
	$(RM) *.exe
install:
	mv *.exe ~/bin
info:
	@echo $(CXXFLAGS)
	@echo $(LDLIBS)
```

where `$(RM)` is another implicit variable. It has a default value of `rm -f`. The `@` in front of `echo` is to suppress the print out of the recipe itself in the terminal window.

#### Pattern-specific variable values

The two rules for `test.exe` and `gaus.exe` are very similar. It would be nice if we can combine them in one rule. You can achieve this through the [patter-specific variable values](https://www.gnu.org/software/make/manual/html_node/Pattern_002dspecific.html#Pattern_002dspecific):

```makefile
all: test.exe gaus.exe
%.exe: %.cc
	$(CXX) $(CXXFLAGS) $? -o $@ $(LDFLAGS) $(LDLIBS)
```

The second rule can be applied to any pair of `.exe` and `.cc` files.

#### wildcard

Now if we want to add another C++ source file, `rndm.cc`, to the directory, we just need to add `rndm.exe` to the list after `all`:

```makefile
all: test.exe gaus.exe rndm.exe
```

It would be nice if we can automate this step. You can achieve this using a make function called `wildcard`:

```makefile
SRC = $(wildcard *.cc)
EXE = $(SRC:.cc=.exe)
all: $(EXE)
```

The first line creates a list of all files that end with `.cc` and save it in `$(SRC)`. The second line changes the suffix of every entry in `$(SRC)` from `.cc` to `.exe` and save the new list in `$(EXE)`. The third line uses this list.

Now, when you add a new `.cc` file in this directory, you can compile it with `make`. But there is no need to modify the Makefile anymore.

#### Implicit rules

A command in Linux normally does not end with `.exe`. We can remove it from our final executables:

```makefile
%: %.cc
	$(CXX) $(CXXFLAGS) $? -o $@ $(LDFLAGS) $(LDLIBS)
```

This way, `test.cc` will be compiled to `test` instead of `test.exe`. This rule is so commonly used that `make` includes it as an [implicit rule](http://www.gnu.org/software/make/manual/html_node/Implicit-Rules.html). You don' even need to write it in your Makefile. Remove it and your final Makefile looks like this:

```makefile
SRC = $(wildcard *.cc) # match all files that end with .cc
EXE = $(SRC:.cc=)      # remove .cc from those file names

# set up flags that help g++ to find ROOT headers and libs
CXXFLAGS = $(shell root-config --cflags)
LDLIBS = $(shell root-config --libs)

.PHONY: all clean install info # declare phony targets

all: $(EXE)                    # default target

clean:
	$(RM) $(EXE)

install:
	mv $(EXE) ~/bin

info:
	@echo CXXFLAGS = $(CXXFLAGS)
	@echo LDLIBS = $(LDLIBS)
	@echo SRC = $(SRC)
	@echo EXE = $(EXE)

```

[ROOT]: https://root.cern.ch
