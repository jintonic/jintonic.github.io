---
tags: [LaTeX, Mac]
---

```sh
# most of the time, these are all you need:
brew install basictex
sudo tlmgr install latexmk
tlmgr init-usertree
tlmgr --usermode install collection-fontsrecommended
# now try to compile your project using latexmk:
cd /path/to/your/LaTeX/project
latexmk
# if some.sty is missing,
# use the following command to find out which package includes it
tlmgr search --global --file some.sty
# and then install it
tlmgr --usermode install missingPackage
```

[MacTeX][] is large (~4 GB). [BasicTeX][] is a much smaller option that provides basic functionality of [LaTeX][]. However, [BasicTeX][] does not include [latexmk][] and some common fonts. Fortunately, the [tlmgr][] command is provided in [BasicTeX][]. One can use [tlmgr][] to find and install missing packages. Binary folder from [BasicTeX][] is automatically added to \$PATH. [latexmk][] will be available in the user's command line as soon as it is installed.

Except for [latexmk][], other packages can be installed into the user's [texmf][] folder, the location of which can be found using command `kpsewhich -var-value TEXMFHOME`. In a Mac, it defaults to `~/Library/texmf` and can be initialized using `tlmgr init-usertree`. Option `--usermode` for [tlmgr][] is used to interact with the user's [texmf][] folder instead of the system one.

## Update

[BasicTeX][] updates once per year. It wil be updated in a Mac automatically with `brew upgrade`. [latexmk][] installed with the previous version will be missing. Run the following command to recover it.

```sh
sudo tlmgr install latexmk
```

One may also want to run the following command to update packages installed in the user's [texmf][] folder:

```sh
tlmgr --usermode update --all
```

To list all installed packages in one's own [texmf][] folder, run:

```sh
tlmgr --usermode list --only-installed
```

A similar package [TinyTeX][] works well for Windows and Linux.

[MacTeX]: https://www.tug.org/mactex
[BasicTeX]: https://www.tug.org/mactex/morepackages.html
[LaTeX]: https://www.latex-project.org
[latexmk]: https://mg.readthedocs.io/latexmk.html
[tlmgr]: https://tug.org/texlive/tlmgr.html
[texmf]: https://tex.stackexchange.com/a/420623
[TinyTeX]: https://yihui.org/tinytex

## Useful Packages

```sh
tlmgr --usermode install enumitem pgf
```
- [enumitem][]: Control layout of itemize, enumerate, description
- [pgf][]: Create PostScript and PDF graphics in TeX

[enumitem]: https://ctan.org/pkg/enumitem
[pgf]: https://ctan.org/pkg/pgf


### Packages Needed for Springer Nature Journals

Since December 2024, a [new LaTeX package](https://www.springernature.com/gp/authors/campaigns/latex-author-support) is recommended for Springer Nature Journals. Place `sn_jnl.cls` and `sn_mathphys-num.bst` together with your `main.tex` for European Physics Journal series. Install the following packages to compile.

```sh
tlmgr --usermode install algorithms algorithmicx appendix multirow ncctools rsfs sttools threeparttable
```

## Integration with VS Code

```sh
brew install tex-fmt
```

Install [LaTeX Workshop][] extension. Select [tex-fmt][] as the formatter. The extension uses [latexmk] to automate the compilation.

[LaTeX Workshop]: https://github.com/James-Yu/LaTeX-Workshop
[tex-fmt]: https://github.com/WGUNDERWOOD/tex-fmt
