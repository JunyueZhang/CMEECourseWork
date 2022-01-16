# Runs the stochastic Ricker equation with gaussian fluctuations

rm(list = ls())

stochrick <- function(p0 = runif(1000, .5, 1.5), r = 1.2, K = 1, sigma = 0.2,numyears = 100)
{

  N <- matrix(NA, numyears, length(p0))  #initialize empty matrix

  N[1, ] <- p0

  for (pop in 1:length(p0)) { #loop through the populations

    for (yr in 2:numyears){ #for each pop, loop through the years

      N[yr, pop] <- N[yr-1, pop] * exp(r * (1 - N[yr - 1, pop] / K) + rnorm(1, 0, sigma)) # add one fluctuation from normal distribution
    
     }
  
  }
 return(N)

}

# Now write another function called stochrickvect that vectorizes the above to
# the extent possible, with improved performance: 

# print("Vectorized Stochastic Ricker takes:")
# print(system.time(res2<-stochrickvect()))



stochrickvect <- function(p0 = runif(1000, .5, 1.5), r = 1.2, K = 1, sigma = 0.2, numyears = 100) # initialize some parameters
{
  
  N <- matrix(NA, numyears, length(p0))  # initialize an empty matrix
  
  N[1, ] <- p0 # assign p0 to the first row of N
  
  for (yr in 2:numyears){ # from the second row to the last row
      
      N[yr, ] <- N[yr-1, ] * exp(r * (1 - N[yr - 1, ] / K) + rnorm(length(p0), 0, sigma)) # each element in the same row is added one fluctuation from the normal distribution
  }
  return(N) # return the matrix N
}


print("Stochastic Ricker takes:")
print(system.time(res1 <- stochrick())) # print how much time the function stochrick takes


print("Vectorized Stochastic Ricker takes:")
print(system.time(res2 <- stochrickvect())) # print how much time the function stochrickvect takes
