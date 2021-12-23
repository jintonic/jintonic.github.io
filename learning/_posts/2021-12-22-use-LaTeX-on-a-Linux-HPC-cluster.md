---
tags: [LaTeX, ORNL, COHERENT, Linux, HPC]
---

For various reasons, default programs on a Linux High Performance Computing ([HPC][]) cluster are normally quite outdated. [LaTeX][] may be one of them. [SSH][] into your cluster and run `latex --version` to find out how old yours is. There are two problems with an old [LaTeX][] installation. First, many new [LaTeX][] packages widely used may not be included. Second, sometimes, the installation is too old to even allow you to add new packages to it to fix the first problem.

Before we talk about ways to fix the two problems, we need to think whether it is necessary to use [LaTeX][] on a Linux cluster at all. After all, the main purpose of a Linux cluster is for computing, not typesetting a document. Beside, there are online [LaTeX][] platforms to allow you to write articles in [LaTeX][] together with your collaborators, such as [Overleaf][]. However, I do find it convenient to write scientific papers with [LaTeX][] on a cluster, which normally include many figures as the results of complex data analyses that are normally done directly on a cluster. You can download those figures from the cluster to your own computer, from where you upload them to [Overleaf][]. This is painful if you have a lot of figures and you need to update them from time to time as your analyses progress. A better way to deal with this is to [git][] [clone][] your [LaTeX][] project from [Overleaf][] or other places to your cluster, save your analysis scripts and resulting figures in the project, and [git][] [push][] them to remote servers like [Overleaf][] so that your colleagues can work on top of your update. But before that, you may want to check if you can compile your updated [LaTeX][] project on the cluster and whether the resulting paper is satisfactory. This is where a working [LaTeX][] installation on your cluster comes in handy.

## Local LaTeX configuration

Now, let's provide two solutions to the first problem, that is, how to deal with missing packages in an old [LaTeX][] installation. If you see error messages complaining about missing `.sty, .cls`, or `.bst`, etc. files when you run `latex yourPaper.tex`, search that file on Google to find out which [LaTeX][] package contains it, then go to [CTAN][] to download that package and unpack it to your [LaTeX][] project directory. The drawback of this solution is that your [LaTeX][] project would include many files that is not related to your work.

A better solution is to save the missing package to another directory and tell [LaTeX][] where to find it so that it will be kept separated from your personal [LaTeX][] project. Meanwhile, this package can be reused for your other [LaTeX][] projects. [LaTeX][] allows a normal Linux user (without [root][] privilege) to save his or her [LaTeX][] packages and configurations in a particular folder in the user's [home][] directory. This folder is defined by an [environment][] variable called [TEXMFHOME][]. You can check the definition of [TEXMFHOME][] in your system [TeX][] configuration file by running

```sh
kpsewhich texmf.cnf # locate system TeX config file
cat /path/to/system/texmf.cnf | grep TEXMFHOME
```

or simply

```sh
kpsewhich --var-value TEXMFHOME
```

If you don't have that folder, you can create it by yourself. If you don't like the default location of that folder, you can also change it by redefining the [environment][] variable [TEXMFHOME][]:

~~~sh
export TEXMFHOME=/a/folder/that/you/like
~~~

Remember to put the code above to your [SHELL][] configuration file (`.bashrc`, `.profile`, `.zshrc`, etc.) to make the change permanent.

Now you can put missing packages into this folder specified in `$TEXMFHOME` and run

~~~sh
cd /path/specified/in/TEXMFHOME
texhash . # or mktexlsr .
~~~

to create an index file that tells [LaTeX][] what's in this folder. *NOTE*: `.cls` and `.sty` files should go to `$TEXMFHOME/tex/latex/`, while `.bst` files should go to `$TEXMFHOME/bibtex/bst/`. Those files won't be found if you don't follow this conventional path specification.

It is very easy to make mistakes here or there if you manually install missing packages. Fortunately, if the [LaTeX][] installation is new enough (later than 2013), you can use a command called [tlmgr][] ([texlive][] manager) in [usermode][] to automatically pull packages from [CTAN][] to your `$TEXMFHOME`:

```sh
# create directory defined in $TEXMFHOME (only need to be run once)
tlmgr --init-usertree
# pull missing_package from CTAN to your $TEXMFHOME and update the index file
tlmgr --usermode install missing_package
```

## Local LaTeX installation

If the [LaTeX][] installation on your cluster is too old, it may not be able to handle new packages that you put in your `$TEXMFHOME` directory. In that case, you can install the entire [LaTeX][] program in your [home][] directory (Yes, [LaTeX][] can be installed without the [root][] privilege). You can follow the documentation of [texlive][] to achieve that. If you install [texlive][] in `~/texlive`, the `latex` command can be found in folder `~/texlive/20xx/bin/x86_64-linux/`. Another useful command in the same folder is [tlmgr][]. You can use it to install any missing package without being in the [usermode][]:

```sh
tlmgr install missing_package
```

This sounds like a very attractive solution. However, it takes a lot of time and disk space as well as command-line experience. Before you resort to this solution, ask around. It is very likely that some experienced user on the same cluster has already done that. All you need to do is to use his/her [LaTeX][] installation instead of the system one.

## LaTeX on an ORNL HPC cluster

Now let me explain how to use a [LaTeX][] installation that is not in the standard location. I will use an [HPC][] cluster at [ORNL][] called `hcdata` as an example. I have installed [texlive][] 2019 in my [home][] directory on `hcdata`. It is not the latest version, but is new enough to handle all scientific paper writings I have to do so far. To use it, put the following [environment][] variable settings in your `~/.bashrc` file:

```sh
export PATH=~jingliu/texlive/2019/bin/x86_64-linux:$PATH
export MANPATH=~jingliu/texlive/2019/texmf-dist/doc/man:$MANPATH
export INFOPATH=~jingliu/texlive/2019/texmf-dist/doc/info:$INFOPATH
```

You need to log out and then back into your terminal to let the new settings take effect. Run `which latex` to make sure that you are using my [LaTeX][] instead of the system one. As an example, you can download a [LaTeX][] project from the MARS group and try to compile it with my [LaTeX][] installation:

```sh
git clone https://code.ornl.gov/CASA/MARS.git
cd MARS/docs/papers/2021_MARSCharacterization
latexmk # a Perl script that automates latex compilations
```

You should be able to generate a pdf file `MARSCharacterization.pdf` upon a successful [LaTeX][] compilation.

[HPC]: https://www.hpc.iastate.edu/guides/introduction-to-hpc-clusters/what-is-an-hpc-cluster
[LaTeX]: https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes#What_is_LaTeX.3F
[SSH]: /learning/2020/01/22/SSH
[Overleaf]: https://www.overleaf.com
[git]: https://git-scm.com
[clone]: https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-clone
[push]: https://www.atlassian.com/git/tutorials/syncing/git-push
[CTAN]: https://ctan.org
[TEXMFHOME]: https://texfaq.org/FAQ-privinst
[root]: https://geek-university.com/linux/root-account
[home]: https://wiki.debian.org/home_directory
[environment]: https://www.geeksforgeeks.org/environment-variables-in-linux-unix
[TeX]: https://www.ctan.org/starter
[SHELL]: https://linuxcommand.org/lc3_lts0010.php
[texlive]: https://www.tug.org/texlive
[tlmgr]: https://www.tug.org/texlive/tlmgr.html
[usermode]: https://www.preining.info/blog/2013/04/tlmgr-user-mode
[ORNL]: https://www.ornl.gov
