# Configuration

Frequently used `gs` options can be saved in an environment variable as default:

```sh
export GS_OPTIONS="-dSAFER -dBATCH -dNOPAUSE -sDEVICE=pdfwrite"
```

They can be overwritten by command line options.

This way, the command to combine PDF files can be shortened from

```sh
gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=combined.pdf file1.pdf file2.pdf
```

to

```sh
gs -o combined.pdf file1.pdf file2.pdf
```

where, `-o` is a short form of `-sOutputFile=`.

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

Available settings to optimize the file size include

- PDFSETTINGS=/screen   (screen-view-only quality, 72 dpi images)
- PDFSETTINGS=/ebook    (low quality, 150 dpi images)
- PDFSETTINGS=/printer  (high quality, 300 dpi images)
- PDFSETTINGS=/prepress (high quality, color preserving, 300 dpi imgs)
- PDFSETTINGS=/default  (almost identical to /screen)
