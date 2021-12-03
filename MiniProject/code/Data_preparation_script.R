rm(list=ls()) # clean the global environment
graphics.off()
data <- read.csv("../data/LogisticGrowthData.csv") # import data from the csv file
print(sprintf("Loaded %d columns.", ncol(data)))


library(ggplot2) # load necessary packages
require("minpack.lm")
print(colnames(data))

read.csv("../data/LogisticGrowthMetaData.csv") 
dim(data) # have a look at the data structure
str(data)
head(data)

print(unique(data$PopBio_units)) # have a look at the units of PopBio
print(unique(data$Time_units)) # have a look at the units of Time

data$ID <- paste(data$Species, as.character(data$Temp), data$Medium, data$Citation, sep = "_")
# infer single growth curves by combining Species, Medium, Temp and Citation columns into one ID column


length(unique(data$ID)) # have a look at the ID column
print(unique(data$ID))


for (i in 1:length(data$Time)){
  if ((data$Time)[i] < 0){
    data$Time[i] <- 0
  }
} # convert the negative values of Time into zeros

data <- data[data$PopBio > 0, ] # drop the negative values of PopBio in order to use the log transformation
data$LogPopBio <- log(data$PopBio) # log-transform the data


write.csv(data, "../data/LogisticGrowthDataClean.csv") # export the data to a csv file
