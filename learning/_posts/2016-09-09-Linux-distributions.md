---
tags: [Linux]
---

There are many version of Windows, but there is only ONE Windows. Things are quite different in the world of Linux. There are literally hundreds of Linux distributions out there. Many of them look completely different from each other. In fact, some web sites are created to help people compare and choose different distributions. [DistroWatch][] is one of them. The list there is overwhelming for a regular Windows user.

Fortunately, most of the distributions are branches or leafs of three main trunks: [Debian][], [Slackware][] and [RedHat][]. The big picture is shown as the [Linux Distribution Timeline](http://futurist.se/gldt). Technically, the biggest difference between the main trunks is in the [software package manage system](https://en.wikipedia.org/wiki/Package_manager).

Why does Linux need a package manager? Most of the Windows programs are self-contained, meaning that, you don't have to install some libraries in order to run a program, such as Firefox. According to the [Unix philosophy](https://en.wikipedia.org/wiki/Unix_philosophy), a program should only do one thing well, to do a new job, one should build another program rather than complicate the old program by adding new "features". Linux inherits this culture. A consequence is that libraries are separated from and shared by various end programs. To install one program, you need to install many libraries to run it. The package manager is used to take care of the dependency between programs and libraries. However, most Linux distributions provide some graphic user interface to hide the details of their package managers from the end user. It does not matter much which package manager is under the hood.

According to [Wikipedia](https://en.wikipedia.org/w/index.php?title=Comparison_of_Linux_distributions), [OpenSUSE][] (an off-spring of [Slackware][]) has the largest number of packages available in the official repository. [Debian][] based distributions are very close. [Fedora][] (an off-spring of [RedHat][]) has about half of the numbers.

The top three distributions in the [top ten Linux distributions](https://distrowatch.com/dwres.php?resource=major) listed in [DistroWatch][] are all [Debian][] based.

[DistroWatch]:https://distrowatch.com
[Debian]:https://www.debian.org
[Slackware]:http://www.slackware.com
[RedHat]:https://www.redhat.com
[OpenSUSE]:https://www.opensuse.org
[Fedora]:https://getfedora.org
