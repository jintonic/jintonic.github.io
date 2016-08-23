---
tags: [phys-492/592]
---


![histogram of oil change frequency]({{site.exa}}/oil.png)

I bought a second handed car last year. The dealer showed me a long maintenance 
record from [CARFAX][] and claimed that the car was very well served. Well, by 
simply looking at all the oil change records I would have to agree with him. 
However, I made a simple spreadsheet and generated the histogram above and 
realized immediately that the car was nothing more than being regularly 
maintained.

The spreadsheet was created with a command-line tool [sc][]. The following 
screenshot shows part of it. The last column shows the mileage increase 
between two oil changes. The histogram shows the statistic distribution of it.

![oil change spreadsheet created with sc]({{site.exa}}/oilsc.png)

What else can we plot out of a nice maintenance record? I recorded the amount 
of fuel I added each time and the mileage when I added fuel for a mini jeep 
when I was in Japan. The following spreadsheet shows part of the record:

![fuel efficiency recorded in sc]({{site.exa}}/fueleffsc.png)

The fuel efficiency (how many kilometer the car can run by consuming 1 L of 
gas) versus the date as shown in the plot below shows clearly an annual 
modulation of the efficiency. In winter the efficiency drops because of heavy 
snow in the town where I lived in Japan.

![fuel efficiency of pajero mini]({{site.exa}}/fueleff.png)

All the data and analysis codes are available in

- [https://github.com/jintonic/pajero](https://github.com/jintonic/pajero)
- [https://github.com/jintonic/sienna](https://github.com/jintonic/sienna)

You will need the following program to run the codes:

- [sc - spreadsheet calculator][sc]
- [ROOT][]
- [gnuplot][]
- [R][]
- [LaTeX][]

[CARFAX]:http://www.carfax.com
[sc]:https://github.com/jintonic/sc
[ROOT]:https://root.cern.ch
[gnuplot]:http://www.gnuplot.info
[R]:https://www.r-project.org
[LaTeX]:https://www.latex-project.org
