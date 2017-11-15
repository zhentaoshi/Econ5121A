# an example to develop an experiment for the test size of b_hat in OLS
# the code should be developed from scratch
# each step must be tested, and then wrap into a report


rm(list = ls( ) )


library(foreach)
library(doParallel)
library(plyr)

registerDoParallel(4)



# set the parameters
Rep = 50000
b0 = matrix(1, nrow = 2 )

# the workhorse functions

MonteCarlo = function(n, type , df = df){
  # a function gives the t-value under the null
  if (type == "Normal"){
    e = rnorm(n)
  } else if (type == "T"){
    e = rt(n, df )
  } else if (type == "Poisson"){
    e = rpois(n, df) - df
  } else if (type =="chisq"){
    e = rchisq(n, df) - df
  }
  
  X = cbind( 1, rnorm(n) )
  Y = X %*% b0 + e
  rm(e)
  
  bhat = solve( t(X) %*% X, t(X)%*% Y )
  bhat2 = bhat[2] # parameter we want to test
  
  e_hat = Y - X %*% bhat
  sigma_hat_square = sum(e_hat^2)/ (n-2)
  sig_B = solve( t(X) %*% X  ) * sigma_hat_square
  t_value_2 = ( bhat2 - b0[2]) / sqrt( sig_B[2,2] ) 
  
  return( list(bhat2 = bhat2, t_value_2 = t_value_2) )
}


NN = c(10, 20, 40, 80 )
# plot beta under the t-distributed error
BB = matrix(0, ncol = length(NN), nrow = Rep)
for (r in 1:length(NN)){
  n = NN[r]
  for (s in 1:Rep)   BB[s,r] = MonteCarlo(n, "T", df = 2)$bhat2
  # change the degree of freedom to see the change of the graph
}

# BB = laply(.data = rep(NN, each = Rep), .fun = MonteCarlo, type = "chisq", df = 2)
# BB = matrix(BB[,1], nrow = Rep)

colnames(BB) = NN


library(reshape2)
# BB = as.data.frame(BB)
# BB$ID = 1:Rep
BB_reshape = melt(BB, .measure.vars = as.characters(NN) )
colnames(BB_reshape)[2] = "sample_size"


library(ggplot2)
p1 = ggplot(BB_reshape) 
p1 = p1 + geom_area(stat = "density", 
                    aes(x = value),  position = "identity")
p1 = p1 + facet_grid( sample_size ~ ., scale = "free") 
p1 = p1 + geom_vline(xintercept = 1)
p1 = p1 + theme_bw()
p1 = p1 + theme(strip.text = element_text( size = 16), 
                axis.text = element_text( size = 16))
print(p1)




## testing: run the calculation of the empirical sizes for different sample sizes

# report the empirical test size
report = function(n){
  # collect the test size from the two distributions
  # this function contains some repeated code, but is OK for such a smply one
  TEST_SIZE = rep(0,4)
  
  Res = ldply( .data = 1:Rep, .fun = function(i) MonteCarlo(n, "Normal")$t_value_2  )
  TEST_SIZE[1] = mean( abs(Res) > qt(.975, n-2) )  
  TEST_SIZE[2] = mean( abs(Res) > qnorm(.975) ) 
  
  Res = ldply( .data = 1:Rep, .fun = function(i) MonteCarlo(n, "Poisson", df=1)$t_value_2  )
  TEST_SIZE[3] = mean( abs(Res) > qnorm(.975) )
  Res = ldply( .data = 1:Rep, .fun = function(i) MonteCarlo(n, "chisq", df=1)$t_value_2  )
  TEST_SIZE[4] = mean( abs(Res) > qnorm(.975) )
  
  return(TEST_SIZE)
}


pts = Sys.time()
RES = ldply(.data = NN, .fun = report, .progress = "text" )
cat("single tread", Sys.time() - pts, "\n")



names(RES) = c("exact", "normal.asym", "asym with Poisson", "asym with chisq")
RES$n = NN
RES = RES[, c(5,1:4)] # beautify the results
print(RES)


