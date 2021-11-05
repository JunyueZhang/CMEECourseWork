load("../data/GPDDFiltered.RData") # load GPDDFiltered.RData
require(maps) # load maps package

map(database ="world", col="grey", fill=TRUE, bg="white", lwd=0.5, mar=rep(0,4), border=0, ylim=c(-80,80)) # create a world map
for (i in 1:nrow(gpdd)) {
  points(gpdd$long[i], gpdd$lat[i], cex = 1.2, pch = 19, col = "red")
}
# superimpose on the map all the locations from which we have data in the GPDD dataframe




# As we can see from the map, most of the species are located in North America and Europe. The distribution of the species in North America is concentrated. The species are distributed mainly along the west coast, with the rest spreading across the continent. 
# And the distribution in Europe is dispersive. The species are scattered across the continent, with some concentrated in the west and UK. But in particular, there are two noticeable species separately located in Japan and South Africa.
# These two points are conspicuously far away from others, so the positions of these two species can be carefully checked again.
# Besides, the resolution of this figure is low, a lot of points are jammed together, so it's difficult to distinguish the distribution clearly.