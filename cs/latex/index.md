---
layout: note
category: cs
title: latex
subtitle: typesetting scientific documents
---

Math
====

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
