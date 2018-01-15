---
tags: [Windows, Linux, phys-492/592]
---

Ever since I was a physics major student, I've heard from time to time people saying something like this "Windows is for layman, Linux is for elites." Obviously, they regarded themselves as one of the elites. Ironically, in most of the cases, their bosses were using Windows.

Over ten years, both Windows and Linux have evolved. Windows 10 can be almost purely keyboard driven, and you don't need to know anything about command line to run [Linux Mint][] happily. We should feel happy that there are different OS out there and that they learn from each other.

Being a regular Windows and Linux user for 10 years. I would say that Windows can be a good daily OS for a physicist as well as Linux. Let me comment on some common criticism on Windows from some physicists and move on to the right way of using Windows for your daily tasks.

*Criticism No. 1.* Windows costs a lot, Linux is for free. The latter statement has two different meanings. First, you don't have to pay for using Linux. Secondly, you have the freedom to modify and distribute most software coming with Linux. We are physicists after all, we are not IT professionals. We may occasionally modify or write a small program for fun, but that's not our daily job. So the second type of freedom does not matter much for most of us as end users. Going back to cost, most of laptops are sold with Windows bundled. You will have to delete Windows and install Linux by yourself if you like a particular laptop model shipped only with Windows. Spiritually, you are against Windows, practically, you pay Microsoft for using Linux. This bring me to criticism No. 2.

*Criticism No. 2.* Microsoft is monopolistic. Their software is not open source. I respect you if this is the real reason that you avoid using Windows. Please just don't using MacOS instead. Microsoft has created something awesome over years as well. [LibreOffice][] learned a lot from Microsoft office conceptually. Software developed by private companies is not necessarily worse than open source programs. I agree that it is truly annoying that most laptops are sold with Windows pre-installed. But our whole society is money-driven, the problem is deeper than Microsoft. There are much better ways to improve our society than simply deleting Windows from you laptop. But the discuss goes beyond the scope of this post.

*Criticism No. 3.* Windows is vulnerable to virus. Look at the [Desktop Market Share](https://www.netmarketshare.com/operating-system-market-share.aspx), Windows is absolutely dominant. If Linux gets as popular, it will get more virus as well. It is really not worth it to attach Linux PCs simply because its tiny market share. Linux servers containing important data are hacked everyday, even it is technically much harder. Besides, if you use a good browser, don't click on random blinking ads. on web pages, don't download and install strange programs, don't run anything from a USB stick automatically, your Windows will be fine. It takes common sense to avoid getting infected by virus just as you do in your daily live to avoid being financially tricked.

*Criticism No. 4.* Windows is slow. This is normally the case when you have used it for a while. Windows runs many programs in background to automatize tasks for you. But they can be stopped. This brings me to the right usage of Windows.

*Tip 1.* Check all icons in your notification area. If you don't know what is it, try to right click on it, search for `settings`, `preferences` or `options` and then uncheck the box in front of something like "Run me automatically when windows starts" and you will be surprised that how much memory can be freed this way.

*Tip 2.* Turn off unnecessary services. Search on Google, there are lots of tutorials telling you how to do this.

*Tip 3.* Don't run anti virus programs in the background all the time. They use way too much resources and do a good job to slow down your PC. Run them manually before you insert a USB stick, open or extract a downloaded file instead.

*Tip 4.* Don't simply click through `Next`, `I agree` so easily when you install a program. Many programs are bundled with other programs, which you don't want to install at all. Spend a little bit more time to check each dialog next time when you install a new program and make it your habit.

*Tip 5.* Periodically clean up your disk and registry. There are so many programs to do it. [CCleaner][] free version is good enough, for example.

*Tip 6.* Turn off unnecessary graphic effect on your desktop. Again, there are numerous articles online showing you how to do that.

*Tip 7.* Don't save everything on your desktop. Clean it up from time to time, you Windows will start much faster.

*Tip 8.* Press the *Windows* key and type the first several letters of the program you want to launch, this will allow you to allocate a program much faster.

*Tip 9.* Use *Windows* key plus number keys to launch and switch in between programs you pin to your task bar. Use *Windows* key plus arrow keys to tile your windows on your desktop. There are so many hot keys on Windows to help you speed up your daily operations. Check them out on Google.

*Tip 10.* Install [Cygwin][] to have a decent command line interface for your daily task. Install [PuTTY+Xming][] or [MobaXterm][] to [do your physics analysis on a remote powerful Linux server from your Windows desktop]({% post_url learning/2016-09-07-run-Linux-GUI-from-any-Windows-PC %}). Install all kinds of Linux distributions using [Virtualbox][] if you feel like it is really necessary.

To summarize, Windows and Linux are just tools. Pick up one based on practically considerations. Spend less time playing in your Linux box, so that you have more time to study physics. Being a good physicist is a more effective way to change the money-driven society than installing Linux in a laptop shipped with Windows.

[Linux Mint]:https://www.linuxmint.com
[LibreOffice]:https://www.libreoffice.org
[CCleaner]:https://www.piriform.com/ccleaner
[Cygwin]:https://cygwin.com
[PuTTY+Xming]:{% post_url learning/2016-09-07-run-Linux-GUI-from-any-Windows-PC %}
[MobaXterm]:{% post_url learning/2015-05-14-coding-on-linux-server-from-windows-pc %}
[Virtualbox]:https://www.virtualbox.org
