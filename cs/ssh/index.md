---
layout: note
category: cs
title: ssh
subtitle: Secure Shell
---

Send multiple line commands over ssh
====================================

~~~bash
#!/bin/sh
ssh -T usr@host <<'CMDS'
for pid in `ps aux | grep badThings | awk '{print $2}'`
do
  kill -9 $pid
done
CMDS
~~~

*NOTE* The single quotes around the first *CMDS* prevent the shell to expand
variables before sending them to the remote machine. Without it, the dollar
sign in the awk command has to be escaped to prevent expansion.

*NOTE* One cannot specify the remote shell used to execute the multiple line
commands sent by ssh. The default shell for the user "usr" will be used.

SOCKS proxy
===========

If a remote sshd server has the following setup:

~~~
AllowTcpForwarding yes
~~~

and is connected to the Internet, one can ssh into it and use terminal browsers
(w3m, lynx for example) to surf the web. A better way to do this is to forward
local network request to the remove server through ssh connection. The command

~~~bash
$ ssh -fN -D 8925 remote.server
~~~

establishes a SOCKS proxy at localhost:8925, which delegates all kinds of
network connections through the *remote.server*. Option *f* put ssh into
background, *N* tells ssh not to start a remote shell at all. Change the port
number to a one that won't give you one of the following error messages:

~~~
bind: Operation not permitted
~~~

or

~~~
bind: Address already in use
~~~

This can be set permanently in *~/.ssh/config*:

~~~
Host remote.server
DynamicForward localhost:8925
~~~

One can then set local applications to use this SOCKS proxy. Take firefox as an
example, go to *about:config* and change the following settings:

network.proxy.socks         | 127.0.0.1
network.proxy.socks_port    | 8925
network.proxy.socks_version | 5
network.proxy.type          | 1

The last one is used to toggle the use of SOCKS proxy. The others can be set
permanently.

References:

- [https://www.mikeash.com/ssh_socks.html](https://www.mikeash.com/ssh_socks.html)
- [http://blog.sanctum.geek.nz/ssh-socks-and-curl/](http://blog.sanctum.geek.nz/ssh-socks-and-curl/)

