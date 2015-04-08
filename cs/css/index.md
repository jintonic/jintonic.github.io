---
layout: note
category: cs
title: css
subtitle: Cascading Style Sheets
---

@media
=======
There is no need to provide several css files, for example, one for screen, one
for printing, etc. The same functionality is provided by the
[@media](http://www.w3schools.com/css/css_mediatypes.asp) rule.

Make entire line with a link clickable
======================================

Set

```css
a { display: block; }
```

the link will be in a separated line and the whole line is clickable.

Wrapping lines instead of zooming-out to fit small screens
==========================================================

According to [this web
page](http://webdesign.tutsplus.com/articles/quick-tip-dont-forget-the-viewport-meta-tag--webdesign-5972),
one can set

```css
@viewport { zoom: 1.0; width:extend-to-zoom; }
```

to instruct a mobile browser to wrap lines instead of zooming out to display
the whole contents.

Show text in pre tag in normal size in small screens
====================================================

According to [this web
page](http://www.passwordincorrect.com/controlling-size-pre-tag-mobile-devices/),
one can set

```css
pre { white-space: pre-wrap !important; }
```

to show text in the *pre* tag in normal size in small screens. No need to set
*overflow* or *font-size*.

id and class
============

There should be only one element in a page identified with an *id*, many
elements can share the same *class*.

According to [this web page](http://css-tricks.com/the-difference-between-id-and-class/)

> If you have a URL like http://yourdomain.com#comments, the browser will
> attempt to locate the element with an ID of "comments" and will automatically
> scroll the page to show that element... This is an important reason right here
> why having ID's be absolutely unique is important. So your browser knows where
> to scroll!


web font
========

It is now possible to use a font from a web server instead from the user\'s
local machine. For example, [Google fonts](https://www.google.com/fonts)
provides a lot of free fonts, which can be used in the css file. Once a web
font is used to display a web page, the page will be shown with the same font
in different browsers and OS.

Practically, there are simply too many choices. The [web safe
fonts](http://www.w3schools.com/cssref/css_websafe_fonts.asp), or fonts commonly
available for most browsers, together with their variances in case, size,
color, style, etc. are enough for most cases.

A careful setting on [font
size](http://typecast.com/blog/a-more-modern-scale-for-web-typography) is very
important to make the web page pretty on different size of screens.

Center html body
================
```css
body {
  margin: 0 auto;
  width: 80%;
}
```
