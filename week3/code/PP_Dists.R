MyDF <- read.csv("../data/EcolArchives-E089-51-D1.csv") # import csv data to a data frame
require(tidyverse) # load the tidyverse package
dplyr::glimpse(MyDF) # inspect and explore data
MyDF$Type.of.feeding.interaction <- as.factor(MyDF$Type.of.feeding.interaction) # change the type to factor

n <- length(levels(MyDF$Type.of.feeding.interaction)) # calculate the number of feeding types
pdf("../results/Pred_Subplots.pdf") # save the first sub-plot
par(mfcol=c(n,1)) # initialize multi-paneled plot
i <- 1
while (i <= n){
  plotDF1 <- subset(MyDF, Type.of.feeding.interaction == levels(MyDF$Type.of.feeding.interaction)[i]) # extract the dataset by every feeding type at each iteration
  par(mfg = c(i,1)) # specify which sub-plot to use in proper order
  hist(log10(plotDF1$Predator.mass), xlab = "log10(Predator Mass (g))", ylab = "Count", col = "lightblue", main = paste("Predator Mass by Feeding Interaction Type:", levels(MyDF$Type.of.feeding.interaction)[i])) # plot histogram including labels and title
  i <- i + 1
}
dev.off() # close the graphic window

pdf("../results/Prey_Subplots.pdf") # save the second sub-plot
par(mfcol=c(n,1)) # initialize multi-paneled plot
i <- 1
while (i <= n){
  plotDF2 <- subset(MyDF, Type.of.feeding.interaction == levels(MyDF$Type.of.feeding.interaction)[i]) # extract the dataset by every feeding type at each iteration
  par(mfg = c(i,1)) # specify which sub-plot to use in proper order
  hist(log10(plotDF2$Prey.mass), xlab = "log10(Prey Mass (g))", ylab = "Count", col = "yellow", main = paste("Prey Mass by Feeding Interaction Type:", levels(MyDF$Type.of.feeding.interaction)[i])) # plot histogram including labels and title
  i <- i + 1
}
dev.off() # close the graphic window

pdf("../results/SizeRatio_Subplots.pdf") # save the third sub-plot
par(mfcol=c(n,1)) # initialize multi-paneled plot
i <- 1
while (i <= n){
  plotDF3 <- subset(MyDF, Type.of.feeding.interaction == levels(MyDF$Type.of.feeding.interaction)[i]) # extract the dataset by every feeding type at each iteration
  par(mfg = c(i,1)) # specify which sub-plot to use in proper order
  hist(log10(plotDF3$Prey.mass / plotDF3$Predator.mass), xlab = "Size Ratio of Prey Mass over Predator Mass", ylab = "Count", col = "red", main = paste("Size Ratio by Feeding Interaction Type:", levels(MyDF$Type.of.feeding.interaction)[i])) # plot histogram including labels and title
  i <- i + 1
}
dev.off() # close the graphic window

feedingTypes <- as.list(levels(MyDF$Type.of.feeding.interaction)) # obtain a list of feeding types
Predator_Mean <- c() # initialize a new vector
Predator_Median <- c() # initialize a new vector
Prey_Mean <- c() # initialize a new vector
Prey_Median <- c() # initialize a new vector
SizeRatio_Mean <- c() # initialize a new vector
SizeRatio_Median <- c() # initialize a new vector
Feeding_Type <- c() # initialize a new vector

for (i in feedingTypes){
  TempDF <- subset(MyDF, Type.of.feeding.interaction == i) # extract the dataset by feeding type at each iteration
  Predator_Mean <- append(Predator_Mean, mean(log10(TempDF$Predator.mass))) # append Predator_Mean
  Predator_Median <- append(Predator_Median, median(log10(TempDF$Predator.mass))) # append Predator_Median
  Prey_Mean <- append(Prey_Mean, mean(log10(TempDF$Prey.mass))) # append Prey_Mean
  Prey_Median <- append(Prey_Median, median(log10(TempDF$Prey.mass))) # append Prey_Median
  SizeRatio_Mean <- append(SizeRatio_Mean, mean(log10(TempDF$Prey.mass / TempDF$Predator.mass))) # append SizeRatio_Mean
  SizeRatio_Median <- append(SizeRatio_Median, median(log10(TempDF$Prey.mass / TempDF$Predator.mass))) # append SizeRatio_Median
  Feeding_Type <- append(Feeding_Type, i) # append Feeding_Type
}

NewDF <- data.frame(Feeding_Type, Predator_Mean, Predator_Median, Prey_Mean, Prey_Median, SizeRatio_Mean, SizeRatio_Median) # create a new dataframe to store the calculations
write.csv(NewDF, "../results/PP_Results.csv") # save the csv file