# Convert pdf to pdf/a

pdf/a has all fonts embedded in the file. According to [a stackoverflow post](https://stackoverflow.com/questions/1659147/how-to-use-ghostscript-to-convert-pdf-to-pdf-a-or-pdf-x), the following command can be used to achieve this:

```sh
gs -dPDFA -dBATCH -dNOPAUSE -sProcessColorModel=DeviceRGB
   -sDEVICE=pdfwrite -sPDFACompatibilityPolicy=1
   -sOutputFile=output.pdf input.pdf
```

# Extract Pages From a PDF

[Set range of pages](http://www.linuxjournal.com/content/tech-tip-extract-pages-pdf):

```sh
gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
   -dFirstPage=22 -dLastPage=36 \
   -sOutputFile=outfile_p22-p36.pdf 100p-inputfile.pdf
```

[One page per file](http://stackoverflow.com/questions/10228592/splitting-a-pdf-with-ghostscript):

```sh
gs -sDEVICE=pdfwrite -dSAFER -o outname.%d.pdf input.pdf
```

Or using pdftk:

```sh
pdftk pingpass.pdf cat 1-enddown output ping.pass.pdf
```

# Reduce PDF file size

According to [an article online](http://www.documentsnap.com/reduce-pdf-file-size-ghostscript/), one can change PDF settings to reduce files size:

```sh
gs -sDEVICE=pdfwrite -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=out.pdf in.pdf
```
