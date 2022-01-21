for (i in 1:10){ # for i from 1 to 10
  if ((i %% 2) == 0) # check if the number is odd
      next # pass to next iteration of loop
  print(i) # print out i
}
