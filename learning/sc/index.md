---
layout: note
title: sc
subtitle: Spreadsheet Calculator
---

# Basic

It is very old spreadsheet program working in a terminal. It is amazing that
such a small program achieved most of the common functionalities provided in
MS Excel long time ago with much faster speed. Its original source codes are
now maintained in [a GitHub repository](https://github.com/dkastner/sc) with
many forks. Resources:

- man sc. Hard to understand like any other man pages, but very useful once you
  start to understand it.
- <http://www.linuxjournal.com/article/10699>
- <http://www.economics.utoronto.ca/jfloyd/stats/minmansc.pdf>

# Compile from source code

The source code maintained by Debian distribution is the best. [Some patches](https://github.com/jintonic/dots/blob/master/sc.patch) have to be made to compile and install it in one's home directory smoothly:

``` sh
git clone git://git.debian.org/collab-maint/sc.git
cd ~/github/sc
git apply /path/to/sc.patch
make install

```

# undo

There is no *undo* function in the original *sc*. One can use a version
control program to save the history of a sc file.
[scim](https://github.com/andmarti1424/scim) provides *undo/redo* and worths
a try. Check [this question][se] in StackExchange for detail.

[se]:http://unix.stackexchange.com/questions/55056/how-to-undo-in-spreadsheet-calculator-sc

# Save expression instead of value in cells

This is controlled by the option 'o'. It can be toggled in sc using the following key strokes: <kbd>Ctrl-t</kbd> followed by <kbd>o</kbd>, or in the configuration file

~~~
set !optimize
~~~~

# Insert date

Press <kbd>=</kbd> or <kbd>e</kbd> to insert the date as follows

~~~
@dts(2013,1,25)
~~~

Press <kbd>F</kbd> and <kbd>Ctrl-d</kbd> followed by <kbd>%F</kbd> to specify the display format of the
date as 2013-01-25.

# Set type of data format of a collumn

Press <kbd>f</kbd> followed by 3 numbers (width of the column, precision and format
type) to change format type:

|-----+--------------
|type | format
|:----+:-------------
|0    | fixed numbers
|1    | scientific
|2    | engineering
|3    | 6 Apr 79
|4    | 6 Apr 1979
|5~9  | user-defined

The new format type can be defined either inside sc by <kbd>f=</kbd> followed
by a number, or in `.scrc`.

~~~
format 5 = "^D%F"
~~~

# Set precision and length of numbers

Press <kbd>f</kbd> to enable setting display format of numbers in a column, and then
press <kbd>h</kbd> or <kbd>l</kbd> to change the length of the column, <kbd>j</kbd> or <kbd>k</kbd> to change the
precision of the numbers in a column. The <kbd>hljk</kbd> trick does not seem to work in
cygwin.

# Sum up a range of numbers

Press <kbd>=</kbd> or <kbd>e</kbd> to insert the function as follows

~~~
@sum(B2:F25)
~~~

# Sort a range of cells

- put cursor at the top left cell of the region to be sorted
- press <kbd>rs</kbd>
- move cursor to the bottom right cell of the region to be sorted
- press <kbd>tab</kbd>
- input "-#a+#b" for example
- return

# Set date format for a range of cells
<kbd>rF</kbd> -> use <kbd>h</kbd>,<kbd>j</kbd>,<kbd>k</kbd>,<kbd>l</kbd> to select range -> tab -> "^D%F -> return

# Update formula when copy, delete rows or columns

Range operations, copying or deleting many rows or columns for example,
trigger update of formula in the whole sheet. Cell operations do not change
formula at all. Rules of update:
- current roll or column numbers are updated. For example, if one copy row 20
  to row 21, variables like A20 will be changed to A21 in formula. 
- other roll or column numbers are kept unchanged. For example, if one copy
  raw 20 to raw 21, variables like A19 is not changed.
- To allow variables like A19 to update, one can use @nval("A",@myrow-1)
  instead.

# Text justification

Numbers are always justified to the right. Strings can be justified to the
left/center/right using <kbd>{</kbd>/<kbd>|</kbd>/<kbd>}</kbd>, respectively.
