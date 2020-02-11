---
tags: [Git, GitHub]
---

### Create a GitHub repository
#### Scenario 1: You already have a project

See <https://help.github.com/en/github/importing-your-projects-to-github/adding-an-existing-project-to-github-using-the-command-line>

The key is to understand that you are dealing with three objects: your working copy, your local git repository, and the remote repository on GitHub.

#### Scenario 2: You want to start a project

You have two choices. First, you can simply follow the instruction for scenario 1. Second, you can [start a new project directly on GitHub](https://help.github.com/en/github/getting-started-with-github/create-a-repo), and then [clone it to your local PC](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository):

``` sh
$ cd /where/you/want/to/save/your/project/ # do this in your local PC
$ git clone git@github.com:yourgithubusername/yourproject.git
```

### Add a new file to a GitHub repository
#### Method 1: start from your local PC
``` sh
$ cd /path/to/your/project/ # do this in your local PC
$ ls -a # check if there is .git/, if not, check previous section
$ git pull # update local repository with remote one
$ git status # check status of your working copy
$ touch new.txt # create a new file
$ git status # see if git detects the new file
$ git add new.txt
$ git commit -m "added" new.txt # working copy -> local repository
$ git status # see if new.txt is added
$ git push # local repository -> GitHub repository
$ git status # see if there is anything else you need to deal with
```
If this is your first time to do this, Git may ask you to setup your username and email address. Simply follow the instruction Git prints on your screen. You can also check: <https://help.github.com/en/github/using-git/setting-your-username-in-git>

#### Method 2: do everything on GitHub
See <https://help.github.com/en/github/managing-files-in-a-repository/creating-new-files>
and <https://help.github.com/en/github/managing-files-in-a-repository/adding-a-file-to-a-repository>

### How to delete an empty directory in git

Git does not store any information about the directory, just the files within
it. If a directory is empty, simply rm it. Git does not need to know about it.

### steps to create and then delete a branch

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

### Add files to gitignore

~~~bash
$ vi .gitignore
$ git commit -m "updated" .gitignore
~~~

The *./gitignore* file in the root directory of a project effects every
directory inside the project unless the directory has its own *.gitignore*.

### Resolve conflict

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

In case of a binary file, the automatic merging is doomed to fail. If you want to keep the local copy, simply type in the last three lines of commands above, since your local copy has not yet been overwritten. If you want to keep the remote copy, do the following to overwrite the local copy with the remote version, and then type the last three lines of commands above.

```sh
git checkout origin/master file.bin
```

### Undo "git add"

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

### Undo "git mv"

Simply use "git mv" again to rename the file back.

### Show file name in git log

*git log* does not show modified file by default. According to [Stack
Overflow][sd], one has to use one of the followings,

~~~bash
$ git log --name-status
$ git log --name-only
$ git log --stat
~~~

[sd]:http://stackoverflow.com/questions/1230084/how-to-have-git-log-show-filenames-like-svn-log-v

### Change remote repository

~~~bash
$ git remote -v
$ git remote set-url origin git@github.com:usr/project.git
$ git remote -v
~~~

or 

~~~bash
$ vi .git/config # change url setting inside directly
~~~

### Show what was just committed

~~~bash
$ git diff-tree --no-commit-id --name-only -r SHA1
~~~

Ref. to [Stack Overflow][1]
[1]: http://stackoverflow.com/questions/424071/list-all-the-files-for-a-commit-in-git

### Discard local changes

According to [Stack Overflow][2], for a specific file use:
[2]: http://stackoverflow.com/questions/52704/how-do-you-discard-unstaged-changes-in-git

~~~bash
$ git checkout path/to/file/to/revert
~~~

For all unstaged files use:

~~~bash
git checkout -- .
~~~

Make sure to include the period at the end.

### Use Git to maintain .files in home directory

- [clone a repository to an existing folder](https://stackoverflow.com/questions/9864728/how-to-get-git-to-clone-into-current-directory)
- [use a branch for each OS related settings](https://stackoverflow.com/questions/436125/two-git-repositories-in-one-directory)

### Use multiple repositories to maintain a single project

<https://softwareengineering.stackexchange.com/questions/150114/two-git-repositories-one-project/150199>

### Skip typing password when connecting to remote git repository through https

<https://stackoverflow.com/questions/5343068/is-there-a-way-to-skip-password-typing-when-using-https-on-github/>

### keep forked repostory synced with upstream

<https://gist.github.com/CristinaSolana/1885435>:
```sh
git remote add upstream git://github.com/ORIGINAL-DEV-USERNAME/REPO-YOU-FORKED-FROM.git
git fetch upstream
git pull upstream master
git push
```

Another way is to use branches instead of `git pull`:
<https://help.github.com/en/articles/syncing-a-fork>
