---
tags: [Linux]
---

There are many version of Windows, but there is only ONE Windows. Things are quite different in the world of Linux. There are literally hundreds of Linux distributions out there. Many of them look completely different from each other. In fact, some web sites are created to help people compare and choose different distributions. [DistroWatch][] is one of them. The list there is overwhelming for a regular Windows user.

Fortunately, most of the distributions are branches or leafs of three main trunks: [Debian][], [Slackware][] and [RedHat][]. The big picture is shown as the [Linux Distribution Timeline](http://futurist.se/gldt). The biggest difference between the main trunks is in the [software package manage system](https://en.wikipedia.org/wiki/Package_manager).

Why does Linux need a package manager? Most of the Windows programs are self-contained, meaning that, you don't have to install some libraries in order to run a program, such as Firefox. According to the [Unix philosophy](https://en.wikipedia.org/wiki/Unix_philosophy), a program should only do one thing well, to do a new job, one should build another program rather than complicate the old program by adding new "features". Linux inherits this culture. A consequence is that libraries are separated from and shared by various end programs. To install one program, you need to install many libraries to run it. The package manager is used to take care of the dependency between programs and libraries. However, most Linux distributions provide some graphic user interface to hide the details of their package managers from the end user. It does not matter much which package manager is under the hood.

What matters is how many packages are there, how often they get updated and whether proprietary software is included. It seems that [Debian][] based systems have the largest number of packages available. The top three distributions in the [top ten Linux distributions](https://distrowatch.com/dwres.php?resource=major) listed in [DistroWatch][] are all [Debian][] based.

[DistroWatch]:https://distrowatch.com/
