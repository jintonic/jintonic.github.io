---
layout: note
category: cs
title: vim
subtitle: a classic text editor
---

Fix arrow keys showing A B C D in inserting mode
------------------------------------------------
I use ssh + screen to work in remote machines.

~~~
:set term
~~~

in vim returns *screen*. By setting the term explicitly to *xterm* in .vimrc
solves the problem:

~~~
set term=xterm
~~~

Misc
====

Check where a variable is set
-----------------------------

    :verbose set aSetting

Remove ^M in files created in Windows
-------------------------------------

    :set filetype=unix

Vim will remove all ^M after saving.

Plug-in's
=========

vim-pathogen
------------
[vim-pathogen](https://github.com/tpope/vim-pathogen) allows to install any
plugin by just dropping it in ~/.vim/bundle.

vim-markdown
------------
Vim regards \*.md as modula2 files by default. This behavior can be overwritten
by installing
[plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown).
Unfortunately, it does not recognize YAML front-matters.

[tpope/vim-markdown](https://github.com/tpope/vim-markdown) with
[tpope/vim-liquid](https://github.com/tpope/vim-liquid) solves the problem but
it does not provide folding.

supertab
--------

    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabNoCompleteAfter = [',', '\s', ';', '\_^']

snipmate
--------
It needs tlib and vim-addon-mw-utils. One also needs to download snippets.

SnipMate load snippets files based on the current file type. To add snippets
to the right snippets file, run the following command in vim:

    :SnipMateOpenSnippetFiles

and use arrow keys to select the right file.

### Format of a snipmate file ###
Take ~/.vim/snippets/help.snippets as an example:

    snippet t1
    <literal tab>$\{1\}\{\{\{4~
    <literal tab>$\{2\}
    <literal tab>\}\}\}

smartinput
----------
or autoclose.vim http://www.vim.org/scripts/script.php?script_id=1849

fuzzyfind
---------
It needs L9.

vcscommand
----------
Good for SVN and CVS. Not so nice for git. Does not work for RCS.
