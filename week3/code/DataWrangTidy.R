################################################################
################## Wrangling the Pound Hill Dataset ############
################################################################


require(tidyverse) # load the tidyverse package

############# Load the dataset ###############
# header = false because the raw data don't have real headers
MyData <- as.matrix(read.csv("../data/PoundHillData.csv", header = FALSE))

# header = true because we do have metadata headers
MyMetaData <- read.csv("../data/PoundHillMetaData.csv", header = TRUE, sep = ";")

############# Inspect the dataset ###############
head(MyData)
dim(MyData) # get the size of the matrix
dplyr::glimpse(MyData) # str(MyData)
utils::View(MyData) # fix(MyData) 
fix(MyMetaData)

############# Transpose ###############
# To get those species into columns and treatments into rows 
MyData <- t(MyData) 
head(MyData)
dim(MyData) # get the size of the matrix again

############# Replace species absences with zeros ###############
MyData[MyData == ""] = 0

############# Convert raw matrix to data frame ###############

TempData <- as.data.frame(MyData[-1,], stringsAsFactors = F) # stringsAsFactors = F is important!
colnames(TempData) <- MyData[1,] # assign column names from original data
rownames(TempData) <- NULL # assign row names to NULL

############# Convert from wide to long format  ###############

MyWrangledData <- tidyr::gather(TempData, Species, Count, -c(Cultivation, Block, Plot, Quadrat))
# convert the data to long format

MyWrangledData <- dplyr::transmute(MyWrangledData, Cultivation = as.factor(Cultivation), Block = as.factor(Block), Plot = as.factor(Plot), Quadrat = as.factor(Quadrat), Species = as.factor(Species), Count = as.integer(Count))
# assign the correct data types to each column


dplyr::glimpse(MyWrangledData)  # str(MyWrangledData)
head(MyWrangledData)
dim(MyWrangledData)

############# Exploring the data (extend the script below)  ###############

dplyr::glimpse(MyWrangledData) # like str(), but nicer!
dplyr::filter(MyWrangledData, Count>100) # like subset(), but nicer!
dplyr::slice(MyWrangledData, 10:15) # Look at an arbitrary set of data rows 