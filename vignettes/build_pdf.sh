#!/bin/sh

R_HOME=`Rscript -e 'cat(R.home()[1])'`
JSS_BST=${R_HOME}/share/texmf/bibtex/bst/jss.bst
JSS_CLS=${R_HOME}/share/texmf/tex/latex/jss.cls

rm *.aux *.bbl *.blg *.log *.out *.toc *.bst *.cls
cp ${JSS_BST} ./
cp ${JSS_CLS} ./

pdflatex QZ-guide.Rnw
bibtex QZ-guide
pdflatex QZ-guide.Rnw
pdflatex QZ-guide.Rnw
pdflatex QZ-guide.Rnw
Rscript -e "tools::compactPDF('.', gs_quality='ebook')"
rm *.aux *.bbl *.blg *.log *.out *.toc *.bst *.cls

qpdf QZ-guide.pdf ../inst/doc/QZ-guide.pdf
# mv -f *.pdf ../inst/doc/
rm -f *.pdf
cp -f *.Rnw ../inst/doc/
