---
layout: note
title: markdown
---

# Syntax

- [original markdown](http://daringfireball.net/projects/markdown/syntax)
- [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown)
- [kramdown](http://kramdown.gettalong.org/syntax.html)

Nested list is created by indent.

A list, code block must be separated from its previous text by a blank line.

# Drawbacks

- [Wilfred Hughes](http://www.wilfred.me.uk/blog/2012/07/30/why-markdown-is-not-my-favourite-language/)

# Code block

## Syntax highlighting

Languages that can be highlighted in GitHub are listed here: https://github.com/github/linguist/blob/master/lib/linguist/languages.yml

# Jekyll for github pages

For MAC, run `homebrew install ruby`.
For [cygwin](https://cygwin.com),
install `ruby-devel`, `libffi-devel`, `libiconv-devel`, `zlib-devel`, `ruby-bigdecimal` through `setup-x86_64.exe`.

~~~sh
gem install github-pages # it will install jekyll as dependence
gem install html-proofer
~~~

Run

~~~sh
gem update github-pages
~~~

from time to time to keep updated with the packages.

Run

## Usage

### Refer to another post

{% raw %}
~~~liquid
{% post_url subfolder/without/leading/slash/yyyy-mm-dd-post-title-without-suffix %}
~~~
{% endraw %}
