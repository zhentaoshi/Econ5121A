library(AER)

# ex 8.3
invest = read.table(
  "http://www.ssc.wisc.edu/~bhansen/econometrics/invest.dat")

colnames(invest) = c("I","Q","C","D")

#linear regression of I on Q, C, D and constant

reg1 = lm(I ~ Q+C+D, data = invest)
summary(reg1)
vcov(reg1)

#robust
sigma = vcovHC(reg1, type = "HC"); sigma

test = coeftest(reg1); test
rtest = coeftest(reg1, vcov = sigma); rtest

#calculate the confidence interval
CI = confint(reg1, level = 0.95); CI

#Hypothesis test of "Q">0, "C" = 0, "D" = 0

#Test the joint hypothesis that the coefficients 
#on C and D are zero 
test1=lht(reg1, c("C = 0", "D = 0")); test1

#Test the hypothesis that the coefficient on Q is zero
test2=lht(reg1, "Q = 0"); test2

#add quadratic and intersection

reg2 = glm(I ~ Q + C + D + I(Q^2)+ I(C^2) + I(D^2) + 
             Q*C + Q*D + C*D, data = invest)
summary(reg2)

#test the joint hypothesis that the six interaction and 
#quadratic coefficients are zero
test3 = lht(reg2, c("I(Q^2) = 0", "I(C^2) = 0", "I(D^2) = 0",
                    "Q:C = 0", "Q:D = 0", "C:D = 0" ))
test3



load("~/Desktop/CUHK/ECON 5121A/nerlov.Rda")

library(AER)
library(lrmest)

# ex 8.4

#(a) ols

ols = lm(log(y) ~ log(x1) + log(x2) + log(x3) +log(x4), data = nerlov)
summary(ols)

#(c) cls

r = 0
R = matrix(c(0, 0, 1, 1, 1), 1, 5)
delt = 1
cls = rls(log(y) ~ 1 + log(x1) + log(x2) + log(x3) +log(x4), 
          data = nerlov, r = r, R = R, delt = delt)
cls

#(e) wald test

wald1 = lht(ols, "log(x2) + log(x3) +log(x4) = 1", test = "Chisq");wald1

wald2 = lht(ols, hypothesis.matrix = R, rhs = 1, test = "Chisq"); wald2

