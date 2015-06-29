---
tags: [Windows, ROOT]
---

[ROOT][] is a set of C++ libraries for statistic analysis of large data sets 
encountered in experimental particle physics. It comes with nice command-line 
and graphic user interfaces and a lot of tutorials and documentation to help 
people get familiar with its usage. However, it is normally compiled in 
Unix-like operating systems and accessed from command line. It takes very long 
for students who only use Windows to get familiar with Unix/Linux SHELL 
commands before they start to learn [ROOT][].

The good news is that learning ROOT can be separated from learning Unix/Linux 
commands. Students can start learning ROOT from day one without any knowledge 
about Linux server, SSH, SHELL, *etc*., on Windows. Here is how.

1. go to http://root.cern.ch, click [Download][], select [Pro, version 
5.34/32][pro], navigate to the bottom of the page, read the instruction for 
Windows, download the recommended [exe][] version of the installer.

2. double click the downloaded ROOT installer, accept the licence and select to 
*add ROOT to system PATH* as shown in the following screen shot and accept all 
other default settings.
![add ROOT to system PATH]({{site.exa}}/add-ROOT-to-system-PATH-on-Windows.jpg)

3. Now navigate to `C:\root_v5.34.32\tutorials` in your file browser and left 
click the address bar to highlight it as shown in the following screen shot:
![hightlight Windows explorer address 
bar]({{site.exa}}/hightlight-Windows-explorer-address-bar.jpg)

4. type <kbd>root</kbd> in the address bar and <kbd>Enter</kbd> to launch 
[ROOT][] in the current directory:
![Launch root in Windows file 
browser]({{site.exa}}/launch-ROOT-from-Windows-file-browser.jpg)

5. Now you can run [ROOT][] scripts in the folder `C:\root_v5.34.32\tutorials` 
by typing in the ROOT interactive session:
		```
		.x hsimple.C
		```
![Launch ROOT script]({{site.exa}}/launch-ROOT-script.jpg)

That's it. It takes about 10 minutes and 5 steps for you to start running ROOT 
scripts on a Windows machine. You can learn Linux commands in parallel to be 
prepared for using ROOT in some Linux servers, which is not a must to start 
with though.

[ROOT]:https://root.cern.ch/drupal
[Download]:https://root.cern.ch/drupal/content/downloading-root
[pro]:https://root.cern.ch/drupal/content/production-version-534
[exe]:http://root.cern.ch/download/root_v5.34.32.win32.vc12.exe

