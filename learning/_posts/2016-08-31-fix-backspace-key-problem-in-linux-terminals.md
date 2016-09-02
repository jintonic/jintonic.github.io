---
tags: [terminal]
---

Very often the backspace key in your terminal prints strange characters instead 
of deleting a letter on the left. The historic reason is explained in 
[this][bd] article. Basically, you need to dump the current terminfo to stdout, 
fix some keys using sed and save the result into a text file:

~~~bash
$ infocmp | sed 's/kbs=^H/kbs=\\177/'> ti.src
~~~

Compile the src file and save it to ~/.terminfo:

~~~bash
$ tic ti.src
~~~

[bd]:http://www.ibb.net/~anne/keyboard/keyboard.html
