# some examples of functions with conditionals
# Checks if an integer is even
is.even <- function(n = 2){
  if (n %% 2 == 0)
  {
    return(paste(n, 'is even!'))
  } else {
    return(paste(n, 'is odd!'))
  }
}
# call function is.even
is.even(6)
is.even(7)

# Checks if a number is a power of 2
is.power2 <- function(n = 2){
  if (log2(n) %% 1 == 0)
  {
    return(paste(n, 'is a power of 2!'))
  } else {
    return(paste(n, 'is not a power of 2!'))
  }
}
# call function is.power2
is.power2(4)
is.power2(32)
is.power2(43)

# Checks if a number is prime
is.prime <- function(n){
  if (n == 0){
    return(paste(n,'is a zero!'))
  }
  if (n == 1){
    return(paste(n, 'is just a unit!'))
  }
  ints <- 2:(n-1)
  if (all(n%%ints!=0)){
    return(paste(n, 'is a prime!'))
  } else {
    return(paste(n, 'is a composite!'))
  }
}

# call function is.prime
is.prime(3)
is.prime(7)
is.prime(0)
is.prime(1)
is.prime(44)
is.prime(35)