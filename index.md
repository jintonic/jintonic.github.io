---
---

[![Student evaluation](https://img.shields.io/badge/Student-Evaluation-green.svg)](https://www.ratemyprofessors.com/ShowRatings.jsp?tid=2008328)
[![Courses taught](https://img.shields.io/badge/Courses-Taught-orange.svg)](teaching)

Hi, I'm Jing LIU /jiŋ liou/, a [professor][] in [physics][] at the University of South Dakota ([USD][]), [SD][], [US][], also known as [jintonic][] on [GitHub][] and [physino][] on [YouTube][]. You can get connected to me through various social media channels:
<a href="https://www.youtube.com/c/PhysinoXyz"><i class="fab fa-youtube"></i></a>
<a href="https://github.com/jintonic"><i class="fab fa-github"></i></a>
<a href="https://www.facebook.com/physino/"><i class="fab fa-facebook"></i></a>
<a href="https://www.linkedin.com/in/physino"><i class="fab fa-linkedin"></i></a>

[![arXiv](https://img.shields.io/badge/arXiv-articles-yellow.svg)](https://arxiv.org/a/liu_j_2.html)
[![Google Scholar](https://img.shields.io/badge/Google-Scholar-blue.svg)](https://scholar.google.com/citations?user=yKumdPcAAAAJ)
<a href="https://orcid.org/0000-0003-1869-2407"><i class="fab fa-orcid"></i></a>

I am one of the analysis coordinators of the [COHERENT][] experiment at the Spallation Neutron Source ([SNS][]), Oak Ridge National Laboratory ([ORNL][]), searching for new physics through the detection of Coherent Elastic neutrino(ν)-Nucleus Scatterings ([CEvNS][]). I also represent the USD [group][] in the COHERENT [Collaboration][] Board (CB). Please tell me your USD email address if you want to access the COHERENT [Wiki][], [Slack][] channel, and [Git repositories][GitLab]. I maintain a series of [tutorials][] here to help you get started with <a href="tags/#COHERENT"><i class="fas fa-tag"></i>COHERENT</a> and <a href="tags/#ORNL"><i class="fas fa-tag"></i>ORNL</a> related research.

[![My Lab](https://img.shields.io/badge/My-Lab-orange.svg)](https://lab.physino.xyz)

My group is developing [cryogenic scintillating crystal](https://drive.google.com/drive/u/0/folders/0BwM7XYhFgK7oM2lITXdBLWlBc3M) and high purity germanium ([HPGe][]) crystal based particle detectors.  I am the cryogenic CsI subsystem coordinator in [COHERENT][]. Please tell me your preferred Gmail accounts for me to share with you our internal resources about them hosted on Google Drive.

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://www.youtube.com/c/PhysinoXyz)
[![bilibili](https://img.shields.io/badge/B-站-blue?style=flat)](https://space.bilibili.com/610308328)

I initiated and co-organized [summer schools](http://pire.gemadarc.org/education/) for particle phyiscs and radiation detection since 2018. The school became virtual in 2020 because of COVID, and I started to post tutorials about [Geant4][] in my [YouTube][] and [bilibili][] channels.

[![Physics Department](https://img.shields.io/badge/Physics-Department-blue?style=flat)](https://www.facebook.com/usdphys)
[![Physics Club](https://img.shields.io/badge/Physics-Club-green?style=flat)](https://www.facebook.com/usdphysicsclub)

I administrate the USD Physics [Department][] and [Club][] pages on Facebook. Please let me know through [my Facebook channel][facebook] if you want to get connected or contribute to the pages.

[professor]: https://www.usd.edu/faculty-and-staff/Jing-Liu
[physics]: https://www.usd.edu/physics
[USD]: tags/#USD
[jintonic]: https://github.com/jintonic
[GitHub]: tags/#GitHub
[physino]: https://www.youtube.com/c/PhysinoXyz
[YouTube]: https://www.youtube.com
[SD]: tags/#South-Dakota
[US]: tags/#US
[COHERENT]: https://sites.duke.edu/coherent
[SNS]: https://neutrons.ornl.gov/sns
[ORNL]: https://www.ornl.gov
[CEvNS]: https://www.youtube.com/watch?v=lWQgzuWHlyY
[group]: https://sites.duke.edu/coherent/collaboration/#U._of_South_Dakota
[collaboration]: https://sites.duke.edu/coherent/collaboration
[Wiki]: https://coherent.phy.duke.edu
[Slack]: https://coherentsns.slack.com
[GitLab]: https://code.ornl.gov
[GEMADARC]: http://pire.gemadarc.org
[NSF]: https:/www.nsf.gov
[PIRE]: https://beta.nsf.gov/funding/opportunities/partnerships-international-research-and-education-pire-0
[Club]: https://www.facebook.com/usdphysicsclub
[Department]: https://www.facebook.com/usdphys
[DM]: http://pire.gemadarc.org/science/#menu2
[0vbb]: http://pire.gemadarc.org/science/#menu1
[HPGe]: https://drive.google.com/drive/u/0/folders/0BwM7XYhFgK7oWVozNTY5alhjNzQ
[facebook]: https://www.facebook.com/physino
[YouTube]: https://www.youtube.com/c/PhysinoXyz
[bilibili]: https://space.bilibili.com/610308328
[Geant4]: https://geant4.web.cern.ch
[tutorials]: learning

---

<ul class="list-unstyled">
  {% for post in site.posts limit:100 %}
  {% unless post.next %}
  <h4>{{ post.date | date: '%Y' }}</h4>
  {% else %} {% capture year %}{{ post.date | date: '%Y' }}{% endcapture %} {% capture nyear %}{{ post.next.date | date: '%Y' }}{% endcapture %}
  {% if year != nyear %}
  <h4>{{ post.date | date: '%Y' }}</h4> {% endif %}
  {% endunless %}
  <li><span class="glyphicon glyphicon-time"></span> {{ post.date | date_to_string }} &raquo; <a class="text-uppercase" href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

