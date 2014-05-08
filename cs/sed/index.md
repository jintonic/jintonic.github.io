---
layout: note
category: cs
title: sed
subtitle: stream editor
---

Basic concept
=============
```bash
$ sed -options 'address command' input.txt > output.txt
```

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
