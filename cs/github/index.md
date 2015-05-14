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

To list posts in a subdirectory/\_posts/ directory, one has to use
site.categories.subdirectoryName.

debugging on Travis CI
----------------------

One does not have to install jekyll locally to compile the site before pushing
it to github pages. Github pages will compile all files before serving them.
One problem arises in this case. If Github pages fail to compile the site, it
does not give the reason. In order to know the reason without installing jekyll
locally, one can use an online service [Travis CI](https://travis-ci.org/) to
show the whole compile process. In order to do this, one needs to provide the
following two files in his site's root directory, *.travis.yml* and *Gemfile*
as instructed on the [Github help
page](https://help.github.com/articles/troubleshooting-github-pages-build-failures/).
If one encounters building errors on Travis CI related to ruby verson, one can
specify the ruby version in *.travis.yml* the following way:

~~~yaml
language: ruby
rvm:
    - 2.1.0
script: "bundle exec jekyll build"
~~~

where, the ruby version is specified in the second and the third lines.

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
