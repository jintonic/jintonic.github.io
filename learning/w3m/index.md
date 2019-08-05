---
layout: note
category: cs
title: w3m
subtitle: web browser in terminal
---

It does not understand elements introduced in HTML5. It does not understand
Java. It shows a web page only after the whole contents are downloaded. It does
not maintain a cache of visited web pages. It can be used as a pager for local
files, but no advantage over vifm + less.

It is only good for browsing simple web sites full with text, or for html files
saved locally. It does a good job to display tables and frames. It displays
many languages correctly.

Youtube
-------
Set the second external browser to

    cvlc $(youtube-dl -g %s) &

and press '2M' to launch vlc.

Print web page
--------------
The following command can be used in w3m for preview:

    wkhtmltopdf %s - | zathura - &

In zathura, one can print the pdf file by:

    :print <TAB> 1-5 -o media=a4 <ENTER>

Press "TAB", the printer name will be automatically completed.

Keyword bookmarking
-------------------
In firefox, one can type a keyword in the address bar to get access to a
bookmark. It can also be done in w3m by means of uri handling. A uniform
resource identifier (URI) is a string of characters used to identify a name of
a web resource. A string with at least 3 characters and the last one be ":"
will be recognized by w3m as a uri. w3m provide a way to handle unknown uri,
that is, the user specify a script to handle the unknown uri in a config file
~/.w3m/urimethodmap, for example:

    ar:      file:/cgi-bin/arxiv.cgi?%s

"ar:" will be recognized by w3m as an unknown uri. w3m will call
file:/cgi-bin/arxiv.cgi to handle this uri. "?%s" is optional. It is used to
pass the whole uri string (including what is behind the ":") to the script:

~~~bash
#!/bin/sh
arXiv="http://arxiv.org/abs/"
query=${QUERY_STRING#*:}
cat <<_END_
Content-type: text/plain
W3m-control: GOTO $arXiv$query
W3m-control: DELETE_PREVBUF
W3m-control: SEARCH PDF
_END_
~~~

If a link instead of a script is provided, this file can be used to map a uri
like keyword to a link:

    fa: www.your.favorite.web.site.com

Type C-U fa: ENTER in w3m, and your favorite site will be served by w3m.
Unfortunately, the keyword must be at least 3 letters long.

C-W will run the dict search script. One can customize it to enable a single
character keyword bookmark.

Function list
-------------

|------------------+---------------------------------
|function          | explanation
|:-----------------+:--------------------------------
|ABORT             | Quit w3m without confirmation
|ACCESSSKEY        | Popup acceskey menu
|ADD_BOOKMARK      | Add current page to bookmark
|ALARM             | Set alarm
|BACK              | Back to previous buffer
|BEGIN             | Go to the first line
|BOOKMARK          | Read bookmark
|CENTER_H          | Move to the center line
|CENTER_V          | Move to the center column
|CHARSET           | Change the current document charset
|CLOSE_TAB         | Close current tab
|CLOSE_TAB_MOUSE   | Close tab on mouse cursor (for mouse action)
|COMMAND           | Execute w3m command(s)
|COOKIE            | View cookie list
|DEFAULT_CHARSET   | Change the default document charset
|DEFINE_KEY        | Define a binding between a key stroke and a user command
|DELETE_PREVBUF    | Delete previous buffer (mainly for local-CGI)
|DICT_WORD         | Execute dictionary command (see README.dict)
|DICT_WORD_AT      | Execute dictionary command for word at cursor
|DISPLAY_IMAGE     | Restart loading and drawing of images
|DOWN              | Scroll down one line
|DOWNLOAD          | Save document source to file
|DOWNLOAD_LIST     | Display download list panel
|EDIT              | Edit current document
|EDIT_SCREEN       | Edit currently rendered document
|END               | Go to the last line
|EXEC_SHELL        | Execute shell command
|EXIT              | Quit w3m without confirmation
|EXTERN            | Execute external browser
|EXTERN_LINK       | View current link using external browser
|FRAME             | Render frame
|GOTO              | Go to URL
|GOTO_LINE         | Go to specified line
|GOTO_LINK         | Go to current link
|GOTO_RELATIVE     | Go to relative URL
|HELP              | View help
|HISTORY           | View history of URL
|INFO              | View info of current document
|INTERRUPT         | Stop loading document
|INIT_MAILCAP      | Reread mailcap (mainly for local-CGI)
|ISEARCH           | Incremental search forward
|ISEARCH_BACK      | Incremental search backward
|LEFT              | Shift screen one column
|LINE_BEGIN        | Go to the beginning of line
|LINE_END          | Go to the end of line
|LINE_INFO         | Show current line number
|LINK_BEGIN        | Go to the first link
|LINK_END          | Go to the last link
|LINK_MENU         | Popup link element menu
|LIST              | Show all links and images
|LIST_MENU         | Popup link list menu and go to selected link
|LOAD              | Load local file
|MAIN_MENU         | Popup menu
|MARK              | Set/unset mark
|MARK_MID          | Mark Message-ID-like strings as anchors
|MARK_URL          | Mark URL-like strings as anchors
|MARK_WORD         | Mark current word as anchor
|MENU              | Popup menu
|MENU_MOUSE        | Popup menu at mouse cursor (for mouse action)
|MOUSE_TOGGLE      | Toggle activity of mouse
|MOVE_DOWN         | Move cursor down (a half screen scroll at the end of screen)
|MOVE_DOWN1        | Move cursor down (1 line scroll at the end of screen)
|MOVE_LEFT         | Move cursor left (a half screen shift at the left edge)
|MOVE_LEFT1        | Move cursor left (1 columns shift at the left edge)
|MOVE_LIST_MENU    | Popup link list menu and move cursor to selected link
|MOVE_MOUSE        | Move cursor to mouse cursor (for mouse action)
|MOVE_RIGHT        | Move cursor right (a half screen shift at the right edge)
|MOVE_RIGHT1       | Move cursor right (1 columns shift at the right edge)
|MOVE_UP           | Move cursor up (a half screen scroll at the top of screen)
|MOVE_UP1          | Move cursor up (1 line scrol at the top of screen)
|MSGS              | Display error messages
|NEW_TAB           | Open new tab
|NEXT              | Move to next buffer
|NEXT_DOWN         | Move to next downward link
|NEXT_LEFT         | Move to next left link
|NEXT_LEFT_UP      | Move to next left (or upward) link
|NEXT_LINK         | Move to next link
|NEXT_MARK         | Move to next word
|NEXT_PAGE         | Move to next page
|NEXT_RIGHT        | Move to next right link
|NEXT_RIGHT_DOWN   | Move to next right (or downward) link
|NEXT_TAB          | Move to next tab
|NEXT_UP           | Move to next upward link
|NEXT_VISITED      | Move to next visited link
|NEXT_WORD         | Move to next word
|NOTHING           | Do nothing
|NULL              | Do nothing
|OPTIONS           | Option setting panel
|PEEK              | Peek current URL
|PEEK_IMG          | Peek image URL
|PEEK_LINK         | Peek link URL
|PIPE_BUF          | Send rendered document to pipe
|PIPE_SHELL        | Execute shell command and browse
|PREV              | Move to previous buffer
|PREV_LINK         | Move to previous link
|PREV_MARK         | Move to previous mark
|PREV_PAGE         | Move to previous page
|PREV_TAB          | Move to previous tab
|PREV_VISITED      | Move to previous visited link
|PREV_WORD         | Move to previous word
|PRINT             | Save buffer to file
|QUIT              | Quit w3m
|READ_SHELL        | Execute shell command and load
|REDO              | Cancel the last undo
|REDRAW            | Redraw screen
|REG_MARK          | Set mark using regexp
|REINIT            | Reload configuration files
|RELOAD            | Reload buffer
|RESHAPE           | Re-render buffer
|RIGHT             | Shift screen one column right
|SAVE              | Save document source to file
|SAVE_IMAGE        | Save image to file
|SAVE_LINK         | Save link to file
|SAVE_SCREEN       | Save rendered document to file
|SEARCH            | Search forward
|SEARCH_BACK       | Search backward
|SEARCH_FORE       | Search forward
|SEARCH_NEXT       | Search next regexp
|SEARCH_PREV       | Search previous regexp
|SELECT            | Go to buffer selection panel
|SELECT_MENU       | Popup buffer selection menu
|SETENV            | Set environment variable
|SET_OPTION        | Set option
|SHELL             | Execute shell command
|SHIFT_LEFT        | Shift screen left
|SHIFT_RIGHT       | Shift screen right
|SOURCE            | View HTML source
|STOP_IMAGE        | Stop loading and drawing of images
|SUBMIT            | Submit form
|SUSPEND           | Stop loading document
|TAB_GOTO          | Open URL on new tab
|TAB_GOTO_RELATIVE | Open relative URL on new tab
|TAB_LEFT          | Move current tab left
|TAB_LINK          | Open current link on new tab
|TAB_MENU          | Popup tab selection menu
|TAB_MOUSE         | Move to tab on mouse cursor (for mouse action)
|TAB_RIGHT         | Move current tab right
|UNDO              | Cancel the last cursor movement
|UP                | Scroll up one line
|VERSION           | Display version of w3m
|VIEW              | View HTML source
|VIEW_BOOKMARK     | View bookmark
|VIEW_IMAGE        | View image
|WHEREIS           | Search forward
|WRAP_TOGGLE       | Toggle wrap search mode
