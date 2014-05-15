---
layout: note
category: cs
title: root
subtitle: data analysis framework for physicists
---

Forcing axis label displayed exponentially
==========================================
According to [Ramble on programming tips for the particle physicist][ram],

~~~cpp
TGAxis *axis = (TGAxis*) histogram->GetYaxis();
axis->SetMaxDigits(3);
~~~

[ram]: http://diana.parno.net/thoughts/?p=91
