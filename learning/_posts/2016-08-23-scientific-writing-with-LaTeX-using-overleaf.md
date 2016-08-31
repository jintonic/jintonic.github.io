---
tags: [LaTeX, phys-492/592]
---

![edit LaTeX in Overleaf]({{site.exa}}/overleaf.png)

[LaTeX][] is a document preparation system widely used for scientific 
publications. Simply put, a [LaTeX][] document is just a text file written in a 
specific format as shown in the following example:

``` tex
\documentclass{article}
\title{Your article title}
\author{Author Name}
\date{Publication date}

\begin{document}
\maketitle

\section{Introduction}
\subsection{Background}
\subsection{Current Status}
\section{Experiment}
Experimental setup is described here.
\section{Results}
\section{Conclusion}
\section{Acknowledgment}
\end{document}

```

A set of programs is used to convert this source file into a well formated PDF
file for electronic publication or printing:

![LaTeX output]({{site.exa}}/latexoutput.png)

The final product of [LaTeX][] and *Microsoft Word* can be equally good. The 
biggest difference between [LaTeX][] and *Microsoft Word* is that [LaTeX][] is 
free. The second difference from users' point of view is that in [LaTeX][] you 
do not work on the final product directly, instead, you work on the source file 
and can only see the final product after you convert your source file using 
some program. Many people are not used to editing an article without seeing the 
final result immediately. However, most of the modern [LaTeX][] file editors 
provide incident conversion and show the final result in parallel to the source 
file.

There are many online [LaTeX][] editors nowadays, for example, [ShareLaTeX][] 
and [Overleaf][] (previously named *WriteLaTeX*), etc. In addition to showing 
the final result in parallel to the source file, they also provide methods for 
collaborative editing of the same article. I have tried both. The reason I 
settled down in [Overleaf][] is because the free version of it provides better 
support for collaborative writing.

The screen shot on top shows the web page based user interface provided by 
[Overleaf][]. The left most panel shows a file browser. The middle panel shows 
the source file under editing. The right most shows the final result. One can 
upload bibtex files through the top tool bar in the left most panel. One has to 
register an user account to use [Overleaf][].

[LaTeX]:https://www.latex-project.org
[ShareLaTeX]:https://www.sharelatex.com
[Overleaf]:https://www.overleaf.com
