a <- TRUE # define a
if (a == TRUE){ # check if a is TRUE
    print("a is TRUE")
    } else {
    print("a is FALSE")
    }            

z <- runif(1) # generate a uniformly distributed random number
if (z <= 0.5) {print ("Less than a half")} # if z is less than or equal to 0.5, print out

## indent the code for readability
z <- runif(1) # generate a uniformly distributed random number
if (z <= 0.5) { # if z is less than or equal to 0.5
  print("Less than a half")
}

## use for loop
for (i in 1:10){ # loop over 1 to 10
    j <- i * i # square each
    print(paste(i, "squared is", j)) # print the result
}

## loop over a vector of strings
for(species in c('Heliodoxa rubinoides', 'Boissonneaua jardini', 'Sula nebouxii')){
    print(paste('The species is', species))
}

## apply the for loop using a pre-existing vector
v1 <- c("a", "bc", "def") # define a vector
for (i in v1){ # for every item in the vector
  print(i)
}

i <- 0 # initialize i
while(i < 10){ # check if i is less than 10
    i <- i+1 # update i
    print(i^2) # print i squared
}



