---
tags: [LaTeX, Mac]
---

```sh
# most of the time, these are all you need:
brew install basictex
sudo tlmgr install collection-fontsrecommended latexmk
# now try to compile your project using latexmk:
cd /path/to/your/LaTeX/project
latexmk
# if some.sty is missing,
# use the following command to find out which package includes it
tlmgr search --global --file some.sty
# and then install it
tlmgr install missingPackage
```

Further explanation: [MacTeX][] is large (~4 GB). [BasicTeX][] is a much smaller option that provides basic functionality of [LaTeX][]. However, [BasicTeX][] does not include [latexmk][] and some common fonts. Fortunately, the [tlmgr][] command is provided in [BasicTeX][]. One can use [tlmgr][] to find and install missing packages. Binary folder from [BasicTeX][] will be automatically added to \$PATH.

[BasicTeX][] updates once per year. Once it's updated, run

```sh
sudo tlmgr update --self
sudo tlmgr install collection-fontsrecommended latexmk
```

A similar package [TinyTeX][] works well for Windows and Linux.

[MacTeX]: https://www.tug.org/mactex
[BasicTeX]: https://www.tug.org/mactex/morepackages.html
[LaTeX]: https://www.latex-project.org
[latexmk]: https://mg.readthedocs.io/latexmk.html
[tlmgr]: https://tug.org/texlive/tlmgr.html
[TinyTeX]: https://yihui.org/tinytex

