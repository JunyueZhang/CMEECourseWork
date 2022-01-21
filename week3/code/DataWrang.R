################################################################
################## Wrangling the Pound Hill Dataset ############
################################################################
rm(list = ls()) # clean the environment
############# Load the dataset ###############
# header = false because the raw data don't have real headers
MyData <- as.matrix(read.csv("../data/PoundHillData.csv", header = FALSE))

# header = true because we do have metadata headers
MyMetaData <- read.csv("../data/PoundHillMetaData.csv", header = TRUE, sep = ";")

############# Inspect the dataset ###############
head(MyData) # get the first parts of the matrix
dim(MyData) # get the size of the matrix
str(MyData) # get the internal structure of the matrix
fix(MyData) # edit MyData
fix(MyMetaData) # edit MyMetaData

############# Transpose ###############
# To get those species into columns and treatments into rows 
MyData <- t(MyData) # calculate transpose of the matrix
head(MyData)
dim(MyData)

############# Replace species absences with zeros ###############
MyData[MyData == ""] = 0

############# Convert raw matrix to data frame ###############

TempData <- as.data.frame(MyData[-1,],stringsAsFactors = F) #stringsAsFactors = F is important!
colnames(TempData) <- MyData[1,] # assign column names from original data
rownames(TempData) <- NULL # set the row names of the data frame to null

############# Convert from wide to long format  ###############
#install.packages("reshape2")
require(reshape2) # load the reshape2 package

#?melt #check out the melt function

MyWrangledData <- melt(TempData, id=c("Cultivation", "Block", "Plot", "Quadrat"), variable.name = "Species", value.name = "Count")
# take data in wide format and stack a set of columns into a single column of data


## convert the columns to factors
MyWrangledData[, "Cultivation"] <- as.factor(MyWrangledData[, "Cultivation"])
MyWrangledData[, "Block"] <- as.factor(MyWrangledData[, "Block"])
MyWrangledData[, "Plot"] <- as.factor(MyWrangledData[, "Plot"])
MyWrangledData[, "Quadrat"] <- as.factor(MyWrangledData[, "Quadrat"])
MyWrangledData[, "Count"] <- as.integer(MyWrangledData[, "Count"]) # convert the column to integer

## Inspect the dataset
str(MyWrangledData)
head(MyWrangledData)
dim(MyWrangledData)

############# Exploring the data (extend the script below)  ###############
#install.packages("tidyverse")
require(tidyverse) # load the tidyverse package
tidyverse_packages(include_self = TRUE) # the include_self = TRUE means list "tidyverse" as well 
dplyr::glimpse(MyWrangledData) #like str(), but nicer!
dplyr::filter(MyWrangledData, Count>100) #like subset(), but nicer!
dplyr::slice(MyWrangledData, 10:15) # Look at an arbitrary set of data rows
