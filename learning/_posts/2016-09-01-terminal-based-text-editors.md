---
tags: [text editor, phys-492/592]
---

When you [log into a Linux machine using PuTTY from a Windows PC]({% post_url 
learning/2016-08-29-connect-to-Linux-from-any-Windows-PC %}), you need a 
terminal based text editor to create or modify text files. If all you want to 
do is to read a text file, you need the following commands instead of a text 
editor:

``` bash
$ cat README.txt # dump contents of README.txt to terminal
$ head -6 README.txt # dump the first 6 lines of README.txt to terminal
$ tail -7 README.txt # dump the last 7 lines of README.txt to terminal
$ less README.txt # use the whole terminal to show README.txt
```

`less` will occupy the whole terminal window to show the contents of a file. 
It is very useful for reading a file that is much longer than what can be 
shown in a small terminal window. You can use <kbd>space</kbd> to move down 1 
page, and <kbd>b</kbd> to move up 1 page. For finer scrolling, press 
<kbd>j</kbd> to scroll down only one line, <kbd>k</kbd> to scroll up one line. 
You can search a word by pressing <kbd>/</kbd> first and then typing in the 
word you want to search for. If there are multiple occurrences of the word, 
you can used <kbd>n</kbd> to jump to the `n`ext occurrence, and <kbd>p</kbd> 
to jump to the `p`revious occurrence. If you are done with browsing, press 
<kbd>q</kbd> to quit `less` and go back to the command prompt. If you want to 
change something in the file, press <kbd>v</kbd> to open it using the default 
text editor.

The default text editor is set through an environment variable using the 
following command:

``` bash
export VISUAL='yourFavoriteTextEditor'
# or
export EDITOR='yourFavoriteTextEditor'
```

Save the setting to your `.bashrc` if you want to use this setting for later 
ssh sessions.

If none of the environment variable (`$VISUAL` or `$EDITOR`) is set, `less` 
will use `vi` to edit the file. [Vi][] is one of the oldest and most popular 
text editors together with [Emacs][]. [Vi][] is quite unique in its way to 
handle keyboard shortcuts. Unlike most other editors, where shortcuts are 
combinations of modifier keys and other keys, for example, <kbd>Ctrl+c</kbd> 
is a shortcut of `copy` and <kbd>Ctrl+v</kbd> is a shortcut of `paste`, in 
[Vi][] you have to switch to a special state, called *Command mode*, where 
normal keys can be pressed directly to issue commands without the need to hold 
a modifier key at the same time, for example, <kbd>yw</kbd> copies a word, 
<kbd>p</kbd> pastes the word. Normal keys behave normally only in the *Insert 
mode*. Such a concept is quite counter intuitive, or more precisely, quite 
different from the editing habit most people have established from their daily 
usage of *Windows*. According to [a 
study](http://www.textfiles.com/programming/vivsemacs.txt), it takes beginners 
much more time to learn [Vi][] than to learn [Emacs][], while experienced 
[Vi][] and [Emacs][] users are equally efficient. Given such a result, a 
regular *Windows* user who wants to learn Linux command line operation should 
avoid learning [Vi][] to save time.

Many terminal based editors have emerged after [Vi][] and [Emacs][]. They 
normally have keyboard shortcuts that most people have got used to. It is much 
easier to learn them than to learn both [Vi][] and [Emacs][]. They may not be 
as powerful, but should be good enough for most casual editing. [micro][] is 
one of them. Since it is meant to be a successor to the [nano][] editor, which 
is small and easy to use already, [micro][] strives to be even easier to use 
and intuitive. Two important editing functions that are missing from both are

1. word completion, that is, to press a key, normally <kbd>Tab</kbd>, to 
   complete a long word based on the first two or three letters
2. column mode editing, that is, change several letters in the same columns 
across multiple lines

Another problem of [micro][] is that it is impossible to copy from and paste 
into it in Windows through PuTTY.

Otherwise, they have the following features that are important for text 
editing:

1. syntax highlighting, that is, keywords in a certain programming language 
   will be highlighted in color. This will help you to identify misspelt 
   keywords, since they won't be highlighted.
2. Searching and replacing words.
3. undo and redo.
4. auto indent, that is, when you press enter to open a new line, the new line 
will be indented the same amount as the previous line automatically.

[Vi]:https://en.wikipedia.org/wiki/Vi
[Emacs]:https://en.wikipedia.org/wiki/Emacs
[micro]:https://github.com/zyedidia/micro
[nano]:https://www.nano-editor.org
