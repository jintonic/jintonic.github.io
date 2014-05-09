---
layout: note
category: cs
title: rcs
subtitle: Revision Control System
---

Initial checkin
===============

    $ edit test.txt
    $ mkdir RCS
    $ ci -l test.txt

The last command will 

1. put test.txt under version control, 
2. lock this version in RCS,
3. update working copy of test.txt to the newest version


Print history
=============

    $ rlog test.txt

Check out
=========

    $ co -r1.3 test.txt

or

    $ co -u1.3 test.txt

The latter will check out test.txt without lock. This will chmod test.txt to
444. To make a checkout workable one has to lock the file in RCS:

    $ co -l1.3 test.txt

This command will 

1. overwrite the working copy of test.txt with its version 1.3,
2. lock version 1.3 in RCS. After this command, if one run

    $ rlog test.txt

he will see that there are two versions locked in RCS: 1.3 and the head, for
example, 1.9

To write new changes after 1.9, one has to unlock 1.3 first:

    $ rcs -u1.3 test.txt

To write new changes after 1.3 (i.e. create a new branch 1.3.1.1), one has to
unlock 1.9 first:

    $ rcs -u1.9 test.txt

To make sure each time new changes are write after the highest revision
number, one has to at first turn off strict locking for test.txt:

    $ rcs -U test.txt

After this command one can checkout test.txt without locking:

    $ co -r1.3 test.txt

This time, this command will 

1. overwrite working copy with r1.3, 
2. make working copy writable, 
3. r1.9 is still locked from the previous operation. 

If one run

    $ ci -l test.txt

new version will be r1.10
