---
tags: [Linux]
---

There are many versions of Windows, but there is only ONE Windows. Things are quite different in the world of Linux. There are literally hundreds of Linux distributions out there. Many of them look completely different from each other. In fact, some web sites are created to help people compare and choose different distributions. [DistroWatch][] is one of them. The list there is overwhelming for a regular Windows user.

Fortunately, most of the distributions are branches of three main trunks: [Debian][], [Slackware][] and [RedHat][]. The big picture is shown as the [Linux Distribution Timeline](http://futurist.se/gldt). Technically, the biggest difference between the main trunks is in the [software package management system](https://en.wikipedia.org/wiki/Package_manager).

Why does Linux need a package manager? Most of the Windows programs are self-contained, meaning that, you don't have to install some libraries in order to run a program, such as Firefox. According to the [Unix philosophy](https://en.wikipedia.org/wiki/Unix_philosophy), a program should only do one thing well, to do a new job, one should build another program rather than complicate the old program by adding new "features". Linux inherits this culture. A consequence is that libraries are separated from and shared by various end programs. To install one program, you need to install many libraries to run it. The package manager is used to take care of the dependency between programs and libraries. However, most Linux distributions provide some graphic user interface to hide the details of their package managers from the end user. It does not matter much which package manager is under the hood.

Then what makes one distribution more popular than another? I feel like that `How user-friendly it is` is one of the most important standards. It is very hard for technical geek oriented distributions to get popular, for example, [Gentoo][]. While the *No. 1* Linux distribution listed in [DistroWatch][], [Linux Mint][Mint], is extremely easy to use. The main off-springs of the three trunks, [Ubuntu][], [OpenSUSE][] and [Fedora][], are all very user friendly. You don't need to know command line interface to use any of them.

When a Windows user wants to install a new program, for example, firefox, he or she has to go to the program's web site, download it there and then install it. The program will automatically update itself periodically. In Linux, most programs are maintained in a central repository, from where you can download the program you want. You don't get it directly from the program's web site. To update the program, you will have to rely on the package manager to update related programs or libraries as well.

Because of this, two things you need to consider when you choose a distribution. 1. How many packages are maintained in the central repository, this determines the likelihood of your favorite program to be in the repository; 2. How often the packages in the repository are updated, this determines how fast you can upgrade to the latest version of a program.

According to [Wikipedia](https://en.wikipedia.org/w/index.php?title=Comparison_of_Linux_distributions), [OpenSUSE][] (an off-spring of [Slackware][]) has the largest number of packages available in the official repository. [Debian][] based distributions are very close. [Fedora][] (an off-spring of [RedHat][]) has about half of the numbers. I personally did experience that one program was included in [Debian][]'s repository but not in [Fedora][]'s. Most distributions are regularly updated so that the second concern does not matter much in most of the cases.

The top three distributions, [Mint][], [Debian][] and [Ubuntu][] in the [top ten Linux distributions](https://distrowatch.com/dwres.php?resource=major) listed in [DistroWatch][] are all [Debian][] based. As for a beginner, [Mint][] would be the best choice, given its Windows-like desktop, pre-installed commonly used programs and easy installation process.

You can install [Mint][] in a USB stick, boot your machine from the stick so that you can test [Mint][] without installing it to your hard disk. You can also start with a [Mint][] virtual machine in your Windows desktop using [Virtualbox][]. This way, you can always safely go back to Windows in case of something goes wrong in your first adventure to Linux.

[DistroWatch]:https://distrowatch.com
[Debian]:https://www.debian.org
[Slackware]:http://www.slackware.com
[RedHat]:https://en.wikipedia.org/wiki/Red_Hat_Linux
[OpenSUSE]:https://www.opensuse.org
[Fedora]:https://getfedora.org
[Gentoo]:https://www.gentoo.org
[Mint]:https://www.linuxmint.com
[Ubuntu]:http://www.ubuntu.com
[Virtualbox]:https://www.virtualbox.org
