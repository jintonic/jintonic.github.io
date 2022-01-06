---
tags: [COHERENT, ORNL, Struck, electronics]
---

[![SIS3316 data structure](https://drive.google.com/uc?id=18IFF7jwUIV335iYFMGHka-D9cdxdex1i)](
https://docs.google.com/presentation/d/e/2PACX-1vQ8q9QP3hZKz1GvGrbdIByHBSqEr8Z2XLoKUVqJaOV7qcGFtBahEKQnFrE8yiFEXoPuPR3n_i-c1a2m/pub?start=false&loop=false&delayms=3000)

It is surprisingly hard to find information online about the data structure of a binary output file from a [Struck][] [SIS3316][] [ADC][]. Its [manual][] only talks about the structure of an event, not the overall structure of an output file. With four days of online searching, trials and errors during the 2021 Christmas, I finally figured it out. Please click the picture above for more information. A small [GitHub][] project, [ROSA][] is created to convert [Struck][] binary output to [ROOT][] format based on this understanding.

[Struck]: https://www.struck.de
[SIS3316]: https://www.struck.de/sis3316.html
[ADC]: https://www.struck.de/vme.htm
[manual]: https://www.slac.stanford.edu/grp/ssrl/spear/epics/site/gtr/sis3302-M-010E-001-v109.pdf
[GitHub]: https://github.com
[ROSA]: https://github.com/jintonic/rosa
[ROOT]: https://root.cern.ch

