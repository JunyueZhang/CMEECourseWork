SomeOperation <- function(v){ # function SomeOperation takes as input v
  if (sum(v) > 0){ # if the sum of v is greater than zero
    return (v * 100) # multiply all the values in v by 100 and return them
  }  
  return (v)
}

M <- matrix(rnorm(100), 10, 10) # build a random matrix
print(apply(M, 1, SomeOperation)) # take the function SomeOperation by row
