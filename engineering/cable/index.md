---
layout: note
category: engineering
title: cable
---

Coaxial cables
==============

Coax in short.

Structure (from inside out): core wire, dielectric insulator, 1 or several
layers of metallic boil, mesh or braid, outer sheath or jacket.

One layer of braid can block 95% of external interference with an approximate
shielding effectiveness of -55 dB. The left 5% can be blocked by adding extra
layers of foil with an approximate shielding effectiveness of -90 dB.

*RG*, Radio Guide coax. Old military standard. Commonly used ones:

- RG-59, RG-6, RG-11 from low end to high end uses, impedance: 75 Ohm, outer
  diameter: 6.1, 6.86, 10.5 mm, respectively. Used with F connectors for TV. 
- RG-58, RG-142 from low end to high end uses, impedance: 50 Ohm, outer
  diameter: 5, 4.95 mm, respectively.
- RG-316/U, impedance: 50 Ohm, outer diameter: 2.6 mm, single shield,
  used with LEMO 00 connector.

*LMR*, [nobody knows what it stands for][k3dav]. Made by [Times Microwave
Systems][times]. Low loss coax, 50 Ohm. [Catalog][cat]:

- LMR-100A, outer diameter: 2.79 mm, replace RG-316.
- LMR-195, outer diameter: 4.95 mm, replace RG-58, RG-142.

[k3dav]:http://www.k3dav.com/lmrcoaxialcables.htm
[times]:http://www.timesmicrowave.com/cms/products/cables/lmr/
[cat]:http://www.timesmicrowave.com/documents/resources/Complete%20Catalog.pdf

Coaxial connectors
==================

*LEMO* 00, Leon Mouttet connector. Miniature push-pull 50 Ohm coaxial
connector. Replacement of BNC in high density design, front panel connectors
for NIM & CAMAC modules. Diameter: ~ 5 mm.

*BNC*, Bayonet Neill Concelman connector. Diameter: 14.5 mm (Male), 11.1 mm
(Female). Passband: 0-4 GHz. Impedance: 75 or 50 Ohm. The 75 Ohm types can
sometimes be recognized by the reduced or absent dielectric in the mating ends. 

*SHV*, Safe High Voltage (>500V) connector. Up to 5 kV DC, 5 A. 20 kV version
also available.

*MHV*, Miniature High Voltage (>500V) connector. Up to 5 kV DC, 3 A. Easily
mistaken as BNC.

*MCX*, Micro CoaX connector. Diameter: 3.6 mm. Passband: 0-6 GHz. Impedance: 75
or 50 Ohm. Gold plated. Snap-on interface.

*SMA*, Sub-Miniature version A. Diameter: 7.9 mm. Passband: 0-18 GHz.
Impedance: 50 Ohm. Screw coupling.

*F connector*, for TV. Cheap because core wire of cable is used as pin of male
connector. Diameter: 11 mm. Passband: 0-1 GHz, Impedance: 75 Ohm.

