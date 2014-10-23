---
layout: note
category: cs
title: terminal
---

Stop printing accidentally from rxvt
====================================

Explicitly set the following X resource of rxvt to something you like instead
of the default value: *lpr*:

~~~
Rxvt*print-pipe: cat > /path/to/somewhere/you/like
~~~

Fix special keys like <backspace>
=================================

Very often the backspace key in your terminal prints strange characters intead
of deleting a letter on the left. The historic reason is explained in
[this][bd] article. Basically, you need to dump the current terminfo to stdout,
fix some keys using sed and save the result into a text file:

~~~
$ infocmp | sed 's/kbs=^H/kbs=\\177/'> ti.src
~~~

Compile the src file and save it to ~/.terminfo:

~~~
$ tic ti.src
~~~

[bd]:http://www.ibb.net/~anne/keyboard/keyboard.html
