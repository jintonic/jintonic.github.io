---
layout: note
category: cs
title: LaTeX
subtitle: typesetting scientific documents
---

## Install packages in HOME directory

Check the definition of TEXMFHOME in your system tex config file:

~~~sh
kpsewhich texmf.cnf # locate system tex config file
cat /path/to/system/texmf.cnf | grep TEXMFHOME
~~~

or simply
```sh
kpsewhich --var-value TEXMFHOME
```

You can change it in your shell:

~~~sh
export TEXMFHOME=/where/you/like
~~~

Put new packages into directory specified in TEXMFHOME and run

~~~sh
cd /path/specified/in/TEXMFHOME
texhash . # or mktexlsr .
~~~

*NOTE*: *.cls* and *.sty* files should go to *TEXMFHOME/tex/latex/*, while
*.bst* files should go to *TEXMFHOME/bibtex/bst/*. Those files won't be found
if you don't follow this conventional path specification.

One can use the [ctanify][] script to automatically organize a flat latex package based on the tex directory structure:

```sh
cd /path/to/a/flat/latex/package
$TEXMF/scripts/ctanify/ctanify *
tar xfvz package.tar.gz
unzip -d $TEXMFHOME package.tds.zip
```

[ctanify]: https://ctan.org/pkg/ctanify

## Maths

### Long bar over expression

~~~latex
$\bar{\nu_{\mu}}$ % short bar
$\overline{\nu_{\mu}}$ % long bar
~~~

### Text in math mode

To put it simple,

~~~latex
$\text{provided by amsmath package}$
$a^{\text{adapt correct size when used in subscripts}}$
$a^{\mbox{same size as normal even when used in subscripts}}$
$\text{rendered slowly}, \mbox{rendered fast}$
$\text{spaces won't be ignored}$
$\mathrm{d}f/\mathrm{d}x$ % it is for math symbols printed upright
$\text{umlaut \ss works here}, \mathrm{\ss does not work here}$
$\operatorname{foo}$ % similar to \sin, with small spaces before and after
$\mathrm{foo}$ % without small spaces before and after
~~~

## Figures

### Margins of eps

~~~sh
head figure.eps
~~~

shows something like

~~~
%!PS-Adobe-2.0 EPSF-2.0
%%BoundingBox:  0 0 567 384
%%Title: figure.eps
~~~

Sizes of the margins are defined by the *BoundingBox*, which can be editted
directly. Several tools are available to find the optimized the bounding box
automatically:

~~~sh
epstool --copy --bbox orignal.eps new.eps
~~~

~~~sh
ps2epsi orignal.eps new.eps
~~~

If one does not want to change the original file, he can crop the figure inside
the latex file using the [graphicx](http://ctan.org/pkg/graphicx) package:

~~~ latex
\includegraphics[trim=lx ly rx ry, clip]{figure}
~~~

## Hyperlinks

~~~ latex
\usepackage{ifpdf}
\ifpdf
\usepackage{epstopdf}
%\usepackage{pdflscape} % pdf version of lscape
\usepackage[usenames,dvipsnames]{color}
\usepackage[pdftex,bookmarks=true,hypertexnames=false]{hyperref}
\pdfadjustspacing=1
\else
%\usepackage{lscape} % provide \begin{landscape}...\end{landscape}
\usepackage[usenames,dvips]{color}
\usepackage[ps2pdf]{hyperref}
\fi
~~~

### Hyperlinks in reference

One has to find out first which entries in a bibtex item can be shown as
specified by the style file with the surfix *.bst*,

~~~ 
$ vi a-specific-bibtex-style-file.bst
...
ENTRY
{ address
  author
  booktitle
  chapter
  collaboration
  edition
  editor
  howpublished
  institution
  journal
  key
  month
  note
  number
  organization
  pages
  publisher
  school
  series
  title
  type
  volume
  year
  url
  doi
  eprint
  pubmed
}
{}
{ label extra.label sort.label short.list }
...
~~~

Entry *note* is your best bet,

~~~
@article{eg,
author = {Some Body and others},
note = {\url{http://some.body.com}},
}
~~~

*\url* is provided by [hyperref](http://www.ctan.org/pkg/hyperref) package or
the old [url](http://www.ctan.org/pkg/url) package.

## Version control

If you regret from time to time that you should have not deleted some parts of
your latex document, you should consider put your file under version control.
If you are the only one working on the document, both [RCS](../rcs) and
[Git](../git) are good choices. They save the history of revisions together
with your working file locally, which allows you to use them even when you
don't have Ethernet connection to some server where histories are saved.

If you would like to backup your work in an additional location, consider using
[GitHub](../github), where your work is publicly accessible, or [Dropbox][db],
where your work is kept private unless you choose to share it.

If you save the whole working directory to [Dropbox][db], temporary files
generated during the compiling of LaTeX are also saved in [Dropbox][db], which
is probably not what you want. The solution is to keep your working directory
out of [Dropbox][db] while keep the directory for version control in it.

The way to realize that using [RCS](../rcs) + [Dropbox][db] is to symbol link
the *RCS* directory to Dropbox as shown in the following example:

~~~sh
~/Dropbox $ ls -F
rcs/
~/Dropbox $ cd ~/Working
~/Working $ ls -l
drwxr-xr-x 3 user group 4.0K time RCS->~/Dropbox/rcs/doc1/
-rw-r--r-- 1 user group 2345 time doc1.tex
~~~

The way to realize that using [Git](../git) + [Dropbox][db] is to at first turn
*/path/to/latex/doc/* into a working directory controlled by [Git](../git),

~~~sh
/path/to/latex/doc $ git init
Initialized empty Git repository in /path/to/latex/doc/.git/
/path/to/latex/doc $ git add .
/path/to/latex/doc $ git commit -m "first commit"
24 files changed, 23391 insertions(+)
create mode 100644 doc.tex
...
~~~

then create an empty [bare repository][br] in [Dropbox][db],

~~~sh
$ git init --bare ~/Dropbox/git/my-latex-doc.git 
~~~

and at last, connect and push contents in your working directory to the bare
repository in [Dropbox][db],

~~~sh
/path/to/latex/doc $ git remote add dropbox ~/Dropbox/git/my-latex-doc.git
/path/to/latex/doc $ git push -u dropbox master
~~~

When you have updated your working directory, you can push changes to your bare
repository in [Dropbox][db],

~~~sh
/path/to/latex/doc $ git push
~~~

## How to escape LaTeX special characters

According to http://www.cespedes.org/blog/85/how-to-escape-latex-special-characters, there are 10 special characters, # \$ % & \ ^ _ { } ~, in LaTeX.  Most of them can be escaped prepending a simple backslash, but \, ^ and ~ need special treatment:
- for backslash (\) use \textbackslash{}
- for caret (^) use \^{} or \textasciicircum{}
- for tilde (~) use \~{} or \textasciitilde{}

[db]: https://www.dropbox.com/
[br]: https://www.google.com/search?q=git+bare+repository
