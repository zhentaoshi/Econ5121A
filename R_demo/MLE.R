set.seed(2020-10-7)

mu0 <- 2
gamma0 <- 1

# population likelihood function
L <- function(mu) {
  ell = -0.5 * log(2*pi*gamma0) - 0.5 *(1 + (mu - mu0)^2 / gamma0 ) 
  return(ell) }

# sample likelihood function 
Ln <- function(mu) {
  elln = -0.5 * log(2*pi*gamma0) - 0.5 * mean( (z - mu)^2 )/gamma0  
  return(elln) }

mu_base = mu0 + seq(-3, 3, by = 0.01)

# draw population log-likelihood graph


# draw sample log-likelihood graph
n = 4
lnz = matrix(0, length(mu_base), 3)
for (rr in 1:3){
  z <- rnorm(n, mu0, sqrt(gamma0) )
  lnz[,rr] <- plyr::laply(.data = mu_base, .fun = Ln)
}

matplot(x = mu_base, y = cbind( L(mu_base), lnz), 
        type = "l", lty = c(1, rep(2,3)), 
        lwd =  c(2,rep(1,3)), col = 1:4, ylim = c(-6, -1), 
        xlab = "mu", ylab = "log-likelihood")
abline(v = mu0, lty = 3)