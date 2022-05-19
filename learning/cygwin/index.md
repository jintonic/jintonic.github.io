---
layout: note
category: cs
title: cygwin
subtitle: Linux environment in Windows
---

[Cygwin][] provides a Linux environment in Windows that is best integrated with the host OS compared to other Linux implementations in Windows, such as [WLS][], [Docker][], etc. It feels just like a normal Windows program instead of a virtual machine running inside of the host OS.

[Cygwin]: https://www.cygwin.com
[WLS]: https://docs.microsoft.com/en-us/windows/wsl/install
[Docker]: https://www.docker.com

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

Install libncurses-devel, wget from setup.exe, wget vifm tar ball, and then

~~~bash
$ ./configure --without-libmagic --without-gtk --disable-extended-keys
~~~

mutt
====

Install mutt, msmtp, offlineimap, abook, ncurses (infocmp) from setup.exe

git
===

Install git from setup.exe

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
*texlive-collection-science* (*siunitx*),
*texlive-collection-fontsrecommanded* (*txfonts*),
*texlive-collection-latexextra* (*tabulary.sty*),
*texlive-collection-genericextra* (*iftex*, and
*texlive-collection-binextra* (*latexmk*) from *setup.exe*

sc
===

Install *bison*, from *setup.exe* and

~~~bash
git clone https://github.com/jintonic/sc.git
cd sc
make
~~~

R
===

Install *R* package in the *Math* section from *setup.exe*

