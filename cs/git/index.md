---
layout: note
category: cs
title: git 
---

How to create a new repository
==============================

Suppose you already have a directory containing all files related to a project. Then what you need to do is just:

~~~ shell
$ cd /path/to/your/project/
$ git init # create .git/ in /path/to/your/project/
$ git add *
$ git commit -a -m "initial commit"
~~~

How to delete an empty directory in git
=======================================

Git does not store any information about the directory, just the files within
it. If a directory is empty, simply rm it. Git does not need to know about it.

steps to create and then delete a branch
========================================

~~~ bash
$ git branch # list existing branches
$ git branch a-new-branch # create a new branch
$ git checkout a-new-branch # switch to that branch
$ git commit some.file # commit some file in that branch
$ git push origin a-new-branch # sync that branch with server
$ git checkout master # switch back to master branch
$ git merge a-new-branch # merge a-new-branch to master
$ git push origin :a-new-branch # delete a-new-branch on server
$ git branch -d a-new-branch # delete it after deleting it on server
~~~

Add files to gitignore
======================

~~~ bash
$ vi .gitignore
$ git commit -m "updated" .gitignore
~~~

The *./gitignore* file in the root directory of a project effects every
directory inside the project unless the directory has its own *.gitignore*.

Resolve conflict
================

There are two scenarios

- git refuses to merge because it foresees a possible conflict
- git failed merging

In case of failed merging

~~~ bash
$ git status # to find which file has conflict
$ vi theConflictFile # fix conflict manually
$ git add theConflictFile
$ git commit -m "conflict solved" -a # need to commit everything
$ git push
~~~

The reason why one needs to run "git add" is because, sometimes, the file in
one branch is deleted, git does not know whether it needs to keep the file or
really delete it. In this case, one need to run "git add" to tell git that he
does not want to really delete it; or one need to run "git rm" to tell git
that he does want to really delete it.

