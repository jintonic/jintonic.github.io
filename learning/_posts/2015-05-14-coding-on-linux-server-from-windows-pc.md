---
tags: [Windows, Linux, text editor, SSH, X-window, phys-492/592]
---

![MobaXterm screen shot](http://mobaxterm.mobatek.net/img/moba/features/feature-sftp-browser.png)

As a student in physics, you will be asked to program on a Linux or Unix server
sooner or later. You will be overwhelmed by concepts like *SSH*, *X-window*,
*SHELL*, *VIM* or *EMACS*. Don't panic! You may stay with your familiar Windows
interface, all you need is just two windows programs and a 101-level online
Linux command-line guide, and you can start programming on a server from your
Windows PC!

The first program is called [MobaXterm](http://mobaxterm.mobatek.net/). It
allows you to connect from your Windows PC to the Linux server, run commands on
the server, download/upload files from/to the server, and most importantly,
edit files on the server with your Windows program. A very creative feature
provided by *MobaXterm* is to let the SFTP window (left panel in the top screen
shot) follow the terminal folder (right panel in the top screen shot), *i.e.*,
if you chance folder in your terminal, its contents will be shown in the left
panel automatically. Double click on a file in the left panel will download
that file to the Windows PC and open the local copy with a text editor
specified in *MobaXterm*'s settings window. Once you save your changes, the
updated local copy will be automatically uploaded to the server. In case that a
file type is not associated with the default editor (Surprisingly, *.cc* suffix
is not associated with the default text editor shipped together with
*MobaXterm*), one can right click the file and select "Open with default text
editor" to open it. One cannot associate any file type to the default text
editor shipped with *MobaXterm* in windows system because it is embedded in
*MobaXterm*, and not a standalone executable.

The default text editor shipped together with *MobaXterm* is good enough for
most of the tasks you may face as a student. In case that you need some fancy
features, like [column mode
editing](https://notepad-plus-plus.org/features/column-mode-editing.html), you
need a more sophisticated text editor.
[Notepad++](http://mobaxterm.mobatek.net/) is one of the best in Windows. It is
free. Don't be fooled by its slightly outdated looking. It provides most
commonly used editing features out of box. You will have to be an experienced
user to enable similar features in *VIM* or *EMACS*. The default settings of
*Notepad++* are good enough. I do recommend change the *Tab Settings*, which
can be accessed from *Settings* in the top menu bar, and then *Preferences...*.
You'd better check the box in front of the option "Replace by space". This will
insert spaces instead of a real tab when you type <kbd>Tab</kbd> to indent a
line. This will ensure the same indention when the file is opened directly on
the server in *VIM* or *EMACS*.

![Notepad++ screen shot](https://notepad-plus-plus.org/assets/images/notepad4ever.gif)

