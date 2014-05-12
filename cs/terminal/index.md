---
layout: note
category: cs
title: terminal
---

Stop printing accidentally from rxvt
====================================

Explicitly set the following X resource of rxvt to something you like instead
of the default value: *lpr*:

~~~
Rxvt*print-pipe: cat > /path/to/somewhere/you/like
~~~

