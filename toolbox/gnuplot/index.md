---
layout: note
title: GNUPlot
---

# Conditional plot

According to [stackoverflow](http://stackoverflow.com/questions/6564561/gnuplot-conditional-plotting-plot-col-acol-b-if-col-c-x), the following can be used to plot the first two columns only when the third one equals zero:

~~~gnuplot
plot 'example.dat' using 1:($3==0?$2:1/0)
~~~
`1/0` is an invalid value, this will cause problems if one chooses to plot lines or linespoints.

Another hack would be to use a shell command like awk:

~~~gnuplot
plot "< awk '$3==0 { print $1, $2 }' example.dat" using 1:2
~~~
