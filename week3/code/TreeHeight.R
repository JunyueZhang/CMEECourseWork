
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

TreeData <- read.csv("../data/trees.csv")

TreeHeight <- function(degrees, distance){
  radians <- degrees * pi / 180
  height <- distance * tan(radians)
  print(paste("Tree height is:", height))
  
  return (height)
}

height <- c()
#TreeHeight(37, 40)
TreeLength <- length(TreeData$Species)

for (i in 1:TreeLength){
  z <- TreeHeight(TreeData$Angle.degrees[i], TreeData$Distance.m[i])
  height <- append(height, z)
}

TreeData$Tree.Height.m <- height 
write.csv(TreeData, "../results/TreeHts.csv")