---
layout: note
category: cs
title: putty
subtitle: SSH client for Window
---

Transfer setup to another machine
=================================

According to http://www.cyberciti.biz/tips/putty-session.html, one can export
putty setups from windows registry to a file saved in Dropbox:

~~~
regedit /e "%userprofile%\Dropbox\putty-registry.reg" HKEY_CURRENT_USER\Software\Simontatham
~~~

Double click that file in the Dropbox fold in another machine and done! One can
also export individual session manually in regedit.

Windows jump list
=================

Install the newest putty, make sure "Store and display recently opened items in
the Start menu and the taskbar" is enabled, and then *Win+Alt+Num*.

telnet mitbbs.com
=================

1. PuTTY Configuration -> Window Appearance -> Change Font settings -> Select a
Chinese font, *NSimSun* for example, select *Chinese GB2312* in Script
2. PuTTY Configuration -> Window Translation -> Select *Use font encoding* in
Remote Character set
3. open the link to verfification code in IE instead of firefox.

