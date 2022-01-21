# CMEECourseWork Week1
## Brief description
The week1 directory is organized with **code**, **data**, **results**, **sandbox**, and **writeup**. There are a few data files downloaded from the [TheMulQuaBio repository](https://github.com/mhasoba/TheMulQuaBio) in the data directory. 
The sandbox directory includes several test files.  
The UnixPrac1.txt in the code directory is written in UNIX shell commands to solve the [FASTA exercise](https://mhasoba.github.io/TheMulQuaBio/notebooks/01-Unix.html#fasta-exercise). The code directory also includes several shell scripts such as csvtospace.sh and tabtocsv.sh.
The [csvtospace.sh](https://mhasoba.github.io/TheMulQuaBio/notebooks/02-ShellScripting.html#a-new-shell-script) is designed to transform a comma-delimited file to a space-separated values one and save the file under a different name. 
The bash script [CompileLaTeX.sh](https://mhasoba.github.io/TheMulQuaBio/notebooks/04-LaTeX.html#first-latex-example) is used to make it more convenient for users to compile the script by typing "bash CompileLaTeX.sh FirstExample.tex".  
And the rest of the shell scripts are modified based on the existing ones in the [Shell scripting chapter](https://mhasoba.github.io/TheMulQuaBio/notebooks/02-ShellScripting.html#a-useful-shell-scripting-example) to improve robustness.  The **writeup** directory holds the LaTeX written work and compiled pdf of the written report.
## Languages
The languages used in week1 are UNIX commands (Ubuntu 20.04.3), bash shell, and LaTeX.

## Dependencies
The shell script tiff2png.sh needs to install imagemagick. LaTeX is also necessary to be installed to run the CompileLaTeX.sh.

## Installation
The Ubuntu desktop can be downloaded via [installation tutorial](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview). LaTeX can be installed by typing this in terminal: "sudo apt-get install texlive-full texlive-fonts-recommended texlive-pictures texlive-latex-extra imagemagick".

## Project structure and Usage
The week1 section includes code, data, results, sandbox, and writeup. There are some shell scripts in the code directory. 
+ The csvtospace.sh script can convert a comma-delimited file to a space-separated one and save it with a different name. 
+ The CompileLaTeX.sh script can accept "FirstExample.tex" as an input to create the LaTeX file.
+ The UnixPrac1.txt is used to solve the FASTA exercise.  As for the rest of the scripts, they have been improved to be more robust based on the original ones. They can test whether the file exists or is null and exit the file if necessary.
+ The boilerplate.sh script is a simple boilerplate for shell scripts.
+ The ConcatenateTwoFiles.sh script can concatenate the contents of two files.
+ The CountLines.sh script can count lines in a file.
+ The MyExampleScript.sh script introduces the environmental variable.
+ The tabtocsv.sh script can substitute the tabs in the files with commas.
+ The tiff2png.sh script can convert tiff to png.
+ The variables.sh script illustrates different types of shell variables (and assignments).
+ The writeup directory includes FirstBiblio.bib, FirstExample.tex, and FirstExample.pdf.  
All the scripts can be easily run with the bash command and correct script name.

## Author name and contact
Junyue Zhang jz1621@ic.ac.uk
