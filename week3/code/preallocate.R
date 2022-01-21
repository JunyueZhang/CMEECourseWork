NoPreallocFun <- function(x){
  a <- vector() # empty vector
  for (i in 1:x){
    a <- c(a, i) # concatenate
    print(a)
    print(object.size(a)) # provide an estimate of the memory that is being used to store an R object
  }
}

system.time(NoPreallocFun(10)) # return CPU Time Used



PreallocFun <- function(x){
  a <- rep(NA, x) # pre-allocated vector
  for (i in 1:x){
    a[i] <- i # assign
    print(a)
    print(object.size(a)) # provide an estimate of the memory that is being used to store an R object
  }
}

system.time(PreallocFun(10)) # return CPU Time Used