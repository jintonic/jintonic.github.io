---
tags: [phys-492/592, Geant4]
---

![gamma in air, Geant4 simulation]({{site.ina}}/ginair.png)

I wanted to buy a radiation detector with a limited budget. The detector had to be large enough to fully absorb high energy gamma-rays and 
had to be small enough so that I could afford it. This was when [Geant4][] 
came into play. Plots shown in this blog are tracks of particles left in the 
air by three types of incident particles, alpha, beta and gamma-rays. One can 
clearly see how far they can go in air. The plots were generated using a 
[Geant4][] based program, [gears][]. It was written by [me][] and [one of my 
undergraduate students](https://github.com/byljcron). One can easily change 
the target material from air to another material in [Geant4][] 
to study the penetration length of the incident particle in that material. The 
size of the detector can then be determined.

![beta in air, Geant4 simulation]({{site.ina}}/binair.png)

As we can see from these plots, the same particles with the same energy shot
into the air at the same initial direction do not follow the same trajectory.
Their trajectories vary from each other. That is why we cannot **calculate**
the trajectory of a particle. We can only **simulate** it because this is a
random process. What we can calculate are only the **probabilities** of the
particle to loose energy, change direction, or get absorbed, etc. With these
probabilities calculated, we can randomly assign a new direction and energy to
an outgoing particle based on the probability. This is called [Monte Carlo
(MC) simulation](https://en.wikipedia.org/wiki/Monte_Carlo_method).

![alpha in air, Geant4 simulation]({{site.ina}}/ainair.png)

[Geant4][] is a set of C++ libraries that are used to simulate particles
interacting with materials. It is the user's responsibility to write a [main
function](http://en.cppreference.com/w/cpp/language/main_function) to use these
libraries. [Geant4][] provides
[examples](http://geant4-userdoc.web.cern.ch/geant4-userdoc/Doxygen/examples_doc/html/)
to demonstrate its usage. Unfortunately, it is very time consuming to write a
fully functional program with some basic Geant4 features included.

That was why we wrote [gears][], a single C++ file with a main function in it
that utilizes many Geant4 functionalities. One can get started with Geant4
simulation quickly using [gears][].

[Geant4]:https://geant4.web.cern.ch/geant4
[gears]:https://github.com/jintonic/gears
[me]:https://github.com/jintonic
