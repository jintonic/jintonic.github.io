---
tags: [Linux, text editor, terminal, SSH]
---

![ROOT macro opened in nano text editor]({{site.ina}}/root-macro-in-nano.png)

We edit texts in Microsoft Office, web browsers in a Windows PC very often. But
the concept of *text editor* is not very familiar to most *windows* users. Most
Windows programs have some level of text editing functionality built in. There
is no need for a dedicated *text editor*.

While in a Linux terminal, pretty much everything you do is text editing, being
typing in commands, writing programs, or changing configuration files. A
dedicated *text editor* is a must.

Many *text editors* run in Linux, for example, [Vim][], [Emacs][], [Gedit][],
[Sublime Text][], etc. All of them have huge regular user bases. If you just
get started to learn Linux, it is a bit too hard to make your first choice. The
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
from the remote server to your local machine and be opened by the built-in
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
terminal, with the former being notably harder to learn for a beginner. The
most important concept of [Vim][] is its mode operation, commands and movement
with simple key strokes and their combinations. It is definitely beneficial to
learn [Vim][] since its concept influenced many Linux programs. But the mode
operation is quite counter-intuitive for a regular Windows user. [Emacs][]
behaves more like a Windows program than [Vim][]. But one needs to know many
key combinations to do some basic things in its terminal version. [Emacs][] has
a very good built-in tutorial. The problem is that a regular Windows user does
not have the habit to read in detail a manual to find out those key combinations.

Modern text editors like [Sublime Text][] would be easier to learn for a
beginner than [Emacs][] because their default key bindings are more Windows
like. And they generally have much better mouse support. The problem is that
they are not generally available in Linux servers. As a beginner, it is too
much to install an editor by yourself.

The screen shot at the beginning of this post is another terminal based text
editor, [Nano][]. It is virtually available in almost every Linux machine. It
is modeless, just like [Emacs][]. Its advantages over [Emacs][] are 

- the last two lines are used to show key bindings to common editing functions.
  There is no need for a first time user to read any tutorial or manual to use
  it,
- and it starts much faster.

The only potential problem for a beginner is that the default key bindings are
too unique. They are not used by any other programs. Memorizing those key
bindings would not help you use other Linux programs at all. Fortunately, this
is very easy to fix. [Nano][] allows you to redefine key shortcuts to any of
its functions in its configuration file `~/.nanorc`. Here is a set of shortcuts
that resemble Windows and bash behaviors:

```bash
bind ^H help main # bound to backspace by default

bind M-D cutwordright main # not used by default
bind ^W cutwordleft main # bound to search by default
bind M-F nextword main # bound to toggle multibuffer by default
bind M-B prevword main # bound to toggle backup file by default 
bind ^F whereis main # bound to go forward one letter by default
bind ^G searchagain main # bound to help by default
bind ^R replace main # bound to insert another file by default

bind ^Q exit main # not used by default
bind ^S savefile main # not used by default
bind M-S writeout main # bound to toggle smooth scrolling
bind ^O insert main # bound to writeout by default

bind ^C copytext main # bound to show cursor position by default
bind ^X cut main # bound to exit by default
bind ^V uncut main # bound to next page by default
bind ^Space mark main # bound to forward one word by default
bind M-Space mark main # bound to backward one word by default

bind ^U undo main # bound to uncut by default
bind ^Y redo main # bound to preivous page by default

bind ^I indent main # bound to tab by default
bind ^B unindent main # bound to back a letter by default

bind M-C comment main # bound to toggle cursor position by default
```

It allows you to use the following common key bindings in Windows,
<kbd>Ctrl</kbd>+<kbd>x</kbd>/<kbd>c</kbd>/<kbd>v</kbd>, to cut/copy/paste, and 
<kbd>Ctrl</kbd>+<kbd>o</kbd>/<kbd>s</kbd>/<kbd>q</kbd>, to open/save/quit, and
<kbd>Ctrl</kbd>+<kbd>f</kbd>/<kbd>g</kbd>/<kbd>r</kbd>, to
search/repeat/replace. It also allows you to use common bash shortcuts to edit
text. Don't forget to put the following setting in `~/.nanorc` to enable mouse
in [Nano][]:

```bash
set mouse # Alt-M to toggle it on and off in nano
```

With all these configurations, [Nano][] would be the best choice as a terminal
based text editor for a Linux beginner.

[Micro][] is a modern text editor that is meant to replace [Nano][]. It has a
regular key bindings by default and a better mouse support. It is also very
easy to install. You just need to place the binary in to your path. However, it
relies on X-window programs to perform copy/paste in between itself and other
programs, which makes such basic functions awfully slow over a network. While
[Nano][] just relies on the typical mouse select and middle click to copy and
paste, which is provided by its host terminal.

[Vim]:https://en.wikipedia.org/wiki/Vim_%28text_editor%29
[Emacs]:https://www.gnu.org/software/emacs/
[Gedit]:https://wiki.gnome.org/Apps/Gedit
[Sublime Text]: https://www.sublimetext.com/
[MobaXterm]:{% post_url learning/2015-05-14-coding-on-linux-server-from-windows-pc %}
[Nano]:https://www.nano-editor.org/
[Micro]:https://micro-editor.github.io/
