---
tags: [GitHub, Windows, Qt]
---

![set git shipped with GitHub for Windows in Qt Creator 
Options]({{site.exa}}/set-git-shipped-with-GitHub-for-Windows-in-Qt-Creator-Options.png)

[Qt][] [Creator][] is an [IDE][] for writing C++ programs (mostly [GUI][]s) 
with [Qt library][qtlib]. [GitHub][] is a cloud service where you can save your 
codes in the format of [git][] repositories and collaborate with others. [Qt][] 
[Creator][] relies on external [git][] commands to provide [git][] related 
operations.  [GitHub for Windows][gw] provides those commands. It is very easy 
to tell [Qt][] [Creator][] to use the [git][] commands shipped with [GitHub for 
Windows][gw]:

1. Install [GitHub for Windows][gw]. It will create a **Git Shell** icon on 
your desktop.
2. Right click the icon, select **Propertries**. In a text box labelled 
**Target** you can find the location of your [GitHub for Windows][gw] 
installation: *C:\Users\jing.liu\AppData\Local\GitHub*
3. Go to that folder and you will find a sub folder with all git commands 
included: 
*C:\Users\jing.liu\AppData\Local\GitHub\PortableGit_c2ba306e536fdf878271f7fe636a147ff37326ad\bin*
4. Open your [Qt][] [Creator][], select **Tools** menu and then **Options...** 
and follow the screen shot at the beginning of this post. Click **Ok** and you 
are done!

### Work flow

1. I prefer to create an empty repository using [GitHub][] web interface, where 
you can add a **.gitignore** and a **LICENCE** file easily:
![add repository in GitHub]({{site.exa}}/create-repository-in-GitHub.JPG)
2. Run [GitHub for Windows][gw] on your desktop. You will be asked to log into 
[GitHub][] and setup your local git preference if this is the first time you 
run it. This will also generate an [SSH][] [key pair][key] automatically so 
that you can communicate with your remote repositories without typing your user 
name and password again and again.
3. Clone you repository in [GitHub][] to your local machine:
![clone repository in GitHub for 
Windows]({{site.exa}}/clone-repository-in-GitHub-for-Windows.png)
4. Create a new project in [Qt][] [Creator][] in the same directory of your 
local [git][] repository:
![create Qt project in local git 
repository]({{site.exa}}/create-Qt-project-in-local-git-copy.png)
5. Git related operations are now enabled in [Qt][] [Creator][]:
![git operations enabled in Qt 
Creator]({{site.exa}}/git-operations-enabled-in-Qt-Creator.png)
6. Now you can do all kinds of things related to [git][] within [Qt][] 
[Creator][] without even opening [GitHub for Windows][gw].

[Qt]:http://www.qt.io/
[Creator]:http://doc.qt.io/qtcreator/
[IDE]:http://en.wikipedia.org/wiki/Integrated_development_environment
[GUI]:http://en.wikipedia.org/wiki/Graphical_user_interface
[qtlib]:http://en.wikipedia.org/wiki/Qt_%28software%29
[GitHub]:https://github.com/
[git]:https://git-scm.com/
[gw]:https://windows.github.com/
[SSH]:https://en.wikipedia.org/wiki/Secure_Shell
[key]:https://help.github.com/articles/generating-ssh-keys/
