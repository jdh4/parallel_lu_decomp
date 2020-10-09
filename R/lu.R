# install.packages("microbenchmark")
library(microbenchmark)
library(Matrix)

N <- 10000
microbenchmark(lu(matrix(rnorm(N*N), N, N)), times=5, unit="s")
