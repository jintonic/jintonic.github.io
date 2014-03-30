---
layout: note
category: cs
title: git 
---

How to create a new repository
==============================

Suppose you already have a directory containing all files related to a project. Then what you need to do is just:

    $ cd /path/to/your/project/
    $ git init # create .git/ in /path/to/your/project/
    $ git add *
    $ git commit -a -m "initial commit"


How to delete an empty directory in git
=======================================

Git does not store any information about the directory, just the files within
it. If a directory is empty, simply rm it. Git does not need to know about it.

