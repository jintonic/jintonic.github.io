---
layout: note
category: cs
title: GNUPlot
---

# plot data in a gnuplot script

```gnuplot
plot "-" using 1:2:3 w yerrorbars
#  X     Y     Z
1.0   1.2   0.2
2.0   1.8   0.3
3.0   1.6   0.2
4.0   1.2   0.2
end
```

# plot data from a Linux command

```gnuplot
gnuplot> plot "< head -10 test.dat" using 1:2 with lines
```

# plot to stdin
If no set output ..., plot will be guided to stdin.

# time axis

```gnuplot
set xdata time
set timefmt "%Y-%m-%d %H:%M"
set format x "%Y\n%m/%d"
plot data.txt using 1:3 notitle with line
```

assuming the 1st column in data.txt is yyyy-mm-dd, the 2nd column is HH:MM, the 3rd column is the data.

# close an output file

```gnuplot
set terminal png
set output picture.png # open picture.png
plot data.txt using 1:2 notitle with line
set output # close picture.png
```

# plot mutliple graphs in one canvas

```gnuplot
plot "data.txt" using 1:2 title "set 1" using line,\
     "data.txt" using 1:3 title "set 2" using line
```

# show line, point and filling styles

```gnuplot
gnuplot> test
```

# specify size of canvas

```gnuplot
set size 1.2, 0.6
```

the number must be a ratio. In the example above, 1.2 means 1.2 times the default width of x. 0.6 means 0.6 times the default width of y.

# tune legend

```gnuplot
set key right bottom box
```

# draw grid on canvas

```gnuplot
set grid
```

# calculate in plot command

```gnuplot
plot 'data.txt'  using 2:($4/$3) title "1 PE" with linespoints
```

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
