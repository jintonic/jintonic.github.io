---
tags: [LaTeX]
---

``` tex
\usepackage{titlesec} % fine tune section title
\titlelabel{} % remove number in front of title
\titlespacing{\section}{0em}{0em}{0em} % remove spaces before/after title
```

``` tex
\usepackage{fancyhdr}
% define new style
\fancypagestyle{overview}{\fancyhf{} % clear old style
  \fancyhead[L]{\textbf{Letter of Intent}}
  \fancyhead[R]{\textbf{Overview of Research Plan}}
  \fancyfoot[C]{Page \textbf{\thepage}~of~\textbf{2}}
}

\pagestyle{overview} % use newly defined style

```

Set margins, add top horizontal bar, etc.:

``` tex
\usepackage[left=1in, right=1in, top=1in, bottom=1in,
headsep=0.5em, footskip=2em]{geometry}
```

``` tex
\usepackage{enumitem}
\setlist{nolistsep} % remove spaces between listed items
```

``` tex
\usepackage{setspace}
\doublespacing
\singlespacing
```

Snippet of the [final results](https://www.overleaf.com/read/wpwgqfwgfkrh):

![LaTeX style tuning]({{site.exa}}/latex-style-tuning.png)

