---
layout: note
category: cs
title: screen
subtitle: virtual terminal manager
---

Basic concept
=============

One won't find anything relevant if he searches in Google with the keyword
*screen*. The full name of this program is *GNU screen*. It is a program to
create multiple virtual terminals in a physical terminal. It provides a set of
commands (the commonly used ones are binded to hot keys) to create, delete,
switch in between virtual terminals. By default, *Ctrl-a* is used to tell
screen that the following key stroke is a hot key binded for a command to
manipulate virtual terminals, instead of a key that is sent to the shell. It is
basically a mode switch key. It switches from working-in-a-shell mode to
manipulate-virtual-terminal mode.

Setups
======

Use the function keys
---------------------

F1 ~ F12 are not used by shell. They can be set in *~/.screenrc* as hot keys
for screen command without switching mode, for example,

~~~
bindkey -k k1 select 1 # press F1 to select window 1
bindkey -k k2 select 2 # press F2 to select window 2
bindkey -k k3 select 3 # press F3 to select window 3
bindkey -k k4 select 4 # press F4 to select window 4
bindkey -k k5 select 5 # press F5 to select window 5
bindkey -k k6 select 6 # press F6 to select window 6
bindkey -k k7 select 7 # press F7 to select window 7
bindkey -k k8 select 8 # press F8 to select window 8

# press F9/F10 to scroll up/down
bindkey -k k9 eval "copy" "stuff ^u"
bindkey -k k; eval "copy" "stuff ^d"
bindkey -m -k k9 stuff ^u
bindkey -m -k k; stuff ^d

bindkey -k F1 prev # press F11 to go to previous window
bindkey -k F2 next # press F12 to go to next window
~~~

The *-k* option tells the *bindkey* command the following string is not a
normal string but a [termcap keyboard capability
name](https://www.gnu.org/software/termutils/manual/termcap-1.3/html_chapter/termcap_5.html)

Use the title bar of physical terminal
--------------------------------------

Tells screen to use the hard status line (normally the title bar of the
terminal window) to display messages:

~~~
hardstatus on
~~~

Change mode-switch key
----------------------

The default mode-switch key *Ctrl-a* is not convenient to type and conflict
with the shell shortcut for moving to the start of a line. Vi uses *Esc* to
switch between insert and command modes. One can use the key below it, that is,
*`* as the mode-switch key for screen. This can be done by insert the following
command in ~/.screenrc:

~~~
escape ``
~~~

SHELL Setups for GNU Screen
===========================

If PATH and aliases are set in .bashrc, there is no need to set each screen
window a login shell, which can be done by putting the following command to
.screenrc 

~~~ 
shell -$SHELL
~~~

The title of a screen window can be set by the following command

~~~
  shelltitle "] |bash"
~~~

According to screen manual, the string after | is the default title for a new
screen window, the one before | is the last part of the shell prompt, which is
used to tell screen to use the first word after the prompt as the title. One
more setup is needed in .bashrc to make the whole thing work:

~~~bash
case "$TERM" in
screen)
  PROMPT_COMMAND='echo -ne "\033k\033\\"'
  ;;
*)
  ;;
esac
~~~ 

