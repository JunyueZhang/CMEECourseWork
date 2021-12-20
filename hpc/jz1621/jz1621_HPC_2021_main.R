# CMEE 2021 HPC excercises R code main pro forma
# you don't HAVE to use this but it will be very helpful.  If you opt to write everything yourself from scratch please ensure you use EXACTLY the same function and parameter names and beware that you may loose marks if it doesn't work properly because of not using the proforma.

name <- "Junyue Zhang"
preferred_name <- "Junyue"
email <- "jz1621@ic.ac.uk"
username <- "jz1621"

# please remember *not* to clear the workspace here, or anywhere in this file. If you do, it'll wipe out your username information that you entered just above, and when you use this file as a 'toolbox' as intended it'll also wipe away everything you're doing outside of the toolbox.  For example, it would wipe away any automarking code that may be running and that would be annoying!

# Question 1
species_richness <- function(community){
  return(length(unique(community))) # measure the species richness of the input community
}

# Question 2
init_community_max <- function(size){
  return(seq(1, size, 1)) # generate an initial state for the simulation community with the maximum possible number of species for the community size
}

# Question 3
init_community_min <- function(size){
  return(rep(1, size)) # generate an initial state for the simulation of a certain size with the minimum possible number of species
}

# Question 4
choose_two <- function(max_value){
  result <- sample(1:max_value, 2, replace = F) # choose two different random numbers
  return(result)
}

# Question 5
neutral_step <- function(community){
  index <- choose_two(length(community)) # call the function choose_two to get indexes of the community vector
  community[index[1]] <- community[index[2]] # pick an individual to die and another to reproduce and fill the gap left by the death
  return(community)
}

# Question 6
neutral_generation <- function(community){
  num <- length(community)
  if((num %% 2) == 0) { # if the community size is an even number 
    times <- num / 2  
  } else { # if the community size is an odd number
    times <- sample(c(ceiling(num/2), floor(num/2)), 1) # choose at random whether to round up or down to the nearest whole number
  }
  for (i in 1:times){
    community <- neutral_step(community) # simulate several neutral steps on a community so that a generation has passed
  }
  return(community) # give the state of the community after a generation has passed
}

# Question 7
neutral_time_series <- function(community, duration)  {
  series <- c(species_richness(community)) # start with the initial condition species richness
  for(i in 1:duration){
  community <- neutral_generation(community)
  series <- append(series, species_richness(community)) # get a vector giving the species richness at each generation of the simulation run starting with the initial condition species richness
  }
  return(series)
}

# Question 8
question_8 <- function() {
  graphics.off() # clear any existing graphs and plot your graph within the R window
  plot(0:200, neutral_time_series(init_community_max(100),200), type = "o", col = "blue", lwd = 2, xlab = "Generations", ylab = "Species Richness", main = "A time series graph of the neutral model simulation with an initial condition of maximal diversity in a size of 100 individuals", cex.main = 1.25, cex.lab = 1.5) # plot the figure
  return("The system will converge to a steady state without fluctuation and will be close to zero, because in the community filled with different species, there are new species arriving from speciation and species going extinct at the same time. And ideally, speciation will balance extinction, so the species richness will remain constant.")
}

# Question 9
neutral_step_speciation <- function(community, speciation_rate)  {
  if(runif(1, min = 0, max = 1) <= speciation_rate){ # within the probability speciation rate
    dead_index <- sample(1:length(community), 1) # choose the dead individual at random
    i <- 1
    while(i <= 1000000000){ # find a unique number not currently used by other species in the community to represent the new species 
      if (!(i %in% community)){ # if the number is not in the community
        new_species <- i # assign this number to the new species  
        break
      } else{
        i <- i + 1
      }
    }
    community[dead_index] <- new_species # speciation will replace the dead individual with a new species
  } else{
    ## otherwise the dead individual is replaced with the offspring of another individual as before in neutral_step ##
    index <- choose_two(length(community))
    community[index[1]] <- community[index[2]]
  }
  return(community)
}

# Question 10
neutral_generation_speciation <- function(community, speciation_rate)  {
  ## use a neutral simulation with speciation and perform in the same way as neutral_generation ##
  num <- length(community)
  if((num %% 2) == 0) {
    times <- num / 2
  } else {
    times <- sample(c(ceiling(num/2), floor(num/2)), 1)
  }
  for (i in 1:times){
    community <- neutral_step_speciation(community, speciation_rate)
  }
  return(community) # get the state of the community at the end of the generation long set of simulation steps
}

# Question 11
neutral_time_series_speciation <- function(community, speciation_rate, duration)  {
  ## use a neutral simulation with speciation and perform in the same way as neutral_time_series ##
  series <- c(species_richness(community))
  for(i in 1:duration){
    community <- neutral_generation_speciation(community, speciation_rate)
    series <- append(series, species_richness(community))
  }
  return(series) # get a time series vector in the same format as before
}

# Question 12
question_12 <- function()  {
  graphics.off() # clear any existing graphs and plot your graph within the R window
  x <- 0:200
  community_max <- init_community_max(100) # get an initial condition of maximal diversity in a system size of 100 individuals
  community_min <- init_community_min(100) # get an initial condition of minimal diversity in a system size of 100 individuals
  ymax <- neutral_time_series_speciation(community = community_max, speciation_rate = 0.1, duration = 200)
  # obtain a time series of species richness with speciation and the initial condition of maximal diversity
  ymin <- neutral_time_series_speciation(community = community_min, speciation_rate = 0.1, duration = 200)
  # obtain a time series of species richness with speciation and the initial condition of minimal diversity
  ## plot the figure ##
  plot(x, ymax, type = "l", col = "red", lwd = 2, ylim = c(0, 100),
       xlab = "Generations", ylab = "Species Richness", main = "Species richness against time performing neutral theory simulation with speciation for the initial conditions of maximal and minimal diversity", cex.lab = 1.25)
  lines(x, ymin, col = "blue", lwd = 2)
  colors <- c("red", "blue")
  legend(x = "topright", legend = c("Initial condition of maximal diversity", "Initial condition of minimal diversity"), col = colors, lwd = 4, bty = "n", cex = 1.25)
  return("The effect of initial conditions is significant at the beginning but becomes negligible afterward. The time series of species richness with the initial condition of maximal diversity drastically declines at first and then fluctuates within a narrow range, while the one with the initial condition of minimal diversity moderately increases at first and then fluctuates narrowly. And these two time series are close to each other except for the initial period. Since in the community filled with different species, there are new species coming from speciation and species going extinct at the same time. And ideally, speciation will balance extinction, leading to dynamic equilibrium. Because of the balance between speciation and extinction, the initial conditions have little effect on the dynamic equilibrium ultimately.")
}

# Question 13
species_abundance <- function(community)  {
  # return the abundances of all the species in the system from an input of the community vector
  return(sort(as.numeric(table(community)), decreasing = TRUE))
}

# Question 14
octaves <- function(abundance_vector) {
  # bin the abundances of species into the "octave classes"
  n <- floor(log2(abundance_vector)+1)
  # obtain how many species have an abundance greater than or equal to 2^(n-1) whilst strictly less than 2^n
  return(tabulate(n))
}


# Question 15
sum_vect <- function(x, y) {
  # return the sum of x and y after filling the shorter one with zeros to bring it up to the correct length
  length_x <- length(x) # get the length of x
  length_y <- length(y) # get the length of y
  if (length_x < length_y){ # if x is shorter
    x <- append(x, rep(0, (length_y-length_x))) # fill x with zeros to the length of y
  } else if  (length_x > length_y) { # if y is shorter
    y <- append(y, rep(0, (length_x-length_y))) # fill y with zeros to the length of x
  }
  return(x+y) # return the sum of x and y 
}

# Question 16 
question_16 <- function()  {
  graphics.off() # clear any existing graphs and plot your graph within the R window
  community_max <- init_community_max(100) # get an initial condition of maximal diversity in a system size of 100 individuals
  community_min <- init_community_min(100) # get an initial condition of minimal diversity in a system size of 100 individuals
  
  ## run a neutral model simulation for a "burn in" period of 200 generations for the initial conditions of maximal and minimal diversity ##
  for(i in 1:200){
    community_max <- neutral_generation_speciation(community_max, speciation_rate = 0.1)
    community_min <- neutral_generation_speciation(community_min, speciation_rate = 0.1)
  }
  
  ## record the initial species abundance octave vectors for the initial conditions of maximal and minimal diversity ##
  z <- 1
  sum_value_max <- octaves(species_abundance(community_max)) 
  sum_value_min <- octaves(species_abundance(community_min))
  
  ## repeatedly continue the simulation for a further 2000 generations ##
  for (j in 1:2000){
    community_max <- neutral_generation_speciation(community_max, speciation_rate = 0.1)
    community_min <- neutral_generation_speciation(community_min, speciation_rate = 0.1)
    if(j %% 20 == 0){
      ## record the species abundance octave vectors every 20 generations for the initial conditions of maximal and minimal diversity ##
      sum_value_max <- sum_vect(sum_value_max, octaves(species_abundance(community_max))) # use sum_vect to add the species abundance octave vectors for the initial condition of maximal diversity 
      sum_value_min <- sum_vect(sum_value_min, octaves(species_abundance(community_min))) # use sum_vect to add the species abundance octave vectors for the initial condition of minimal diversity 
      z <- z + 1
    }
  }
    
    ## calculate the mean species abundance distribution (as octaves) for the initial conditions of maximal and minimal diversity ##
    mean_value_max <- sum_value_max/z
    mean_value_min <- sum_value_min/z
    
    ## obtain the vector of names appearing under each bar in the bar graph ##
    x_names_n <- length(mean_value_max)
    x_names <- c(1)
    for (q in 2:x_names_n){
        x_names_min <- 2^(q-1)
        x_names_max <- 2^q-1
        x_names <- append(x_names, paste(x_names_min, x_names_max, sep = "-"))
      
    }
    
    mean_total <- rbind(mean_value_max, mean_value_min) # combine the mean species abundance octave vectors in order to plot the bar chart
    
    ## plot the bar chart of the mean species abundance distribution for the initial conditions of maximal and minimal diversity ##
    barplot(mean_total, col = c("deepskyblue", "goldenrod1") , ylim = c(0, 12), xlab = "Number of Individuals per Species", ylab = "Number of Species", main = "Mean species abundance distribution for the initial conditions of maximal and minimal diversity", beside = T, names.arg = x_names, cex.axis = 1.5, cex.names = 2, cex.lab = 1.5, cex.main = 1.5)
    legend("topright", c("Initial condition of maximal diversity", "Initial condition of minimal diversity"), fill = c("deepskyblue", "goldenrod1"), bty = "n", cex = 1.25)
    return("The initial condition of the system doesn't matter, since in the community filled with different species, there are new species coming from speciation and species going extinct at the same time. And ideally, speciation will balance extinction, leading to dynamic equilibrium. Because of the balance between speciation and extinction, the initial conditions have little effect on the mean species abundance distribution.")
}

# Question 17
cluster_run <- function(speciation_rate, size, wall_time, interval_rich, interval_oct, burn_in_generations, output_file_name){
  
  community <- init_community_min(size) # start with a community with size given by the input size and minimal diversity
  ## initialize some parameters ##
  i <- 0
  species_richness17 <- c(species_richness(community))
  octaves17 <- list()
  start_time <- proc.time() # record the start time
  
  ## apply neutral generations with a speciation rate for a predefined amount of time (wall_time) measured in minutes ##
  while((proc.time() - start_time)[3][[1]]/60 <= wall_time){  
    community <- neutral_generation_speciation(community = community, speciation_rate = speciation_rate) # run the neutral model simulation within wall_time 
    i <- i + 1
    if (i <= burn_in_generations){ # during the burn in generations
      if(i %% interval_rich == 0){  # store the species richness at intervals of interval_rich
        species_richness17 <- append(species_richness17, species_richness(community))
      }
    }
    
    # for the entire simulation until the simulation runs out of time
    if(i %% interval_oct == 0){ # record the species abundances as octaves every interval_oct generations
      octaves17[[i/interval_oct]] <- octaves(species_abundance(community))
    }}
  end_time <- proc.time() # record the end time
  total_time <- (end_time - start_time)[3][[1]]/60 # obtain the total amount of time actually consumed on the simulation
  results <- list(species_richness17, octaves17, community, total_time, speciation_rate, size, wall_time, interval_rich, interval_oct, burn_in_generations) # combine the data into a list
  names(results) <- c("time_series", "species_abundance_octaves", "community", "time", "speciation_rate", "size", "wall_time", "interval_rich", "interval_oct", "burn_in_generations")
  save(results, file = output_file_name) # save simulation results in a file with name given by the input output_file_name
}

# Questions 18 and 19 involve writing code elsewhere to run your simulations on the cluster

# Question 20 

process_cluster_results <- function()  {
  
  ## initialize some parameters ##
  sum_size500 <- 0
  n_size500 <- 0
  sum_size1000 <- 0
  n_size1000 <- 0
  sum_size2500 <- 0
  n_size2500 <- 0
  sum_size5000 <- 0
  n_size5000 <- 0
  
  for (i in 1:100){
    file_name <- paste("Output", i, ".rda", sep = "")
    load(file = file_name) # read in all output files
    n_start <- results$burn_in_generations/results$interval_oct + 1 # obtain the start of the post burn in period 
    n_end <- length(results$species_abundance_octaves) # obtain the end of the post burn in period
    post_burn_in <- results$species_abundance_octaves[n_start:n_end] # use data of the abundance octaves after the burn in time is up
    post_n <- length(post_burn_in) # get the length of the post burn in period
    
    if (i %% 4 == 1){ # if the community size is 500
      
      for (j1 in 1:post_n){
        sum_size500 <- sum_vect(sum_size500, post_burn_in[[j1]]) # use sum_vect to add the species abundance octave vectors
        n_size500 <- n_size500 + 1
      }
      
    } else if(i %% 4 == 2){ # if the community size is 1000
      
      for (j2 in 1:post_n){
        sum_size1000 <- sum_vect(sum_size1000, post_burn_in[[j2]]) # use sum_vect to add the species abundance octave vectors
        n_size1000 <- n_size1000 + 1
      }
      
    } else if(i %% 4 == 3){ # if the community size is 2500
      
      for (j3 in 1:post_n){
        sum_size2500 <- sum_vect(sum_size2500, post_burn_in[[j3]]) # use sum_vect to add the species abundance octave vectors
        n_size2500 <- n_size2500 + 1
      }
      
    } else if(i %% 4 == 0){ # if the community size is 5000
      
      for (j4 in 1:post_n){
        sum_size5000 <- sum_vect(sum_size5000, post_burn_in[[j4]]) # use sum_vect to add the species abundance octave vectors
        n_size5000 <- n_size5000 + 1
      }
      
    }
    
  }  
  
  ## calculate the mean species abundance distribution (as octaves) for each simulation size ##
  mean_size500 <- sum_size500/n_size500
  mean_size1000 <- sum_size1000/n_size1000
  mean_size2500 <- sum_size2500/n_size2500
  mean_size5000 <- sum_size5000/n_size5000
  
  
  combined_results <- list(mean_size500, mean_size1000, mean_size2500, mean_size5000) # create the list output here to return
  names(combined_results) <- c("mean_size500", "mean_size1000", "mean_size2500", "mean_size5000")
  save(combined_results, file = "combined_results.rda") # save results to an .rda file
  
}

plot_cluster_results <- function()  {
  graphics.off() # clear any existing graphs and plot your graph within the R window
  load(file = "combined_results.rda") # load combined_results from the rda file
  
  
  ## obtain the vector of names appearing under each bar in the bar graph ##
  get_x_names <- function(mean_size){
    n_x_names <- length(mean_size)
    x_names <- c(1)
    for (q in 2:n_x_names){
        x_names_min <- 2^(q-1)
        x_names_max <- 2^q-1
        x_names <- append(x_names, paste(x_names_min, x_names_max, sep = "-"))
    }
    return(x_names)
  }
  
  ## plot the four bar graphs for each simulation size ##
  par(mfrow=c(2,2))
  barplot(combined_results$mean_size500, col = "deepskyblue", ylim = c(0, 4), xlab = "Number of Individuals per Species", ylab = "Number of Species", main = "Mean Species Abundance Distribution with the initial condition of a community size of 500 and minimal diversity", names.arg = get_x_names(combined_results$mean_size500), cex.axis=2, cex.names = 1, cex.lab = 1.5, cex.main=1.25)
  legend("topright", "Initial condition of a community size of 500 and minimal diversity", fill = "deepskyblue", bty = "n")
  barplot(combined_results$mean_size1000, col = "chartreuse2", ylim = c(0, 8), xlab = "Number of Individuals per Species", ylab = "Number of Species", main = "Mean Species Abundance Distribution with the initial condition of a community size of 1000 and minimal diversity", names.arg = get_x_names(combined_results$mean_size1000), cex.axis=2, cex.names = 1, cex.lab = 1.5, cex.main=1.25)
  legend("topright", "Initial condition of a community size of 1000 and minimal diversity", fill = "chartreuse2", bty = "n")
  barplot(combined_results$mean_size2500, col = "darkgoldenrod1", ylim = c(0, 20), xlab = "Number of Individuals per Species", ylab = "Number of Species", main = "Mean Species Abundance Distribution with the initial condition of a community size of 2500 and minimal diversity", names.arg = get_x_names(combined_results$mean_size2500), cex.axis=2, cex.names = 1, cex.lab = 1.5, cex.main=1.25)
  legend("topright", "Initial condition of a community size of 2500 and minimal diversity", fill = "darkgoldenrod1", bty = "n")
  barplot(combined_results$mean_size5000, col = "darkorchid1", ylim = c(0, 40), xlab = "Number of Individuals per Species", ylab = "Number of Species", main = "Mean Species Abundance Distribution with the initial condition of a community size of 5000 and minimal diversity", names.arg = get_x_names(combined_results$mean_size5000), cex.axis=2, cex.names = 1, cex.lab = 1.5, cex.main=1.25)
  legend("topright", "Initial condition of a community size of 5000 and minimal diversity", fill = "darkorchid1", bty = "n")
  
  return(combined_results)
}


# Question 21
question_21 <- function()  {
  x <- log(8)/log(3)
  print(paste("The final answer is", x))
  return("In order to be three times as wide, we need eight times the amount of material. And the calculation shows that this has a dimension of 1.892789 derived as log(8) over log(3).")
}

# Question 22
question_22 <- function()  {
  x <- log(20)/log(3)
  print(paste("The final answer is", x))
  return("In order to be three times as wide, we need twenty times the amount of material. And the calculation shows that this has a dimension of 2.726833 derived as log(20) over log(3).")
}

# Question 23
chaos_game <- function()  {
  graphics.off() # clear any existing graphs and plot your graph within the R window
  # define the following three points as triangle vertices
  a_point <- c(0,0)
  b_point <- c(3,4)
  c_point <- c(4,1)
  point_series <- list(a_point, b_point, c_point)
  X_point <- c(0,0) # initialize the point vector X
  plot(X_point[1], X_point[2], cex = 1, col = "red", xlab = "X", ylab = "Y", xlim = c(0, 4), ylim = c(0, 4), main = "Creation of a Sierpinski triangle using a chaos game method", cex.lab = 1.5, cex.main = 1.5, pch = 4)
  
  for (i in 1:6000){
    
    choose_point <- sample(point_series, 1) # choose one of the three points at random
    # move X half way towards the point chosen
    X_point[1] <- (X_point[1] + (choose_point[[1]][1] - X_point[1])/2)
    X_point[2] <- (X_point[2] + (choose_point[[1]][2] - X_point[2])/2)
    points(X_point[1], X_point[2], cex = 0.5, col = "black") 
  }
  
  return("I can see a Sierpinski triangle, which is a classic example of fractals. In order to be twice as wide, we need three times the amount of material. So this has a dimension of 1.585 calculated as log(3) over log(2).")
}

# Question 24
turtle <- function(start_position, direction, length)  {
  # draw a line of a given length from a given point
    x0 <- start_position[1]
    y0 <- start_position[2]
    x1 <- x0 + length*cos(direction)
    y1 <- y0 + length*sin(direction)
    segments(x0 = x0, y0 = y0, x1 = x1, y1 = y1, col = "forestgreen", lwd = 1.5, lty = 1)
    # draw the line segment between the two points
    end_position <- c(x1, y1)
  return(end_position) # you should return your endpoint here.
}

# Question 25
elbow <- function(start_position, direction, length)  {
  # draw a pair of lines that join together with an angle of 45 degrees between them
  first_point <- turtle(start_position=start_position, direction=direction, length=length)
  turtle(start_position=first_point, direction=direction-pi/4, length=length*0.95)
}

# Question 26
spiral <- function(start_position, direction, length)  {
  # call turtle to draw the first line
  point <- turtle(start_position=start_position, direction=direction, length=length)
  if (length >= 0.001){ # spiral will only act if it’s called with a line length that’s above 0.001
    spiral(start_position=point, direction=direction-pi/4 , length=length*0.95)
    # call itself spiral to draw the second line
  }
  
  return("Calling the spiral function will show an error saying that C stack usage is too close to the limit. Because the spiral function will recursively call itself and continually draw a line with the angle of pi/4 radians to the right of the previous line from the previous ending point.")
}

# Question 27
draw_spiral <- function()  {
  graphics.off() # clear any existing graphs and plot your graph within the R window
  # open a new plot and draw a spiral
  plot(0, 0, xlim = c(-30, 90), ylim = c(-120, 10), xlab = "X", ylab = "Y", cex.lab = 1.5, main = "An example of spiral drawings", cex.main = 2)
  spiral(c(0,0), direction = 0, length = 50)
}

# Question 28
tree <- function(start_position, direction, length)  {
  point <- turtle(start_position=start_position, direction=direction, length=length)
  if (length >= 0.1){
    # call itself twice with directions that are 45 degrees to the right and 45 degrees to the left
    tree(start_position=point, direction=direction-pi/4 , length=length*0.65)
    tree(start_position=point, direction=direction+pi/4 , length=length*0.65)
  }
}

draw_tree <- function()  {
  graphics.off() # clear any existing graphs and plot your graph within the R window
  # draw a nice tree plot
  plot(0, 0, xlim = c(-35, 35), ylim = c(0, 55), xlab = "X", ylab = "Y", cex.lab = 1.5, main = "A nice tree plot", cex.main = 2)
  tree(c(0,0), direction = pi/2, length = 20)
}

# Question 29
fern <- function(start_position, direction, length)  {
  point <- turtle(start_position=start_position, direction=direction, length=length)
  if (length >= 0.1){
    # whilst one of the two branches goes 45 degrees to the left, the other goes straight on
    fern(start_position=point, direction=direction , length=length*0.87)
    fern(start_position=point, direction=direction+pi/4 , length=length*0.38)
  }
}

draw_fern <- function()  {
  graphics.off() # clear any existing graphs and plot your graph within the R window
  # draw a nice fern plot
  plot(0, 0, xlim = c(-50, 50), ylim = c(0, 170), xlab = "X", ylab = "Y", cex.lab = 1.5, main = "A nice fern plot", cex.main = 2)
  fern(c(0,0), direction = pi/2, length = 20)
}

# Question 30
fern2 <- function(start_position, direction, length, dir)  {
  point <- turtle(start_position=start_position, direction=direction, length=length)
  if (length >= 0.1){
      # allow the direction of the side branch to alternate by passing on the dir variable that has been multiplied by -1 to reverse the direction
      fern2(start_position=point, direction=direction , length=length*0.87, dir=-dir)
      fern2(start_position=point, direction=direction+pi/4*dir , length=length*0.38, dir=dir)
  }
}


draw_fern2 <- function()  {
  graphics.off() # clear any existing graphs and plot your graph within the R window
  # draw a nice fern plot
  plot(0, 0, xlim = c(-45, 45), ylim = c(0, 160), xlab = "X", ylab = "Y", cex.lab = 1.5, main = "A nice fern plot", cex.main = 2)
  fern2(c(0,0), direction = pi/2, length = 20, dir = 1)
}

# Challenge questions - these are optional, substantially harder, and a maximum of 16% is available for doing them.  

# Challenge question A
Challenge_A <- function() {
  graphics.off() # clear any existing graphs and plot your graph within the R window
  ## initialize some parameters ##
  sum_species_richness_max <- 0
  n_species_richness_max <- 0
  sum_species_richness_min <- 0
  n_species_richness_min <- 0

for (i in 1:100){
  community_max <- init_community_max(100) # get an initial condition of maximal diversity in a system size of 100 individuals
  community_min <- init_community_min(100) # get an initial condition of minimal diversity in a system size of 100 individuals
  series_max <- c(species_richness(community_max)) # initialize the time series of species richness with high initial diversity
  series_min <- c(species_richness(community_min)) # initialize the time series of species richness with low initial diversity
  for(j in 1:200){
    # run the neutral model simulation for 200 generations
    community_max <- neutral_generation_speciation(community_max, speciation_rate=0.1)
    community_min <- neutral_generation_speciation(community_min, speciation_rate=0.1)
    # append the time series of species richness
    series_max <- append(series_max, species_richness(community_max))
    series_min <- append(series_min, species_richness(community_min))
  }
  # use sum_vect to add up the time series
  sum_species_richness_max <- sum_vect(sum_species_richness_max, series_max) 
  n_species_richness_max <- n_species_richness_max + 1
  sum_species_richness_min <- sum_vect(sum_species_richness_min, series_min)
  n_species_richness_min <- n_species_richness_min + 1
  
}

# calculate the mean species richness
mean_species_richness_max <- sum_species_richness_max / n_species_richness_max
mean_species_richness_min <- sum_species_richness_min / n_species_richness_min


generations <- 0:200

## calculate the 97.2% confidence interval on the species richness at each point in time ##
std_max <- sd(mean_species_richness_max)
std_min <- sd(mean_species_richness_min)
n_max <- length(mean_species_richness_max)
n_min <- length(mean_species_richness_min)
error_max <- qnorm(0.986)*std_max/sqrt(n_max)
error_min <- qnorm(0.986)*std_min/sqrt(n_min)
lower_max <- mean_species_richness_max - error_max
lower_min <- mean_species_richness_min - error_min
upper_max <- mean_species_richness_max + error_max
upper_min <- mean_species_richness_min + error_min

## plot the mean species richness as a function of time across a large number of repeated simulations ##
plot(generations, mean_species_richness_max, type = "l", col = "red", lwd = 3, ylim = c(0, 100),
     xlab = "Generations", ylab = "Species Richness", main = "Mean species richness against time performing repeated neutral theory simulations with speciation for the initial conditions of maximal and minimal diversity", cex.lab = 1.5, cex.main = 1.5)
lines(generations, lower_max, col = "red", lty = "dashed", lwd = 2)
lines(generations, upper_max, col = "red", lty = "dashed", lwd = 2)
lines(generations, mean_species_richness_min, col = "blue", lwd = 3)
lines(generations, lower_min, col = "blue", lty = "dashed", lwd = 2)
lines(generations, upper_min, col = "blue", lty = "dashed", lwd = 2)
abline(v = 40, col = "black", lty = "dashed", lwd = 2)
text(x = 80, y = 80, labels = "The number of generations needed for the system 
     to reach dynamic equilibrium is about 40", cex = 1.5, col = "darkgreen")
legend("topright", c("Initial condition of maximal diversity", "Initial condition of minimal diversity"), fill = c("red", "blue"), bty = "n", cex = 1.25)        


}

# Challenge question B
Challenge_B <- function() {
  graphics.off() # clear any existing graphs and plot your graph within the R window
  
  # define a function to obtain the averaged time series of species richness
  averaged_time_series <- function(K){
    sum_species_richness <- 0
    n_species_richness <- 0
    for (i in 1:40){
      # In each initial community state, each individual is equally likely to take any species identity
      community <- replicate(n=100, sample(3^K, 1))
      series <- c(species_richness(community)) # initialize the time series of species richness
      for(j in 1:200){
        community <- neutral_generation_speciation(community, speciation_rate=0.1) # run the neutral model simulation for 200 generations
        series <- append(series, species_richness(community)) # append the time series of species richness
      }
      sum_species_richness <- sum_vect(sum_species_richness, series) # use sum_vect to add up the time series
      n_species_richness <- n_species_richness + 1
    }
    # calculate the mean species richness
    mean_species_richness <- sum_species_richness / n_species_richness
    return(mean_species_richness)
  }
  
  richness_results <- list()
  ## call the averaged_time_series function to calculate the mean species richness for eight different initial species richnesses ##
  for(i in 1:8){
    richness_results[[i]] <- averaged_time_series(i)
  }
  ## plot a graph showing averaged time series for eight different initial species richnesses ##
  generations <- 0:200
  plot(generations, richness_results[[1]], type = "l", col = "red", lwd = 3, ylim = c(0, 100),
       xlab = "Generations", ylab = "Species Richness", main = "Averaged time series for eight different initial species richnesses", cex.lab = 1.5, cex.main = 1.5)
  lines(generations, richness_results[[2]], col = "blue", lwd = 3)
  lines(generations, richness_results[[3]], col = "limegreen", lwd = 3)
  lines(generations, richness_results[[4]], col = "gold1", lwd = 3)
  lines(generations, richness_results[[5]], col = "black", lwd = 3)
  lines(generations, richness_results[[6]], col = "gray48", lwd = 3)
  lines(generations, richness_results[[7]], col = "darkorchid1", lwd = 3)
  lines(generations, richness_results[[8]], col = "orange", lwd = 3)
  legend("topright", c("initial species richnesses = 3", "initial species richnesses = 9", "initial species richnesses = 26", "initial species richnesses = 58", "initial species richnesses = 82", "initial species richnesses = 93", "initial species richnesses = 98", "initial species richnesses = 99"), fill = c("red", "blue", "limegreen", "gold1", "black", "gray48", "darkorchid1", "orange"), bty = "n")        

}

# Challenge question C
Challenge_C <- function() {
  graphics.off() # clear any existing graphs and plot your graph within the R window
  
    ## initialize some parameters ##
    sum_species_richness_500 <- 0
    n_species_richness_500 <- 0
    sum_species_richness_1000 <- 0
    n_species_richness_1000 <- 0
    sum_species_richness_2500 <- 0
    n_species_richness_2500 <- 0
    sum_species_richness_5000 <- 0
    n_species_richness_5000 <- 0
    
    for (i in 1:100){
      file_name <- paste("Output", i, ".rda", sep = "")
      load(file = file_name) # read in all output files
      
      if (i %% 4 == 1){ # if the community size is 500
        
          sum_species_richness_500 <- sum_vect(sum_species_richness_500, results$time_series) # use sum_vect to add up the time series 
          n_species_richness_500 <- n_species_richness_500 + 1
        
        
      } else if(i %% 4 == 2){ # if the community size is 1000
        
        sum_species_richness_1000 <- sum_vect(sum_species_richness_1000, results$time_series) # use sum_vect to add up the time series
        n_species_richness_1000 <- n_species_richness_1000 + 1
        
        
      } else if(i %% 4 == 3){ # if the community size is 2500
        
        sum_species_richness_2500 <- sum_vect(sum_species_richness_2500, results$time_series) # use sum_vect to add up the time series
        n_species_richness_2500 <- n_species_richness_2500 + 1
        
      } else if(i %% 4 == 0){ # if the community size is 5000
        
        sum_species_richness_5000 <- sum_vect(sum_species_richness_5000, results$time_series) # use sum_vect to add up the time series
        n_species_richness_5000 <- n_species_richness_5000 + 1
        
      }
      
    }  
    
    ## calculate the mean species richness for different values of size ##
    mean_species_richness_500 <- sum_species_richness_500/n_species_richness_500
    mean_species_richness_1000 <- sum_species_richness_1000/n_species_richness_1000
    mean_species_richness_2500 <- sum_species_richness_2500/n_species_richness_2500
    mean_species_richness_5000 <- sum_species_richness_5000/n_species_richness_5000
    
    
    ## plot a graph of mean species richness against simulation generations ##
    par(mfrow=c(2,2))
    plot(1:2000, mean_species_richness_500[1:2000], type = "l", col = "goldenrod1", xlab = "Simulation Generations", ylab = "Mean Species Richness", main = "Mean species richness against simulation generations with the initial condition of a community size of 500 and minimal diversity", cex.main = 1.25, cex.lab = 1.5)
    legend("bottomright", "Initial condition of a community size of 500 and minimal diversity", fill = "goldenrod1", bty = "n")
    plot(1:4000, mean_species_richness_1000[1:4000], type = "l", col = "tomato1", xlab = "Simulation Generations", ylab = "Mean Species Richness", main = "Mean species richness against simulation generations with the initial condition of a community size of 1000 and minimal diversity", cex.main = 1.25, cex.lab = 1.5)
    legend("bottomright", "Initial condition of a community size of 1000 and minimal diversity", fill = "tomato1", bty = "n")
    plot(1:8000, mean_species_richness_2500[1:8000], type = "l", col = "deepskyblue", xlab = "Simulation Generations", ylab = "Mean Species Richness", main = "Mean species richness against simulation generations with the initial condition of a community size of 2500 and minimal diversity", cex.main = 1.25, cex.lab = 1.5)
    legend("bottomright", "Initial condition of a community size of 2500 and minimal diversity", fill = "deepskyblue", bty = "n")
    plot(1:10000, mean_species_richness_5000[1:10000], type = "l", col = "seagreen3", xlab = "Simulation Generations", ylab = "Mean Species Richness", main = "Mean species richness against simulation generations with the initial condition of a community size of 5000 and minimal diversity", cex.main = 1.25, cex.lab = 1.5)
    legend("bottomright", "Initial condition of a community size of 5000 and minimal diversity", fill = "seagreen3", bty = "n")
    
    ## combine the mean species richness for different values of size into a list ##
    mean_species_richness_results <- list(mean_species_richness_500, mean_species_richness_1000, mean_species_richness_2500, mean_species_richness_5000)
    names(mean_species_richness_results) <- c("mean_species_richness_500", "mean_species_richness_1000", "mean_species_richness_2500", "mean_species_richness_5000")
    return(mean_species_richness_results)
  
}

coalescence <- function(J, v){
  lineages <- rep(1, J) # initialise a vector lineages of length J with 1 as every entry
  abundances <- c() # initialise an empty vector abundances
  N <- J # initialise a number N = J
  theta <- v*(J-1)/(1-v) 
  while(N > 1){
    two_index <- choose_two(length(lineages))
    j <- two_index[1] # choose an index j of the vector lineages at random according to a uniform distribution
    i <- two_index[2] # choose another index i of the vector lineages at random, but not allowing i = j
    randnum <- runif(1, min=0, max=1) # pick a random decimal number randnum between 0 and 1
    if (randnum < theta/(theta+N-1)){
      abundances <- append(abundances, lineages[j]) # append lineages[j] to the vector abundances
    } else {
      lineages[i] <- lineages[i] + lineages[j] 
    }
    lineages <- lineages[-j] # remove lineages[j] from lineages
    N <- N - 1
  }
  abundances <- append(abundances, lineages) # add the only element left in lineages to the end of abundances
  return(abundances)
}

# Challenge question D
Challenge_D <- function() {
  graphics.off() # clear any existing graphs and plot your graph within the R window
  v = 0.0069855
  
  ## initialize some parameters ##
  sum500 <- c()
  sum1000 <- c()
  sum2500 <- c()
  sum5000 <- c()
  
  for (i in 1:50){
    
    ## use sum_vect to add up the octaves for each simulation size ##
    sum500 <- sum_vect(sum500, octaves(coalescence(500, v)))
    sum1000 <- sum_vect(sum1000, octaves(coalescence(1000, v)))
    sum2500 <- sum_vect(sum2500, octaves(coalescence(2500, v)))
    sum5000 <- sum_vect(sum5000, octaves(coalescence(5000, v)))
  }
  
  ## calculate the mean value of each simulation size ##
  mean_500 <- sum500/50
  mean_1000 <- sum1000/50
  mean_2500 <- sum2500/50
  mean_5000 <- sum5000/50
  
  ## obtain the vector of names appearing under each bar in the bar graph ##
  get_x_names <- function(mean_size){
    n_x_names <- length(mean_size)
    x_names <- c(1)
    for (q in 2:n_x_names){
      x_names_min <- 2^(q-1)
      x_names_max <- 2^q-1
      x_names <- append(x_names, paste(x_names_min, x_names_max, sep = "-"))
    }
    return(x_names)
  }
  
  ## plot the figures ##
  load(file = "combined_results.rda")
  par(mfrow = c(4, 2))
  barplot(mean_500, col = "deepskyblue", ylim = c(0, 4), xlab = "Number of Individuals per Species", ylab = "Number of Species", main = "Mean Species Abundance Distribution with the initial condition of a community size of 500 and minimal diversity (coalescence)", names.arg = get_x_names(mean_500), cex.axis=2, cex.names = 1, cex.lab = 1.5, cex.main=1.25)
  legend("topright", "Initial condition of a community size of 500 and minimal diversity (coalescence)", fill = "deepskyblue", bty = "n")
  barplot(combined_results$mean_size500, col = "darkblue", ylim = c(0, 4), xlab = "Number of Individuals per Species", ylab = "Number of Species", main = "Mean Species Abundance Distribution with the initial condition of a community size of 500 and minimal diversity (cluster)", names.arg = get_x_names(combined_results$mean_size500), cex.axis=2, cex.names = 1, cex.lab = 1.5, cex.main=1.25)
  legend("topright", "Initial condition of a community size of 500 and minimal diversity (cluster)", fill = "darkblue", bty = "n")
  barplot(mean_1000, col = "red", ylim = c(0, 8), xlab = "Number of Individuals per Species", ylab = "Number of Species", main = "Mean Species Abundance Distribution with the initial condition of a community size of 1000 and minimal diversity (coalescence)", names.arg = get_x_names(mean_1000), cex.axis=2, cex.names = 1, cex.lab = 1.5, cex.main=1.25)
  legend("topright", "Initial condition of a community size of 1000 and minimal diversity (coalescence)", fill = "red", bty = "n")
  barplot(combined_results$mean_size1000, col = "pink", ylim = c(0, 8), xlab = "Number of Individuals per Species", ylab = "Number of Species", main = "Mean Species Abundance Distribution with the initial condition of a community size of 1000 and minimal diversity (cluster)", names.arg = get_x_names(combined_results$mean_size1000), cex.axis=2, cex.names = 1, cex.lab = 1.5, cex.main=1.25)
  legend("topright", "Initial condition of a community size of 1000 and minimal diversity (cluster)", fill = "pink", bty = "n")
  barplot(mean_2500, col = "gold", ylim = c(0, 20), xlab = "Number of Individuals per Species", ylab = "Number of Species", main = "Mean Species Abundance Distribution with the initial condition of a community size of 2500 and minimal diversity (coalescence)", names.arg = get_x_names(mean_2500), cex.axis=2, cex.names = 1, cex.lab = 1.5, cex.main=1.25)
  legend("topright", "Initial condition of a community size of 2500 and minimal diversity (coalescence)", fill = "gold", bty = "n")
  barplot(combined_results$mean_size2500, col = "orange", ylim = c(0, 20), xlab = "Number of Individuals per Species", ylab = "Number of Species", main = "Mean Species Abundance Distribution with the initial condition of a community size of 2500 and minimal diversity (cluster)", names.arg = get_x_names(combined_results$mean_size2500), cex.axis=2, cex.names = 1, cex.lab = 1.5, cex.main=1.25)
  legend("topright", "Initial condition of a community size of 2500 and minimal diversity (cluster)", fill = "orange", bty = "n")
  barplot(mean_5000, col = "olivedrab", ylim = c(0, 40), xlab = "Number of Individuals per Species", ylab = "Number of Species", main = "Mean Species Abundance Distribution with the initial condition of a community size of 5000 and minimal diversity (coalescence)", names.arg = get_x_names(mean_5000), cex.axis=2, cex.names = 1, cex.lab = 1.5, cex.main=1.25)
  legend("topright", "Initial condition of a community size of 5000 and minimal diversity (coalescence)", fill = "olivedrab", bty = "n")
  barplot(combined_results$mean_size5000, col = "green", ylim = c(0, 40), xlab = "Number of Individuals per Species", ylab = "Number of Species", main = "Mean Species Abundance Distribution with the initial condition of a community size of 5000 and minimal diversity (cluster)", names.arg = get_x_names(combined_results$mean_size5000), cex.axis=2, cex.names = 1, cex.lab = 1.5, cex.main=1.25)
  legend("topright", "Initial condition of a community size of 5000 and minimal diversity (cluster)", fill = "green", bty = "n")
  
  
  return("The coalescence simulation took less than a minute and the cluster one took 12 hours to do an equivalent set of simulations. Because cluster simulations take into account more factors while coalescence simulations lack the comprehensive factors to consider, and coalescence simulations are more random while cluster simulations are more general.")
}

# Challenge question E
Challenge_E <- function() {
  graphics.off() # clear any existing graphs and plot your graph within the R window
  # define the following three points as triangle vertices
  a_point <- c(0, 0)
  b_point <- c(6, 0)
  c_point <- c(3, 6*sin(pi/3))
  point_series <- list(a_point, b_point, c_point)
  X_point <- c(0, 0)
  plot(X_point[1], X_point[2], cex = 2, col = "red", xlab = "X", ylab = "Y", xlim = c(0, 7), ylim = c(0, 7), main = "Sierpinski Triangle", cex.lab = 1.25, cex.main = 1.5, pch = 4)
  
  for (i in 1:100){
    
    choose_point <- sample(point_series, 1) # choose one of the three points at random
    # move X half way towards the chosen point
    X_point[1] <- (X_point[1] + (choose_point[[1]][1] - X_point[1])/2)
    X_point[2] <- (X_point[2] + (choose_point[[1]][2] - X_point[2])/2)
    points(X_point[1], X_point[2], cex = 0.5, col = "black")
  }
  
  
  X_point <- c(3, 2)
  points(X_point[1], X_point[2], cex = 2, col = "red", pch = 6)
  for (i in 1:1000){
    
    choose_point <- sample(point_series, 1) # choose one of the three points at random
    # move X half way towards the chosen point
    X_point[1] <- (X_point[1] + (choose_point[[1]][1] - X_point[1])/2)
    X_point[2] <- (X_point[2] + (choose_point[[1]][2] - X_point[2])/2)
    points(X_point[1], X_point[2], cex = 0.5, col = "slateblue3")
  }
  
  X_point <- c(4, 6)
  points(X_point[1], X_point[2], cex = 2, col = "red", pch = 8)
  for (i in 1:2500){
    
    choose_point <- sample(point_series, 1) # choose one of the three points at random
    # move X half way towards the chosen point
    X_point[1] <- (X_point[1] + (choose_point[[1]][1] - X_point[1])/2)
    X_point[2] <- (X_point[2] + (choose_point[[1]][2] - X_point[2])/2)
    points(X_point[1], X_point[2], cex = 0.5, col = "palevioletred2")
  }
  
  X_point <- c(1, 4)
  points(X_point[1], X_point[2], cex = 2, col = "red", pch = 7)
  for (i in 1:5000){
    
    choose_point <- sample(point_series, 1) # choose one of the three points at random
    # move X half way towards the chosen point
    X_point[1] <- (X_point[1] + (choose_point[[1]][1] - X_point[1])/2)
    X_point[2] <- (X_point[2] + (choose_point[[1]][2] - X_point[2])/2)
    points(X_point[1], X_point[2], cex = 0.5, col = "yellow2")
  }
  
  return("The position of the initial point has little effect on the shape of the Sierpinski Gasket. Because the Sierpinski triangle is invariant to moving halfway to any vertex, which is the defining characteristic of the Sierpinski triangle.")
}


  ## define a function called turtle1 which can draw a pink line ##
  turtle1 <- function(start_position, direction, length)  {
    x0 <- start_position[1]
    y0 <- start_position[2]
    x1 <- x0 + length*cos(direction)
    y1 <- y0 + length*sin(direction)
    segments(x0 = x0, y0 = y0, x1 = x1, y1 = y1, col = "pink2", lwd = 2, lty = 1)
    end_position <- c(x1, y1)
    return(end_position) # you should return your endpoint here.
  }
  
  ## define a function called turtle2 which can draw a gold line ##
  turtle2 <- function(start_position, direction, length)  {
    x0 <- start_position[1]
    y0 <- start_position[2]
    x1 <- x0 + length*cos(direction)
    y1 <- y0 + length*sin(direction)
    segments(x0 = x0, y0 = y0, x1 = x1, y1 = y1, col = "goldenrod2", lwd = 0.5, lty = 1)
    end_position <- c(x1, y1)
    return(end_position) # you should return your endpoint here.
  }
  
  ## define a function called tree1 which can draw a pink cherry tree ##
  tree1 <- function(start_position, direction, length)  {
    point <- turtle1(start_position=start_position, direction=direction, length=length)
    if (length>=0.1){
      tree1(start_position=point, direction=direction+pi/6 , length=length*0.7)
      tree1(start_position=point, direction=direction-pi/6 , length=length*0.7)
    }
  }
  
  ## define a function called fern3 which can draw a gold maple tree ##
  fern3 <- function(start_position, direction, length, dir)  {
    point <- turtle2(start_position=start_position, direction=direction, length=length)
    if (length>=0.1){
      
      fern3(start_position=point, direction=direction , length=length*0.87, dir=-dir)
      fern3(start_position=point, direction=direction+pi/4*dir , length=length*0.38, dir=dir)
      fern3(start_position=point, direction=direction-pi/4*dir , length=length*0.38, dir=dir)
    }
  }
  
  
  # Challenge question F
  Challenge_F <- function() {
    graphics.off() # clear any existing graphs and plot your graph within the R window
  ## plot the multi-panel figure ##
    graphics.off() # clear any existing graphs and plot your graph within the R window
    par(mfrow=c(1,2))
    plot(0, 0, xlim = c(-40, 40), ylim = c(0, 70), xlab = "X", ylab = "Y", cex.lab = 1.25, main = "Pink cherry tree", cex.main = 2)
    tree1(c(0,0), direction = pi/2, length = 20)
    plot(0, 0, xlim = c(-50, 50), ylim = c(0, 170), xlab = "X", ylab = "Y", cex.lab = 1.25, main = "Gold maple tree", cex.main = 2)
    fern3(c(0,0), direction = pi/2, length = 20, dir=1)
  return("I notice that as the value of the line size threshold decreases, the time the program takes to run becomes longer and the image produced becomes denser and more precise.")
}

# Challenge question G should be written in a separate file that has no dependencies on any functions here.


