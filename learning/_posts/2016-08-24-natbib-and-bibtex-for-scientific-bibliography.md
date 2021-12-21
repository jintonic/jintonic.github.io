---
tags: [LaTeX, phys-492/592]
---

```bib
@article{naiad05,
  title = "Limits on {WIMP} cross-sections from the {NAIAD} experiment at the {Boulby} {Underground} {Laboratory}",
  author = "{UK Dark Matter Collaboration} and G.J. Alner and H.M. Ara\'{u}jo and others",
  journal = {Phys. Lett. B},
  volume = "616",
  pages = "17--24",
  year = "2005",
  eprint = "0504031",
  archivePrefix = "arXiv",
  primaryClass = "hep-ex",
}
```

As a graduate student, you may only write 1 or 2 papers with a dozen of citations in each. The best way for you to deal with it in [LaTeX][] is probably the [most basic bibliography support][embedded] within [LaTeX][]:

```tex
\begin{thebibliography}{99}

\bibitem{lamport94}
  Leslie Lamport,
  \emph{\LaTeX: a document preparation system},
  Addison Wesley, Massachusetts,
  2nd edition,
  1994.
\end{thebibliography}
```

where you write the author, title etc. all by hand. You will have to style the output manually as well, using [LaTeX][] commands, such as `\emph{}` in the example above.

When you become a postdoc, you may have to coauthor several papers in a certain field. This is when you need to consider switching to a more sophisticated reference system. The most common approach in natural science publications is to use a combination of [BibTeX][] and [natbib][] as described in [this][seterm] and [this][seuse] posts on *StackExchange*:

```tex
\usepackage[numbers,sort&compress]{natbib}
\bibliographystyle{unsrtnat} % sort by order of appearance
\bibliography{BibTeXFileWithoutSuffix}
```

An example [BibTeX][] entry is given at the beginning of this post. Detailed description of the [BibTeX][] format is available from [bibtex.org][format] and [wikibooks][]. How to cite an [arXiv][] article using [BibTeX][] is described [here][eprint] and shown in the top example.

It looks like that eventually the good and old combination of [BibTeX][] + [natbib][] will be replaced by the new and shining combination of [Biber][] + [BibLaTeX][]. But please don't make the change too soon if your primary usage of [LaTeX][] is for scientific publications. The advantages and disadvantages of both systems are described in detail in [this post][seterm] on *StackExchange*. Basically, because most of the scientific publishers still maintain their own [BibTeX][] style files, you will have to use the old combination for submitting your paper draft to them. You can certainly use the new system to write your own book and publish it through *Amazon*.

I personally use [Zotero][] to automatically generate *.bib* files in [BibTeX][] or [BibLaTeX][] format. The switching between the two system is not that hard.

[embedded]:https://en.wikibooks.org/wiki/LaTeX/Bibliography_Management#Embedded_system
[natbib]:https://www.ctan.org/pkg/natbib
[BibTeX]:http://www.bibtex.org
[BibLaTeX]:https://www.ctan.org/pkg/biblatex
[Biber]:http://biblatex-biber.sourceforge.net
[LaTeX]:https://www.latex-project.org
[wikibooks]:https://en.wikibooks.org/wiki/LaTeX/Bibliography_Management#BibTeX
[seuse]:http://tex.stackexchange.com/questions/5091/what-to-do-to-switch-to-biblatex
[seterm]:http://tex.stackexchange.com/questions/25701/bibtex-vs-biber-and-biblatex-vs-natbib
[format]:http://www.bibtex.org/Format
[arXiv]:http://arxiv.org
[eprint]:http://arxiv.org/hypertex/bibstyles
[Zotero]:https://www.zotero.org

