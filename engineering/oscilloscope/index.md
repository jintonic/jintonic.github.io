---
layout: note
category: engineering
title: oscilloscope
---

Basic
=====

Oscilloscopes nowadays are basically all Digital Storage Oscilloscopes or DSO
in short. They have front-end electronics to deal with analog voltage input,
analog-to-digital converter to digitize the input signal, and internal or
external memory to store the diginized waveforms for later display and
analysis.

The stand-alone bench oscilloscope in practice is better than cheap USB ones.
The later normally has very poor front-end electronics, low sampling rate and
narrow bandwidth. [Picotech][pico] provides high-end USB oscilloscopes. Given
the same price, USB ones provides higher precision, more memory, more functions
and better data logging, but less bandwidth and sampling rate than bench
oscilloscopes.

The top 3 oscilloscope companies are Tektronix, Agilent and LeCroy. Recently,
Rigol in China provides the cheapest low end oscilloscopes with high quality.

[pico]: http://www.picotech.com/

Rigol DS6104
============

It has no touch screen, but the price is 1/3 of those from big companies. The
CD attached contains the software and drivers to operate the oscilloscope
through USB or LAN. The readme file tells you to download USB driver from NI
first.  But it is misleading. One just need to extract files from
*\SOFTWARE\Ultra Sigma(PC)Installer.rar* using 7z, run *setup.exe* and all
drivers from NI will be installed automatically.

