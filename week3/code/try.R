# define function doit
doit <- function(x){
  temp_x <- sample(x, replace = TRUE) # Random Samples and Permutations
  if(length(unique(temp_x)) > 30) {#only take mean if sample was sufficient
    print(paste("Mean of this sample was:", as.character(mean(temp_x))))
  } 
  else {
    stop("Couldn't calculate mean: too few unique values!")
  }
}

set.seed(1345) # again, to get the same result for illustration

popn <- rnorm(50) # generate 50 random numbers using a normal distribution

hist(popn) # generate a histogram

#lapply(1:15, function(i) doit(popn))

## use lapply and try to repeat the sampling exercise 15 times
result <- lapply(1:15, function(i) try(doit(popn), FALSE))
class(result) # The errors are stored in the object result
print(result) # have a look at it

## store the results manually by using a loop to do the same
result <- vector("list", 15) # Preallocate/Initialize
for(i in 1:15) {
  result[[i]] <- try(doit(popn), FALSE) # use try to catch errors
}
print(result) # have a look at the new result