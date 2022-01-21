M <- matrix(runif(1000000), 1000, 1000) # generate a matrix with 1000000 uniform random numbers

## define a function called SumAllElements to sum all elements of the matrix ##
SumAllElements <- function(M){
  Dimensions <- dim(M) # get the dimension of the matrix
  Tot <- 0 # Initialize Tot
  for (i in 1:Dimensions[1]){
    for (j in 1:Dimensions[2]){
      Tot <- Tot + M[i, j] # calculate the sum of all elements in the matrix
    }
  }
  return (Tot) # return the sum
}

## print out the time taken ##
print("Using loops, the time taken is:")
print(system.time(SumAllElements(M)))

print("Using the in-built vectorized function, the time taken is:") 
print(system.time(sum(M)))
      