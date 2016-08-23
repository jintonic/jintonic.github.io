---
tags: [phys-492/592, Geant4]
---

![gamma in air, Geant4 simulation]({{site.exa}}/ginair.png)

I wanted to buy a scintillation crystal to study its light yield at cryogenic 
temperatures. It had to be large enough to fully absorb 2.6 MeV gamma-rays and 
had to be small enough so that I could afford it. This was when [Geant4][] 
came into play. Plots shown in this blog are tracks of particles left in the 
air by three types of incident particles, alpha, beta and gamma-rays. One can 
clearly see how far they can go in air. The plots were generated using a 
[Geant4][] based program, [gears][]. It was written by [me][] and [one of my 
undergraduate students](https://github.com/byljcron). One can easily change 
the target material from air to a certain scintillation crystal in [Geant4][] 
to study the penetration length of the incident particle in the crystal. The 
size of the crystal can then be determined.

![beta in air, Geant4 simulation]({{site.exa}}/binair.png)

![alpha in air, Geant4 simulation]({{site.exa}}/ainair.png)

[Geant4]:https://geant4.web.cern.ch/geant4
[gears]:https://github.com/jintonic/gears
[me]:https://github.com/jintonic
