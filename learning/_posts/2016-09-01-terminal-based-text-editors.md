---
tags: [text editor]
---

When you [log into a Linux machine using PuTTY from a Windows PC]({% post_url 
/learning/2016-08-29-connect-to-Linux-from-any-Windows-PC %}), you need a 
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
ssh sessions. If none of the environment variable (`$VISUAL` or `$EDITOR`) is 
set, `less` will use `vi` to edit the file. 
