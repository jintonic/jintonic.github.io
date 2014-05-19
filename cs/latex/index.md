---
layout: note
category: cs
title: latex
subtitle: typesetting scientific documents
---

Maths
=====

Long bar over expression
------------------------

~~~latex
$\bar{\nu_{\mu}}$ % short bar
$\overline{\nu_{\mu}}$ % long bar
~~~

Text in math mode
-----------------
To put it simple,

~~~latex
$\text{provided by amsmath package}$
$a^{\text{adapt correct size when used in subscripts}}$
$a^{\mbox{same size as normal even when used in subscripts}}$
$\text{rendered slowly}, \mbox{rendered fast}$
$\text{spaces won't be ignored}$
$\mathrm{d}f/\mathrm{d}x$ % it is for math symbols printed upright
$\text{umlaut \ss works here}, \mathrm{\ss does not work here}$
$\operatorname{foo}$ % similar to \sin, with small spaces before and after
$\mathrm{foo}$ % without small spaces before and after
~~~

Figures
=======

Margins of eps
--------------

~~~ bash
head figure.eps
~~~

shows something like

~~~
%!PS-Adobe-2.0 EPSF-2.0
%%BoundingBox:  0 0 567 384
%%Title: figure.eps
~~~

Sizes of the margins are defined by the *BoundingBox*, which can be editted
directly. Several tools are available to find the optimized the bounding box
automatically:

~~~ bash
epstool --copy --bbox orignal.eps new.eps
~~~

~~~ bash
ps2epsi orignal.eps new.eps
~~~

If one does not want to change the original file, he can crop the figure inside
the latex file using the [graphicx](http://ctan.org/pkg/graphicx) package:

~~~ latex
\includegraphics[trim=lx ly rx ry, clip]{figure}
~~~

