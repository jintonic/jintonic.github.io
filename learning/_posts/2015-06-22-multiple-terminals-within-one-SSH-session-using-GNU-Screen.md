---
tags: [terminal, screen, Linux]
---

![GNU screen with running commands shown in window title 
bar]({{site.ina}}/GNU-screen-with-running-commands-as-titles-of-terminals-shown-in-window-title-bar.png)

Does the following scenario ever happen to you? You open a terminal and log 
into a Linux server through [SSH][] to edit a file within the terminal. Now you 
need another terminal to run some commands to see whether you modifications 
take effect. So you have to open another terminal and `ssh` to the Linux 
server, type in the user name and password again. You will have to repeat this 
again and again whenever you need a new terminal. If it happens to you very 
often, try the command `screen` in your terminal after you `ssh` in your 
server:

~~~ bash
user@local$ ssh user@server
user@server$ screen
~~~

This will launch a program called [GNU Screen][screen]. It can provide you as 
many terminals as you want in one [SSH][] session.

The first time you launch it, you will see some welcome messages in your 
terminal. Type <kbd>Enter</kbd> to dismiss the messages and you will be back to 
your SHELL prompt again. Where are my multiple terminals? You may ask. Well, 
there is only one at this moment. You will have to launch a new one by holding 
<kbd>Ctrl</kbd> and press <kbd>a</kbd> and then <kbd>c</kbd>. Now press 
<kbd>Ctrl</kbd>+<kbd>a</kbd> and then <kbd>"</kbd>, you will see a list of all 
terminals opened in your `screen`:

![GNU screen window list]({{site.ina}}/GNU-screen-window-list.png)

Press arrow keys to select one and <kbd>Enter</kbd> to go to that terminal. 
What!? Do I have to type so many keys to switch from one terminal to another 
You may ask. Yes, if you are used to tabs on top of your web browser, this is 
not acceptable. However, it is actually very easy to configure your `screen` to 
have something like a tab bar as shown in the top screen shot.

But before we get into details, let's cover a basic concept of this program. 
`screen` is a program to create multiple virtual terminals in a physical 
terminal.  It provides a set of commands (the commonly used ones are bound to 
hot keys) to create, delete, switch in between virtual terminals. By default, 
<kbd>Ctrl</kbd>+<kbd>a</kbd> is used to tell screen that the following key 
stroke is a hot key bound for a command to manipulate virtual terminals, 
instead of a key that is sent to the SHELL. It is basically a mode switch key. 
It switches from *working-in-a-shell* mode to *manipulate-virtual-terminal* 
mode. It is easy to find good introductions to the program if you search on 
*Google* **GNU screen**.  Be sure to search for **GNU screen** instead of just 
**screen**, otherwise, you won't find anything relevant.

### Detach and attach

<kbd>Ctrl</kbd>+<kbd>a</kbd> and <kbd>d</kbd> to detach the screen from your current terminal. To attach again to your detached screen, try the following:

```sh
# list all screens running in the system
$ screen -list
# re-attach to one of them
# a list will be given for you to choose if there are more than one
$ screen -r
```

### Mode-switch key

The default mode-switch key binding <kbd>Ctrl</kbd>+<kbd>a</kbd> is not 
convenient to type and conflict with the shell shortcut for moving to the start 
of a line.  [VI][] uses <kbd>Esc</kbd> to switch between *insert* and *command* 
modes. One can use the key below it, that is, <kbd>`</kbd> as the mode-switch 
key for screen.  This can be done by insert the following line in 
`~/.screenrc`:

~~~
escape ``
~~~

Now you can jump to the 3rd terminal by typing <kbd>`</kbd><kbd>3</kbd>, that is, press <kbd>`</kbd>, release it, press <kbd>3</kbd> and release it.

However, <kbd>`</kbd> is used often by other programs as well. It's better to use <kbd>Ctrl</kbd>+<kbd>`</kbd> instead of a single <kbd>`</kbd> as the mode-switch key. To achieve this, put the following in your `~/.screenrc`:

```
escape ^``
```

### Use the function keys

If you'd like to jump to a terminal with just one key stroke, try the 
followings. F1 ~ F12 are not used by shell.  They can be set in `~/.screenrc` 
as hot keys for screen command without switching mode, for example,

~~~sh
bindkey -k k1 select 1 # press F1 to select window 1
bindkey -k k2 select 2 # press F2 to select window 2
bindkey -k k3 select 3 # press F3 to select window 3
bindkey -k k4 select 4 # press F4 to select window 4

bindkey -k k8 screen 1 # create a new screen by pressing F8
bind c screen 1        # Window numbering starts at 1, not 0

# press F9/F10 to scroll up/down
bindkey -k k9 eval "copy" "stuff ^u"
bindkey -k k; eval "copy" "stuff ^d"
bindkey -m -k k9 stuff ^u
bindkey -m -k k; stuff ^d

bindkey -k F1 prev # press F11 to go to previous window
bindkey -k F2 next # press F12 to go to next window
~~~

The *-k* option tells the *bindkey* command the following string is not a 
normal string but a [termcap keyboard capability name][termcap].

### Use the title bar of physical terminal as tab bar

You need a tab bar to show all terminals you create just as the tab bar in your 
web browser. This can be achieved with the following simple setup:

~~~
# define things to be shown in the status bar (mimicking tabs)
hardstatus lastline "%{= Bk}%H | %-w%{= kB}%n*%t %{-}%+w"
# use the terminal title bar if possible
hardstatus on
~~~

### Show running commands on title bar

You need to do some settings in both your `~/.screenrc` and your `~/.bashrc` to 
show the latest running commands on the window title bar.

The title of a screen window can be set in `~/.screenrc` by the following 
command

~~~
shelltitle "] |bash"
~~~

According to the GNU screen manual, the string after `|` is the default title 
for a new screen window, the one before `|` is the last part of the shell 
prompt, which is used to tell screen to use the first word after the prompt as 
the title. One more setup is needed in `.bashrc` to make the whole thing work:

~~~sh
case "$TERM" in
screen)
  PROMPT_COMMAND='echo -ne "\033k\033\\"'
  ;;
*)
  ;;
esac
~~~

[SSH]:https://en.wikipedia.org/wiki/Secure_Shell
[screen]:https://www.gnu.org/software/screen/
[VI]:http://www.vim.org/
[termcap]:https://www.gnu.org/software/termutils/manual/termcap-1.3/html_chapter/termcap_5.html

