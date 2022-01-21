# CMEECourseWork Week3
## Brief description
The week3 directory is organized with **code**, **data**, results, **writeup**, sandbox, README.md, and .gitignore. There are a few data files downloaded from the [TheMulQuaBio repository](https://github.com/mhasoba/TheMulQuaBio) as required in the data directory. 
The sandbox directory and results directory are used to store test scripts and results for the scripts in the code directory, respectively.  
The code directory contains a number of important scripts for the  [R chapter](https://mhasoba.github.io/TheMulQuaBio/notebooks/07-R.html#practicals) and [Data Management and Visualization chapter](https://mhasoba.github.io/TheMulQuaBio/notebooks/08-Data_R.html#id3).  And the writeup directory holds the LaTeX written work and compiled pdf documents for [Is Florida getting warmer Exercise](https://mhasoba.github.io/TheMulQuaBio/notebooks/07-R.html#id2) and [Autocorrelation in Florida weather Exercise](https://mhasoba.github.io/TheMulQuaBio/notebooks/07-R.html#id2). 
**Before running the scripts, there are some packages requested to be installed: tidyverse, ggplot2, reshape2, maps, sqldf**.

## Languages
The languages used in week3 are R, python, bash, and LaTeX.


## Dependencies
For the week3 section, there are some useful R packages such as tidyverse needed to be installed. Requiring tidyverse will load the core tidyverse packages: ggplot2, for data visualisation; dplyr, for data manipulation; tidyr, for data tidying. **To be more specific, tidyverse, ggplot2, reshape2, maps, and sqldf these packages need to be installed before running the Rscripts.** To run the get_TreeHeight.py script, these python packages need to be imported: sys, pandas, and numpy.

## Installation
Packages can be easily built and shared by users through cran.r-project.org. A package can be installed by using the install.packages() command. In Ubuntu, the bash terminal can also be adopted to install a package by typing "sudo apt install r-cran-package-name".

## Project structure and Usage
The week3 part includes code, data, results, writeup, and sandbox. There are some R scripts in the code directory.
+ The apply1.R script uses "apply" to apply the same R’s inbuilt functions to rows/columns of a matrix. 
+ The apply2.R script builds the function "SomeOperation" to take an input v. Then if the sum of v is greater than zero, it multiplies that value by 100.
+ The basic_io.R script imports and exports the csv files in several ways.
+ The boilerplate.R script builds a function called MyFunction to print the statements involving Arg1, Arg2.
+ The break.R script uses "break" to break out of a loop when some condition is met.
+ The browse.R script uses the browser() function to insert a breakpoint in the script and then step through the code.
+ The control_flow.R script contains seven blocks of control flow code.
+ The DataWrang.R script implements some of the key data wrangling principles on the dataset.
+ The DataWrangTidy.R script uses tidyverse (and specifically, dplyr and tidyr) for the same data wrangling steps.
+ The Florida_warming.R script applies a distribution of random correlation coefficients between Florida temperature and years.
+ The Girko.R script combines some commands for plotting the Girko’s law simulation.
+ The GPDD_Data.R script creates a world map and superimposes on the map all the locations from data in the GPDD dataframe.
+ The MyBars.R script combines some commands for annotating a plot.
+ The next.R script uses "next" to skip to the next iteration of a loop.
+ The plotLin.R script combines some commands for annotating a linear regression plot.
+ The PP_Dists.R script draws and saves three figures, each containing subplots of distributions of predator mass, prey mass, and the size ratio of prey mass over predator mass by feeding interaction type.
+ The PP_Regress.R script creates one pdf file containing the required figure and calculates the regression results corresponding to the lines fitted in the figure and saves it to a csv delimited table.
+ The preallocate.R script displays the difference in efficiency between the pre-allocated function and the non-preallocated one.
+ The R_conditionals.R script contains three blocks of code showing functions with conditionals.
+ The Ricker.R script displays the Ricker model which is a classic discrete population model.
+ The sample.R script shows an example of vectorization involving lapply and sapply.
+ The SQLinR.R script is copied from the code directory of TheMUlQuaBio.
+ The TreeHeight.R script calculates the heights of trees given distance of each tree from its base and angle to its top, using the trigonometric formula.
+ The try.R script covers several blocks of code illustrating the try command.
+ The Vectorize1.R script illustrates vectorization in R.
+ The Vectorize2.R script creates a function called stochrickvect that vectorizes the original one to the extent possible, with improved performance.
+ The get_TreeHeight.R script takes a csv file name from the command line (e.g., get_TreeHeight.R Trees.csv) and outputs the result to a file.
+ The get_TreeHeight.py script is a Python version of get_TreeHeight.R.
+ The run_get_TreeHeight.sh script can test get_TreeHeight.R and get_TreeHeight.py.
+ The TAutoCorr.R script applies a distribution of random correlation coefficients in temperatures between successive years in Florida.  
**The writeup directory contains two LaTeX files called Florida_warming.tex and TAutoCorr.tex respectively. There are two pdf documents about the results and interpretation written in LaTeX for the Florida_warming.R and TAutoCorr.R scripts. There is also a CompileLaTeX.sh script used to compile the LaTeX files.**
All the scripts can be easily run with the source command and the correct script name.

## Author name and contact
Junyue Zhang  jz1621@ic.ac.uk
