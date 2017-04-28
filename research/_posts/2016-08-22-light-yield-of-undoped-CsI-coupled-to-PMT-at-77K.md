---
tags: [phys-492/592, PMT, CsI, dark matter experiment, ROOT]
---

![light yield at room temperature and 77K]({{site.ina}}/csily.png)

Thulium doped cesium iodide, CsI(Tl) in short, is widely used as scintillation 
detectors. The [KIMS][] dark matter experiment has reached a light yield of 5 
photoelectrons/keV (PE/keV) using it. My group conducted an experiment with an 
undoped CsI crystal. It was cooled down to liquid nitrogen temperature and 
directly coupled to a photomultiplier tube (PMT) that worked at that low 
temperature. The experimental setup is shown in the following schematic 
drawing.

![experimental setup of undoped CsI coupled to PMT]({{site.ina}}/csisetup.png)

The first thing we measured was the single PE response of the PMT as shown in 
the following plots. The left plot shows 70 digitized electronic pulses 
recorded by the PMT. Some of them contained single PE pulses. The right plot 
shows the distribution of number of PE. The mean of the second peak is used to 
convert (ADC counts x ns) to number of PE, which was obtained by Gaussian 
fitting.

![One PE distribution]({{site.ina}}/csi1pe.png)

The system was then exposed to various radioactive sources to find out the 
relationship between the number of PE and the energy in the unit of keV. The 
energy spectra is shown below.

![Energy spectrum at 77K]({{site.ina}}/csiespec.png)

The light yields at room and liquid nitrogen temperature are shown in the top 
figures.

Most of the plots were created using [ROOT][]. The manuscript was written in 
[Overleaf][].

[KIMS]:http://arxiv.org/abs/1404.3443
[ROOT]:https://root.cern.ch
[Overleaf]:https://www.overleaf.com/read/rjfhdbjwsbrp
