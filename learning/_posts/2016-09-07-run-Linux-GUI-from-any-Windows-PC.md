---
tags: [Windows, Linux, X-window, SSH, phys-492/592]
---

[One can use PuTTY to log into a remote Linux server from any Windows PC]({% 
post_url 2016-08-29-connect-to-Linux-from-any-Windows-PC %}). However, this 
will only give you a command line user interface (CLI). Of course, CLI is 
powerful enough for you to do most of your analysis task remotely, but sooner 
or later you will hit the limit of it when you want to visualize your analysis 
results as plots. This when you need the help of the [X-window][] system in 
version 11. According to the [wikibooks][X-window]:

> X11 is the graphical environment for most Unix or Unix-like systems ... If 
> we want to draw graphics..., we must run a program that knows how to do 
> this. We start an X11 program called the X server...the X server waits for X 
> clients to connect. An X client is a program like Firefox ...which wants to 
> make one or more windows on the screen.

The client-server architecture has a very interesting consequence, that is, 
you can display and control a single remote Linux graphical program in your 
local PC. This is very different from the [Windows Remote Desktop 
Connection][RDC] where the whole remote desktop is shown. In case of 
[X-window][], you can choose only to show a specific program that you will 
actually use.

When we mention a *server*, we always refer to a remote Linux machine or a 
daemon program running in the server (an SSH server for example). This gives 
us an illusion that a server is always something existing remotely. A slightly 
confusing aspect of the [X-window][]'s client-server concept is that the *X 
server is running in your local PC* and the *X client is running in the remote 
Linux server*. You display and control the X client using your local X server, 
but the client is actually running in the remote Linux server!

There are [X-window][] server programs for most main stream OS, let it be 
Linux, Windows or Mac OS. At least three free [X-window][] server programs 
exist for Windows: [Cygwin/X][], [Xming][] and [MobaXTerm][]. The first one is 
slightly difficult for a beginner to install and run. The last one is more 
than an [X-window][] server, it provides many other features and is covered by 
a [separated post][MobaXTerm]. We are going to talk about [Xming][] in this 
post.

A portable [Xming][] shipped together with [PuTTYtray][] is available as 
[Xming+PuTTY on a Stick][stick]. You don't have to install it. You just need 
to download it, extract it (if you cannot extract it to `C:`, just extract it 
to your desktop) and run it:

![extract Xming+PuTTY on a Stick to local disk]({{site.exa}}/extractXming.png)

![run Xming+PuTTY from the notification area]({{site.exa}}/runXmingPuTTY.png)

The [PuTTYtray][] shipped in [Xming+PuTTY on a Stick][stick] has many saved 
sessions, which can be safely deleted if you don't need them. Now you can 
follow [this post]({% post_url 2016-08-29-connect-to-Linux-from-any-Windows-PC 
%}) to configure your [PuTTYtray][]. One extra setting that is a must to 
enable communication between the [X-window][] server and clients through SSH 
is called "Enable X11 forwarding" as shown in the following screen shot:

![enable X11 forwarding in PuTTY]({{site.exa}}/EnableX11forwardingPuTTY.png)

Once you log into the remote Linux server using PuTTY, type the following 
command to bring up a graphical program:

``` bash
$ emacs sinefunction.C & # open file using graphical text editor in background
```

Assuming that you have the graphical text editor [Emacs][] installed in your 
Linux server, you should now be able to see something like the following 
screen shot:

![remote Emacs displayed in local X server with X11 forwarding 
enabled]({{site.exa}}/remoteEmacs.png)

If the "Enable X11 forwarding" box is unchecked in [PuTTYtray][] or the X 
server is not running, you are going to see some error messages like this: 
`Xlib: connection to "localhost:xx.0" refused by server ...` and no graphical 
program can be run.

One thing new to us here is the `&` sign after the command `emacs 
sinefunction.C`. It is used for the SHELL to send the job of running `emacs` 
to the background so that you can still use your SHELL command prompt. If you 
forget to add it and cannot get access to your prompt anymore, don't panic, 
simply bring up your PuTTY window, hold <kbd>Ctrl</kbd> key and press 
<kbd>z</kbd> to suspend `emacs`. Now you should have your prompt back again. 
However, since `emacs` is suspended, you cannot use it anymore. Don't panic! 
Type the following command after your prompt and your `emacs` is alive again:

``` bash
$ bg # let the suspended program to run in background
```

You can check how many jobs are running in background using the following 
command:

``` bash
$ jobs # list jobs running in background
```

The result is shown in the following screen shot:

![bash job control]({{site.exa}}/bashjobcontrol.png)

Enjoy the pleasure of being able to use your mouse to click around again :)

[X-window]:https://en.wikibooks.org/wiki/Guide_to_X11/Introduction
[RDC]:https://support.microsoft.com/en-us/help/17463/windows-7-connect-to-another-computer-remote-desktop-connection#1TC=windows-8
[Cygwin/X]:http://x.cygwin.com
[Xming]:https://sourceforge.net/projects/xming
[MobaXTerm]:{% post_url 2015-05-14-coding-on-linux-server-from-windows-pc %}
[PuTTYtray]:https://puttytray.goeswhere.com
[stick]:http://www.scrc.umanitoba.ca/doc/tutorial/T19_3a_xmingputty.htm
[Emacs]:https://www.gnu.org/software/emacs
