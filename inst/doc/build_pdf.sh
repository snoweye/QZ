#!/bin/sh

rm *.aux *.bbl *.blg *.log *.out *.toc
pdflatex QZ-guide.Rnw
bibtex QZ-guide
pdflatex QZ-guide.Rnw
pdflatex QZ-guide.Rnw
pdflatex QZ-guide.Rnw
rm *.aux *.bbl *.blg *.log *.out *.toc
