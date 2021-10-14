#!/bin/bash
name=$(echo "$1" | cut -f 1 -d '.')
pdflatex $name.tex
bibtex $name
pdflatex $name.tex
pdflatex $name.tex
evince $name.pdf &

## Cleanup
rm *.aux
rm *.log
rm *.bbl
rm *.blg