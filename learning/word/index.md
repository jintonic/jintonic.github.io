---
layout: note
category: cs
title: word
subtitle: in Microsoft Office
---

Minimal installation
====================

Just don't forget to install office-tools and Visual Basic for Applications.

Style
=====

Add new style
-------------

* format text according to the needs
* select the formated text
* right click a style item in the quick style galary
* select "Update xxx to Match Selection"
* click Change styles -> Style set -> Save as quick style set

Hyphenate like LaTeX
--------------------

Double-column scientific publications have very small line width. LaTeX often
breaks words at the end of a line with hyphens to keep lines aligned to both
ends. By default, Microsoft word does not automatically break words. It
enlarges spaces between words to achieve both-side alignment instead. This
results in a very unprofessional looking. The LaTeX-like hyphenation can be
easily enabled in Microsoft Word: Page Layout -> Hyphenation -> Automatic. 
Sometimes you also need to modify the "Paragraph" format in the "Normal" style. 
In the "Line and Page Breaks" tab, clear "Don't hyphenate".

Insertion
=========

Insert umlaut
-------------

*Ctrl-Shift-:* followed by one of *a*, *u* or *o*

Insert "page n of N"
--------------------

Page numbers are field, one can switch between field name and display using
alt+F9. Field PAGENUMBERS and SECTIONNUMBERS refer to the total number of pages
in a document and the total number of pages in a section, respectively.

Insert degree symbol
--------------------

Alt + keypad 0, 1, 7, 6. The numbers in the main keyboard won't work.

Insert non-breaking space
-------------------------

If you don't want to separate a value from its unit into different lines,
insert non-breaking space instead of normal space by pressing *C-S-space*.

Insert no-width optional break
------------------------------

It can be inserted to control the breaking of a long URL to different lines.
Insert -> Symbol -> More Symbols -> Special Characters -> No-Width Optional
Break.

Insert check box
----------------

Right click tool bar -> Customize the Ribbon -> Select "Developer" in the main
tabs and press OK. One will find a check box tool box in the "Developer"
Ribbon.

Headers and Footers
===================

Different footer/header in different pages
------------------------------------------

The key is to insert a section break. Different sections can have different
setups: layout -> breaks -> section break

One also need to break the link of current header/footer to previous ones to
allow them to be different: double click footer to edit it -> unlink to
previous one

Footer with page number and horizontal bar
------------------------------------------

Insert simplest footer, format it with top border, center alignment, insert
page number in current position.

Footnotes and Endnotes
======================

[] around endnotes/footnotes
----------------------------

Replace ^f (footnotes) or ^e (endnotes) with [^&]

Unsuperscript endnote numbers
-----------------------------

Right click endnote numbers at the end of the document, select style -> modify
font style -> uncheck superscript. This modifies both the numbers in the text
and at the end of the text.

Change footnote/endnote style from [1,2,3] to [1-3]
---------------------------------------------------

Select all numbers between the first and last ones, right click, select
"fonts", check "hidden" box; insert dash mannually.

Remove separator above endnotes
-------------------------------

Change to draft view, go to reference tab, click on show notes, select
"Endnotes Separator", delete the horizontal bar.

Citation
========

Mendeley Desktop -> Tools -> Install MS Word Plugin.

MS Word -> References -> Mendeley Cite-O-Matic -> Style: IEEE

Floats
======

Bind figure/table with caption
------------------------------

Insert a text box and put a figure or table with its caption in it.

Show table gridlines
--------------------

table tools -> layout -> show gridlines

Cooperation
===========

Track and Review Changes
------------------------

Turn on Track Changes (C-S-E) before editing.

