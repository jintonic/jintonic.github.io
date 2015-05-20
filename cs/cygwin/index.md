---
layout: note
category: cs
title: cygwin
---

Issue of slow start of shell
============================

Disable the completion function of bash and it will be fixed:

~~~bash
$ cd /etc/profile.d
$ mv bash_completion.sh bash_completion.sh.disabled
~~~

One can enable completion manually this way:

~~~bash
$ . /etc/bash_completion
~~~

Ref: [code for concinity](http://cfc.kizzx2.com/index.php/cygwin-slow-start-up-the-culprit-discovered/)

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
- `echo "exec sleep infinity" > ~/.startxwinrc`
- launch "XWin Server" from windows


vifm
====

Install libcursesw, wget from setup.exe, wget vifm tar ball, and then

~~~bash
$ ./configure --without-libmagic --without-gtk --disable-extended-keys
~~~

mutt
====

Install mutt, msmtp, offlineimap, abook, ncurses (infocmp) from setup.exe

git
===

Install git, git-completion from setup.exe

taskwarrior
===========

Install cmake, gnutls from setup.exe, follow instructions in:

- http://taskwarrior.org/download/
- https://github.com/farseer90718/vim-taskwarrior
- https://freecinc.com/

w3m
===

Install w3m, squid from setup.exe. Add

~~~
dns_nameservers ???.???.???.??? ???.???.???.???
cache_dir ufs /var/cache/squid 1000 64 1024
~~~

to /etc/squid/squid.conf and run

~~~bash
$ squid -z # initialize some folders
$ squid -N -d1 # run squid not as a daemon with debug info
~~~

Set environment variable

~~~bash
export HTTPS_PROXY="http://localhost:3128"
export HTTP_PROXY="http://localhost:3128"
export FTP_PROXY="http://localhost:3128"
~~~

LaTeX
======

Install *texlive-collection-publisher* (*elsarticle*),
*texlive-collection-fontsrecommanded* (*txfonts*),
*texlive-collection-latexextra* (*tabulary.sty*), and
*texlive-collection-binextra* (*latexmk*) from *setup.exe*

