---
layout: note
title: TUI
subtitle: Text User Interface
---

# NCurses
## Colors
According to https://dev.yorhel.nl/dump/nccolour:
>You can not assume that the default foreground or background colour can be 
>represented by one of the 8 basic colours defined by NCurses.  Specifying -1 
>as colour, to indicate the default foreground or background colour, seems to 
>work fine in any terminal tested so far.

## Line drawing characters

~~~sh
export NCURSES_NO_UTF8_ACS=1 
~~~

tells ncurses to always use Unicode box drawing characters when a UTF-8 locale is selected.
