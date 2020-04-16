---
layout: note
category: cs
title: MacOS
---

# git

If you run `git clone ...` the first time, you will be prompt to install [command line developer tools](https://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/), answer yes and be prepared to wait for a long time for this process to finish. You will have `git` available after this installation.

# Homebrew

Simply follow the instruction on <https://brew.sh/>. You may be prompt to install [command line developer tools](https://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/), answer yes and be prepared to wait for a long time for this process to finish.

There is no need to install `vim` using `brew` since `vim` is shipped with Mac.

# Keyboard, mouse and trackpad
## F11
It is used by `Mission Control`, follow the following instruction to release it:
<https://www.petenetlive.com/KB/Article/0001441>

## middle click

<https://www.makeuseof.com/tag/middle-click-mac/>

It is a must if you use a VNC client in a Mac to connect to a Linux server, since you need the middle click to paste to your server.

# combine PDF files

## Option 1

Open all files in preview with side panel open, drag pages in between panels to combine them.

## Option 2

Please check [this blog post][pdfcon] for details.

~~~
cd /usr/local/bin
sudo ln "/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py" PDFconcat
PDFconcat -o output.pdf /PATH/TO/ORIGINAL/1.pdf /PATH/TO/ANOTHER/2.pdf /PATH/TO/A/WHOLE/DIR/*.pdf
~~~

[pdfcon]: http://gotofritz.net/blog/howto/joining-pdf-files-in-os-x-from-the-command-line/

## Option 3

pdfjam is included in MacTeX. 

~~~
pdfjam --help
pdfjam -o output.pdf file1.pdf 2,3,8-10 file2.pdf
~~~

# screen shot

1. Shift + Command + 4: take screen shot of a selected region. The shot is automatically saved on desktop.
2. Run program "grab", press "Command +4", and paste in place you want to insert the shot
3. Run program "preview", click "File" -> "Take screenshot..."

# short cuts

"Command + Option + Q" is the keyboard shortcut for "Quit and Discard all Windows".

Shift + Command + 4: take screen shot of a selected region.

# ACLs on Mac OS X

<https://www.thomaskeller.biz/blog/2011/06/04/acls-on-mac-os-x/>

The first thing to notice is that starting with Mac OS X 10.6 (Snow Leopard) ACLs are always enabled and cannot be disabled as in earlier versions. All ACL commands are baked into the chmod command and parsed from a string you give it with the ‘+a’ option. The basic syntax here is

~~~sh
chmod (+|-|=)a#? '<user> (allow|deny) <list-of-permissions>'
~~~

Since there is no setfacl on Mac OS X, there is no getfacl either, so ACLs are instead queried by the special option -e of ls:

~~~
$ ls -le .
[...]
-rw-r--r--+ 1 john users  175  5 Jun 00:23 foo
0: user:dave allow write
~~~

Permissions include the usual read, write, delete, add_file, and add_subdirectory as well as more exotic ones like {read,write}extattr, {read,write}writesecurity and chown. (Read up chmod‘s man page what these are for.)

There are, however, two more important ones to notice, namely file_inherit and directory_inherit. These two let you spread your permissions nicely to sub objects and thus let you for example set up a directory, in which a pool of users is allowed to access, modify and delete each other’s files:

~~~sh
chmod +a 'john allow read,write,delete,add_file,add_subdirectory,file_inherit,directory_inherit' /data
chmod +a 'dave allow read,write,delete,add_file,add_subdirectory,file_inherit,directory_inherit' /data
~~~

The above example gives john and dave inherited read, write and delete permissions to all file objects underneath /data.

Since ACLs are executed in order, they can also be set in an ordered manner. chmod has the +a# option for that, where # is the position into which the ACL should be added. Similarily, existing ACLs can be edited with =a#, where again # marks the position of the ACL to edit, and deleted with -a#.

Finally, if one wants to get rid of all ACLs of a specific node, chmod -N <path> will do the job.

Another tool is `xattr`:

~~~sh
 $ ls -lF *.pdf
 # -rw-r--r--@ 1 wgscott  staff   222K Feb 27 17:08 1229.pdf
 
 $ xattr -l 1229.pdf
 
 # com.apple.metadata:kMDItemWhereFroms:
 # 0000   62 70 6C 69 73 74 30 30 A1 01 5F 10 37 68 74 74    bplist00.._.7htt
 # 0010   70 3A 2F 2F 77 77 77 2E 73 63 69 65 6E 63 65 6D    p://www.sciencem
 
 $ xattr -c 1229.pdf # Remove the metadata attributes
~~~

# LaTeX

According to <http://www.tug.org/mactex/uninstalling.html>, texlive is installed to `/usr/local/texlive` if one installs MacTeX. The bin directory there has to be added to the `PATH`.

# Terminal

Solorized dark for the default terminal: <https://gist.github.com/matijs/808eda8c133d41f9338f89a0077d6b95#file-solarized-dark-terminal>
