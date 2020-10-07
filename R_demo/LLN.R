sample.mean = function( n, distribution ){
  # get sample mean for a given distribution
  if (distribution == "normal"){ y = rnorm( n ) } 
  else if (distribution == "t2") {y = rt(n, 2) }
  else if (distribution == "cauchy") {y = rcauchy(n) }
  return( mean(y) )
}

LLN.plot = function(distribution){
  # draw the sample mean graph
  ybar = matrix(0, length(NN), 3 )
  for (rr in 1:3){
    for ( ii in 1:length(NN)){
      n = NN[ii]; ybar[ii, rr] = sample.mean(n, distribution)
    }  
  }
  matplot(ybar, type = "l", ylab = "mean", xlab = "", 
       lwd = 1, lty = 1, main = distribution)
  abline(h = 0, lty = 2)
  return(ybar)
}

# calculation
NN = 2^(1:20); set.seed(2020-10-7); par(mfrow = c(3,1))
l1 = LLN.plot("normal"); l2 = LLN.plot("t2"); l3 = LLN.plot("cauchy")