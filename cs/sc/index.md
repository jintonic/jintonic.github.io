---
layout: note
category: cs
title: sc
subtitle: Spreadsheet Calculator
---

Basic
=====

It is very old spreadsheet program working in a terminal. It is amazing that
such a small program achieved most of the common functionalities provided in
MS Excel long time ago with much faster speed. Its original source codes are
now maintained in [a GitHub repository](https://github.com/dkastner/sc) with
many forks. Resources:

- man sc. Hard to understand like any other man pages, but very useful once you
  start to understand it.
- [http://www.linuxjournal.com/article/10699](http://www.linuxjournal.com/article/10699)
- [http://www.economics.utoronto.ca/jfloyd/stats/minmansc.pdf](http://www.economics.utoronto.ca/jfloyd/stats/minmansc.pdf)

undo
====

There is no *undo* function in the original *sc*. One can use a version
control program to save the history of a sc file.
[scim](https://github.com/andmarti1424/scim) provides *undo/redo* and worths
a try. Check [this question][se] in StackExchange for detail.

[se]:http://unix.stackexchange.com/questions/55056/how-to-undo-in-spreadsheet-calculator-sc

Save expression instead of value in cells
=========================================

This is controlled by the option 'o'. It can be toggled in sc using the
following key strokes: *Ctrl-t* followed by *o*, or in the configuration file

~~~
set !optimize
~~~~

Insert date
===========

Press *=* or *e* to insert the date as follows

~~~
@dts(2013,1,25)
~~~

Press *F* and *Ctrl-d* followed by *%F* to specify the display format of the
date as 2013-01-25.

Set type of data format of a collumn
====================================

Press *f* followed by a number to change format type:

|----+--------------
|type|format
|:---+:-------------
|0   |fixed numbers
|1   |scientific
|2   |engineering
|3   |6 Apr 79
|4   |6 Apr 1979
|5~9 |user-defined 

The new format type can be defined either inside sc by *f=* followed
by a number, or in .scrc 

~~~
format 5 = "^D%F"
~~~

Set precision and length of numbers
===================================

Press *f* to enable setting display format of numbers in a column, and then
press *h* or *l* to change the length of the column, *j* or *k* to change the
precision of the numbers in a column.

Sum up a range of numbers
=========================

Press *=* or *e* to insert the function as follows

~~~
@sum(B2:F25)
~~~

Sort a range of cells
=====================

- put cursor at the top left cell of the region to be sorted
- press *rs*
- move cursor to the bottom right cell of the region to be sorted
- press *tab*
- input "-#a+#b" for example
- return

Set date format for a range of cells
====================================
rF -> use hjkl to select range -> tab -> "^D%F -> return

Update formula when copy, delete rows or columns
================================================

Range operations, copying or deleting many rows or columns for example,
trigger update of formula in the whole sheet. Cell operations do not change
formula at all. Rules of update:
- current roll or column numbers are updated. For example, if one copy row 20
  to row 21, variables like A20 will be changed to A21 in formula. 
- other roll or column numbers are kept unchanged. For example, if one copy
  raw 20 to raw 21, variables like A19 is not changed.
- To allow variables like A19 to update, one can use @nval("A",@myrow-1)
  instead.

