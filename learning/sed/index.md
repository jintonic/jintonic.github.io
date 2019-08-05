---
layout: note
title: sed
subtitle: stream editor
---

# Basic concept

~~~shell
$ sed -options 'address command' input.txt > output.txt
~~~
It reads every line in "input.txt", do something if the line is specified in
the "address" before "command".

To see output from only matched lines, one need to use option "-n" or
"--quiet" or "--silent"

The command 's/something/another/' won't print out anything. One has to add p
in the end to print 's/somthing/another/p'

The "-e" option before each command is used to chain multiple commands
together.

One may find almost everything about sed in [Grymoire][grymoire] and
Stack Overflow.

[grymoire]: http://www.grymoire.com/unix/Sed.html

# Search something in one line, change something in the next line

~~~shell
sed '/patternInALine/N; s/patternInNextLine/newString/' inputFile
~~~
where `N` is used to join the next line to the current line.
