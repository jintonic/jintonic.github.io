---
layout: note
title: Ghostscript
subtitle: a command-line PDF processor
---

## Configuration

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

## Convert pdf to pdf/a

pdf/a has all fonts embedded in the file. According to [a stackoverflow post](https://stackoverflow.com/questions/1659147/how-to-use-ghostscript-to-convert-pdf-to-pdf-a-or-pdf-x), the following command can be used to achieve this:

```sh
gs -dPDFA -dBATCH -dNOPAUSE -sProcessColorModel=DeviceRGB
   -sDEVICE=pdfwrite -sPDFACompatibilityPolicy=1
   -sOutputFile=output.pdf input.pdf
```

If you see error messages like

```
GPL Ghostscript 9.52: Annotation set to non-printing,
 not permitted in PDF/A, annotation will not be present in output file
```

Try to change `-sPDFACompatibilityPolicy=1` to `-dPDFACompatibilityPolicy=1`, as explained [here](https://stackoverflow.com/questions/39994410/ghostscript-wont-convert-pdf-to-pdf-a-annotation-issue).

## Extract Pages From a PDF

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

## Reduce PDF file size

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

## Remove bookmarks

```sh
pdf2ps input.pdf
ps2pdf input.ps
```
The file size can be kept small this way.

## Add bookmarks

Ref.:
[thechriskent.com](https://thechriskent.com/2017/02/13/applying-pdfmark-to-pdf-documents-using-ghostscript/),
[ubuntu forums](https://ubuntuforums.org/showthread.php?t=1545064).

Create a simple text file with a random name, for example, `bookmarks`. Put the following into this file.

```
[/PageMode /UseOutlines /DOCVIEW pdfmark
[/Title (Prologue) /Page 1 /OUT pdfmark
[/Title (Chapter 1) /Page 5 /OUT pdfmark
[/Title (Chapter 2) /Page 27 /OUT pdfmark
```

The first line enables the display of the bookmark sidebar in a pdf viewer. The rest adds bookmarks with titles on individual specified pages.

Run the following command to use this file:

```sh
gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=out.pdf in.pdf bookmarks
```
