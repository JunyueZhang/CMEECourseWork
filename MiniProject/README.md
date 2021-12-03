# CMEECourseWork MiniProject
## Brief description
The MiniProject directory is organized with code, data, results, sandbox, README.md, and images. Five different mathematical models are applied to fit the population growth data using ordinary linear and non-linear least squares methods in order to find the ones which best fit the dataset. The models include phenomenological quadratic and cubic polynomial models,the logistic model, modified Gompertz model (Zwietering et. al., 1990), and the Baranyi model (Baranyi, 1993).

## Languages
The languages used in the miniproject are R and bash.

## Dependencies
In R, nls.lm package is necessary because the nlsLM function is used, and ggplot2 is loaded to generate beautiful figures for plotting. 

## Installation
Packages can be easily built and shared by users through cran.r-project.org. A package can be installed by using the install.packages() command. In Ubuntu, the bash terminal can also be adopted to install a package by typing "sudo apt install r-cran-package-name".

## Project structure and Usage
The MiniProject section includes code, data, results, images, and sandbox. The images directory is used to store figures for the LaTeX report. The data directory contains several csv files to display the coefficients of each model as well as the corresponding AIC, BIC, and R squared values. There are a few important scripts in the code directory. 
+ The Data preparation script imports the data and prepares it for model fitting.  
+ The Model fitting script does model fitting and calculates AIC, BIC, R squared values.
+ The Final plotting and analysis script plots every curve with the five models overlaid and performs analyses of the results of the Model fitting.
+ The CompileLaTeX.sh script compiles the LaTeX source code.
+ The run_MiniProject.sh script runs the whole project, right down to compilation of the LaTeX  document.
+ The citation.bib, titlepage.tex, and miniproject.tex create the LaTeX report together.

## Author name and contact
Junyue Zhang  jz1621@ic.ac.uk
