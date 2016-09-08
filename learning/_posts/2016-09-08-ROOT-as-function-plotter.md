---
tags: [ROOT, phys-492/592, C++]
---

If you know how to [use PuTTY to log into a remote Linux server from any Windows PC]({% post_url 2016-08-29-connect-to-Linux-from-any-Windows-PC %}) and [run an X-Window server in your Windows PC]({% post_url 2016-09-07-run-Linux-GUI-from-any-Windows-PC%}), you will be able to use [ROOT][] as a function plotter, as described in the [ROOT primer](https://root.cern.ch/guides/primer):

``` c++
ROOT [0] TF1 *f1 = new TF1("f1", "sin(x)/x", 0.,10.);
ROOT [1] f1->Draw();
```

The results would look like the following screen shot:

![sin(x)/x shown in ROOT canvas]({{site.exa}}/tf1result.png)


