rm(list=ls()) # remove global environment
# This function calculates heights of trees given distance of each tree 
# from its base and angle to its top, using  the trigonometric formula 
#
# height = distance * tan(radians)
#
# ARGUMENTS
# degrees:   The angle of elevation of tree
# distance:  The distance from base of tree (e.g., meters)
#
# OUTPUT
# The heights of the tree, same units as "distance"

TreeData <- read.csv("../data/trees.csv") # load the trees.csv file

TreeHeight <- function(degrees, distance){
  radians <- degrees * pi / 180 # convert degrees to radians
  height <- distance * tan(radians) # calculate the tree height using the trigonometric formula
  print(paste("Tree height is:", height)) # print tree height
  
  return (height) # return tree height
}

height <- c() # initialize a new vector
TreeLength <- length(TreeData$Species) # obtain the number of species

for (i in 1:TreeLength){
  z <- TreeHeight(TreeData$Angle.degrees[i], TreeData$Distance.m[i]) # call the function TreeHeight and input the corresponding degrees and distances 
  height <- append(height, z) # append the tree height
}

TreeData$Tree.Height.m <- height # add a new column to the original data frame
write.csv(TreeData, "../results/TreeHts.csv") # create a csv output file