---
layout: note
category: cs
title: git 
---

How to create a new repository
==============================

Suppose you already have a directory containing all files related to a project.
Then what you need to do is just:

~~~bash
$ cd /path/to/your/project/
$ git init # create a .git/ directory in /root/of/your/project/
$ git add * # make sure no temporary files in the directory!
$ git commit -a -m "initial commit"
~~~

How to delete an empty directory in git
=======================================

Git does not store any information about the directory, just the files within
it. If a directory is empty, simply rm it. Git does not need to know about it.

steps to create and then delete a branch
========================================

~~~bash
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

~~~bash
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

~~~bash
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

Undo "git add"
==============

If you have not *git commit* changes, run

~~~bash
$ git reset things-added-but-not-committed
~~~

Otherwise, run

~~~bash
$ git rm --cached things-added-and-committed
~~~

The option "--cached" helps to keep the working copy. Since *git rm* won't
change the history. The files that you added will stay in the git history. It
is complicated to [completely remove them from the history][sens]. Deleting the
*.git* directory and do *git init* again is much faster and simpler if you
don't care about the history.

[sens]:https://help.github.com/articles/remove-sensitive-data

Undo "git mv"
=============

Simply use "git mv" again to rename the file back.

Show file name in git log
=========================

*git log* does not show modified file by default. According to [Stack
Overflow][sd], one has to use one of the followings,

~~~bash
$ git log --name-status
$ git log --name-only
$ git log --stat
~~~

[sd]:http://stackoverflow.com/questions/1230084/how-to-have-git-log-show-filenames-like-svn-log-v

Change remote repository
========================

~~~bash
$ git remote -v
$ git remote set-url origin git@github.com:usr/project.git
$ git remote -v
~~~

or 

~~~bash
$ vi .git/config # change url setting inside directly
~~~

Show what was just committed
============================

~~~bash
$ git diff-tree --no-commit-id --name-only -r SHA1
~~~

Ref. to [Stack Overflow][1]
[1]: http://stackoverflow.com/questions/424071/list-all-the-files-for-a-commit-in-git

Discard local changes
=====================

According to [Stack Overflow][2], for a specific file use:

~~~bash
$ git checkout path/to/file/to/revert
~~~

For all unstaged files use:

~~~bash
git checkout -- .
~~~

Make sure to include the period at the end.

[2]: http://stackoverflow.com/questions/52704/how-do-you-discard-unstaged-changes-in-git