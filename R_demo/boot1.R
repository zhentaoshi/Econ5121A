# bootstrap bias correction
# Zhentao Shi
# 11/11/2015, in celebration of the Double-11 Day

funny.estimator = function(x){
  y = mean(x)/11
  # y = 10 * var(x)
}



n = 2000 # sample size
B = 1000 # number of bootstrap replications

x = rnorm(n, 11, 1)

X.star = matrix(0, B, n)
MU.hat = rep(0,B)

for (b in 1:B){
  x.star = sample(x, n, replace = T)
  X.star[b,] = x.star
  MU.hat[b] = funny.estimator(x.star)
}

boot.bias = mean(MU.hat) - mean(x)

corrected = funny.estimator(x) - boot.bias
print(c( funny.estimator(x),  corrected))
