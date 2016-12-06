---
tags: [Linux, text editor, terminal, SSH, phys-492/592]
---

![ROOT macro opened in nano text editor]({{site.exa}}/root-macro-in-nano.png)

We edit texts in Microsoft Office, web browsers in a Windows PC very often. But
the concept of *text editor* is not very familiar to most *windows* users. Most
Windows programs have some level of text editing functionality built in. There
is no need for a dedicated *text editor*.

While in a Linux terminal, pretty much everything you do is text editing, being
typing in commands, writing programs, or changing configuration files. A
dedicated *text editor* is a must.

Many *text editors* run in Linux, for example, [Vim][], [Emacs][], [Gedit][],
[Sublime][], etc. All of them have huge regular user bases. If you just get
started to learn Linux, it is a bit too hard to make your first choice. The
good news is that you can choose any of them. They are all good enough for a
beginner.

That being said, the biggest consideration a beginner should keep in mind is
that how easy it is to learn the usage of an editor. From this point of view
the editor you need to choose is the one that most people around you use. This
way, it would be very easy for you to help hands-on help, which makes the whole
learning process smooth and fun. If you don't have anybody around to ask for
help, the default editor built in to the [MobaXterm][] would be the best
choice. It is basically a Windows program that you will feel natural to use.
Double click on a file in the [MobaXterm][] file browser, it will be downloaded
from the remote server to your local machine and be opened by the builtin
editor. Once you save the file, it will be uploaded to the server
automatically. There is actually nothing new to learn.

If you have a popular Linux distribution installed in one of your own
computers, just use an editor that pops up when you double click on a file in
your file browser. There is a big chance that you will open a [Gedit][]. It has
menus and tool bars to click, scroll bars to drag, and is not quite different
from a typical Windows program.

If you need to [SSH][] into a remote Linux server, most time it would be
painful to run an editor with many GUI components, such as menus and tool bars.
It takes ages to wait for them to show up or be updated in your local screen
over a slow network. [Gedit][] is not an option in this case. An editor that
runs in a terminal is preferred. Both [Vim][] and [Emacs][] can run in a
terminal, with the former being notably harder to learn for a beginner.


