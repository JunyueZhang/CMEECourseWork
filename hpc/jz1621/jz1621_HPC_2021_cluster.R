# CMEE 2021 HPC excercises R code HPC run code pro forma

rm(list=ls()) # clear workspace
graphics.off() # turn off graphics
source("jz1621_HPC_2021_main.R") 
iter <- as.numeric(Sys.getenv("PBS_ARRAY_INDEX")) # read in the job number from the cluster

set.seed(iter) # set the random number seed as iter

## select the community size in each parallel simulation based on the value of iter ##
if (iter %% 4 == 1){
  size <- 500
} else if(iter %% 4 == 2){
  size <- 1000
} else if(iter %% 4 == 3){
  size <- 2500
} else if(iter %% 4 == 0){
  size <- 5000
}

file_name <- paste("Output", iter, ".rda", sep = "") # create a filename to store results
# call the cluster_run function
cluster_run(speciation_rate = 0.0069855, size, wall_time = 12*60, interval_rich = 1, interval_oct = size/10, burn_in_generations = 8*size, output_file_name = file_name)
  




