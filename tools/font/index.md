---
layout: note
category: cs
title: font
---

Warning: Missing charsets in String to FontSet conversion
=========================================================

This is a very annoying warning message when you run some old X applications,
such as *xterm*, *xfig*, *xdvi*, etc. The short explanation is that you set
your locale to UTF-8. It requires fonts to display various languages. It is
hard for you to install all required fonts from the beginning. A long
explanation can be found
[here](http://www.holoweb.net/~liam/fonts/common-linux-font-problems.html). The
easiest solution is to install *font-isas-misc*, *font-jis-misc*,
*font-daewoo-misc* and restart your X, as suggested
[here](https://cygwin.com/ml/cygwin-xfree/2010-08/msg00006.html).

web font
========

It is now possible to use a font from a web server instead from the user\'s
local machine. For example, [Google fonts](https://www.google.com/fonts)
provides a lot of free fonts, which can be used in the css file. Once a web
font is used to display a web page, the page will be shown with the same font
in different browsers and OS.
