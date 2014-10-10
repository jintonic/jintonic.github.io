---
layout: note
category: cs
title: cygwin
---

Issue of wrong file permission
==============================

Turn on "noacl" option in /etc/fstab:

~~~
none /cygdrive cygdrive binary,noacl,posix=0,user 0 0
~~~

Ref: [cygwin forum](http://cygwin.1069669.n5.nabble.com/vim-and-file-permissions-on-Windows-7-td61390.html)

/cygwin/c to /c
===============
Change the following line in /etc/fstab

~~~
none /cygdrive cygdrive binary,noacl,posix=0,user 0 0
~~~

to

~~~
none / cygdrive binary,noacl,posix=0,user 0 0
~~~

X
===

- Install xinit from setup.exe
- touch ~/.startxwinrc
- launch "XWin Server" from windows


vifm
====

Install libcursesw, wget from setup.exe, wget vifm tar ball, and then

~~~bash
$ ./configure --without-libmagic --without-gtk --disable-extended-keys
~~~

mutt
====

Install mutt, msmtp, offlineimap, abook from setup.exe

git
===

Install git, git-completion from setup.exe
