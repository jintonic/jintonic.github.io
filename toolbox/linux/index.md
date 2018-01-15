---
layout: note
category: cs
title: linux
---

Send signals to a process
=========================

~~~bash
$ kill -l # list available signals to be sent
$ kill -SIGUSR1 1234 # send SIGUSR1 signal to process 1234
~~~

Command line tools
==================

USB
---

List connected USB disks,

~~~ bash
$ sudo fdisk -l
...
Device Boot      Start         End      Blocks   Id  System
/dev/sdf1            2048  1953521663   976759808    7  HPFS/NTFS/exFAT
~~~

Mount disk as a normal user,

~~~ bash
$ pmount -umask 022 /dev/sdf1
~~~

and umount it,

~~~ bash
$ pumount /dev/sdf1
~~~

Wireless
--------

List available network interfaces:

~~~ bash
$ ls /sys/class/net/ # or
$ /sbin/ifconfig # or
$ ip addr
~~~

Enable wireless interface:

~~~ bash
$ ifconfig eth0 down # turn off wired network interface
$ ifconfig wlan0 up # turn on wireless network interface
~~~

Scan available access points:

~~~ bash
$ sudo apt-get install wireless-tools # debain based distributions
$ sudo iwlist wlan0 scan | grep SSID
~~~

Connect to an access point:

~~~ bash
$ sudo iwconfig wlan0 essid "essid-of-the-access-point"
$ sudo iwconfig wlan0 key s:access-key
$ sudo dhclient wlan0
~~~

where "s:" is used to convert human readable password to hexadecimal key.

Reduce number of TTYs
=====================
In case of Linux distributions using System V init, comment out extra TTYs in
*/etc/inittab*

~~~
1:2345:respawn:/sbin/getty 38400 tty1
2:23:respawn:/sbin/getty 38400 tty2
#3:23:respawn:/sbin/getty 38400 tty3
#4:23:respawn:/sbin/getty 38400 tty4
#5:23:respawn:/sbin/getty 38400 tty5
#6:23:respawn:/sbin/getty 38400 tty6
~~~

In case of Linux distributions using *Upstart*, do the following

~~~
$ cd /etc/init/
$ sudo rm tty[3-6].conf
~~~

Change swappiness
=================
At first, check if you really need to do it,

~~~
$ free -g
	      total       used       free     shared    buffers     cached
Mem:            15          4         11          0          0          1
-/+ buffers/cache:          2         13
Swap:           15          0         15
~~~

There is no need to do it if no swap is used.

Find out the current swappiness:

~~~
$ cat /proc/sys/vm/swappiness
~~~

Change it on the fly:

~~~
$ sudo sysctl vm.swappiness=10 $ from 0 to 100
~~~

Swappiness=0 tells the kernel to avoid swapping processes out of physical
memory for as long as possible.

Make the change permanent:

~~~
$ sudo vi /etc/sysctl.conf
vm.swappiness=10
~~~

