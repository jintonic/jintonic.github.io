---
layout: note
category: cs
title: github 
subtitle: cloud service hosting Git repositories
---

Pages
=====

A markdown file without front-matter will not be converted.

Debugging pages online at [Travis CI](https://travis-ci.org).

tag cloud
---------

site.categories and site.tags work only for posts not for pages.

[http://vvv.tobiassjosten.net/jekyll/jekyll-tag-cloud/](http://vvv.tobiassjosten.net/jekyll/jekyll-tag-cloud/)

posts in subdirectories
-----------------------

site.posts only lists posts in the \_posts/ directory. It does not list posts in
a subdirectory/\_posts/ directory. One has to use
site.categories.subdirectoryName for the latter.

Sorted site.pages
-----------------
According to [issue 42 of plusjade/jekyll-bootstrap][jbi42], Github sorts
*site.pages* by the timestamps of the static html files. One can sort
*site.pages* using the *sort* filter provided by [liquid][lsort]:

~~~liquid
{% raw %}
{% assign sorted = site.pages | sort:"path" %}
{% for each in sorted %}
  <li><a href="{{ each.path }}">{{ each.title }}</a></li>
{% endfor %}
{% endraw %}
~~~

According to [stack overflow][so], custom attributes cannot be used for
sortting. One has to use "path" (full path to the file) or "name" (name of the
file) for sorting.

[jbi42]: https://github.com/plusjade/jekyll-bootstrap/issues/42
[lsort]: https://github.com/Shopify/liquid/wiki/Liquid-for-Designers
[so]: http://stackoverflow.com/questions/9053066/sorted-navigation-menu-with-jekyll-and-liquid
