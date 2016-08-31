---
tags: [Linux, SSH, phys-492/592]
---

![Windows Command Prompt]({{site.exa}}/win.cmd.png)

Press the key with the *Windows* logo, and then type `cmd` and 
<kbd>Enter</kbd>, you will be able to open a terminal in *Windows* as shown in 
the top screen shot. Try to type in the following commands followed by 
<kbd>Enter</kbd> one by one and see what will happen:

``` shell
C:\Users\username>dir
C:\Users\username>cd Documents
C:\Users\username\Documents>dir
C:\Users\username\Documents>start somefile.pdf
```

Your daily routine of going to a folder and opening a file in a *Windows* file 
browser can be also done by typing in command in a terminal. Actually, almost 
everything you do daily with your *Windows* PC can be done using a terminal 
instead.

Now, this terminal is used to control your own PC. If you can type in some 
command in the terminal to connect to a remote computer, you can also use the 
terminal to control the remote machine. The command you need is called `ssh`. 
A free and small program called [PuTTY][] integrates these two together. It 
provides you a terminal to `ssh` into a remote computer that has a `ssh` 
server waiting for remote connections. What I like most is that you can start 
to use [PuTTY][] right after downloading it. No installation is needed. This 
makes it possible for you to used it in any *Windows* PC that has internet 
connection without using an administrator account.

There are many varieties of [PuTTY][]. The one I would recommend here is 
called [PuTTYtray][]. It integrates some useful extensions to the original 
[PuTTY][]. The best feature it provides is the portability. You can choose not 
to save any setting in the local PC's registry. Instead, settings can be saved 
into files, which can be carried with you using a USB stick or saved in a 
cloud storage service, as shown in the following screen shot. A nice default 
setup for connecting to hpc.usd.edu can be downloaded from 
[here]({{site.exa}}/puttytrayhpcsession).

![PuTTYtray]({{site.exa}}/puttytray.png)

It is as simple as 1,2,3 to use it:

1. type in host name
2. click the *Open* bottom

Optionally, one can type in a session name and save the settings to a file.

If this is the first time for you to connect to an `ssh` server, you will be 
asked to save the server's key (It's like the server's ID). Simply select 
*Yes* and you will be given a terminal for you to type in your user name, 
password as shown in the following screen shot:

![PuTTY login screen]({{site.exa}}/puttylogin.png)

Once logged in successfully, you will be able to use this terminal to issue 
commands to the remote machine:

![PuTTY controlling remote server]({{site.exa}}/puttyconnected.png)

[PuTTY]:http://www.putty.org
[PuTTYtray]:https://puttytray.goeswhere.com
