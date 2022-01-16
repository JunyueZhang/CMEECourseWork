library(rgdal)
library(raster)
library(sf)
library(sp)
library(dismo)

vignette('sdm')

tapir_IUCN <- st_read('data/iucn_mountain_tapir/data_0.shp')
print(tapir_IUCN)

# Load the data frame
tapir_GBIF <- read.delim('data/gbif_mountain_tapir.csv', 
                         stringsAsFactors=FALSE)
# Drop rows with missing coordinates
tapir_GBIF <- subset(tapir_GBIF, ! is.na(decimalLatitude) | ! is.na(decimalLongitude))
# Convert to an sf object 
tapir_GBIF <- st_as_sf(tapir_GBIF, coords=c('decimalLongitude', 'decimalLatitude'))
st_crs(tapir_GBIF) <- 4326
print(tapir_GBIF)
# Load some (coarse) country background data
ne110 <- st_read('data/ne_110m_admin_0_countries/ne_110m_admin_0_countries.shp')

# Create a modelling extent for plotting and cropping the global data.
model_extent <- extent(c(-85,-70,-5,12))

# Plot the species data over a basemap
plot(st_geometry(ne110), xlim=model_extent[1:2], ylim=model_extent[3:4], 
     bg='lightblue', col='ivory')
plot(st_geometry(tapir_IUCN), add=TRUE, col='grey', border=NA)
plot(st_geometry(tapir_GBIF), add=TRUE, col='red', pch=4, cex=0.6)
box()

# Load the data
bioclim_hist <- getData('worldclim', var='bio', res=10, path='data')
bioclim_2050 <- getData('CMIP5', var='bio', res=10, rcp=60, model='HD', year=50, path='data')

# Relabel the future variables to match the historical ones
names(bioclim_2050) <- names(bioclim_hist)

# Look at the data structure
print(bioclim_hist)

par(mfrow=c(3,1), mar=c(1,1,1,1))
# Create a shared colour scheme
breaks <- seq(-300, 350, by=20)
cols <- hcl.colors(length(breaks) - 1)
# Plot the historical and projected data
plot(bioclim_hist[[1]], breaks=breaks, col=cols)
plot(bioclim_2050[[1]], breaks=breaks, col=cols)
# Plot the temperature difference
plot(bioclim_2050[[1]] - bioclim_hist[[1]], col=hcl.colors(20, palette='Inferno'))
# Reduce the global maps down to the species' range
bioclim_hist_local <- crop(bioclim_hist, model_extent)
bioclim_2050_local <- crop(bioclim_2050, model_extent)

# Create a simple land mask
land <- bioclim_hist_local[[1]] >= 0
# How many points to create? We'll use the same as number of observations
n_pseudo <- nrow(tapir_GBIF)
# Sample the points
pseudo_dismo <- randomPoints(mask=land, n=n_pseudo, p=st_coordinates(tapir_GBIF))
# Convert this data into an sf object, for consistency with the
# next example.
pseudo_dismo <- st_as_sf(data.frame(pseudo_dismo), coords=c('x','y'), crs=4326)

# Create buffers around the observed points
nearby <- st_buffer(tapir_GBIF, dist=1)
too_close <- st_buffer(tapir_GBIF, dist=0.2)
# merge those buffers
nearby <- st_union(nearby)
too_close <- st_union(too_close)
# Find the area that is nearby but _not_ too close
nearby <- st_difference(nearby, too_close)
# Get some points within that feature in an sf dataframe
pseudo_nearby <- st_as_sf(st_sample(nearby, n_pseudo))

# Create buffers around the observed points
nearby <- st_buffer(tapir_GBIF, dist=1)
too_close <- st_buffer(tapir_GBIF, dist=0.2)
# merge those buffers
nearby <- st_union(nearby)
too_close <- st_union(too_close)
# Find the area that is nearby but _not_ too close
nearby <- st_difference(nearby, too_close)
# Get some points within that feature in an sf dataframe
pseudo_nearby <- st_as_sf(st_sample(nearby, n_pseudo))

# Create buffers around the observed points
nearby <- st_buffer(tapir_GBIF, dist=1)
too_close <- st_buffer(tapir_GBIF, dist=0.2)
# merge those buffers
nearby <- st_union(nearby)
too_close <- st_union(too_close)
# Find the area that is nearby but _not_ too close
nearby <- st_difference(nearby, too_close)
# Get some points within that feature in an sf dataframe
pseudo_nearby <- st_as_sf(st_sample(nearby, n_pseudo))

par(mfrow=c(1,2), mar=c(1,1,1,1))
# Random points on land
plot(land, col='grey', legend=FALSE)
plot(st_geometry(tapir_GBIF), add=TRUE, col='red')
plot(pseudo_dismo, add=TRUE)
# Random points within ~ 100 km but not closer than ~ 20 km
plot(land, col='grey', legend=FALSE)
plot(st_geometry(tapir_GBIF), add=TRUE, col='red')
plot(pseudo_nearby, add=TRUE)

