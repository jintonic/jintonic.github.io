---
layout: note
category: cs
title: linux
---

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

