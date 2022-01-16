## Build a random matrix
M <- matrix(rnorm(100), 10, 10)

## Take the mean of each row
RowMeans <- apply(M, 1, mean)
print(RowMeans)

## Take the variance of each row
RowVars <- apply(M, 1, var)
print(RowVars)

## Take the mean of each column
ColMeans <- apply(M, 2, mean)
print(ColMeans)
