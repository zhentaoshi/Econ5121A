# this script compare the R code implementation and 
# the Microsoft Azure ML Studio

# Zhentao Shi, Aug 20, 2018


# import data
# the original data has 2.72 million of rows.
# The data we use is 0.0001 of the sample

library(tidyr)
d0 = read.csv("flightDelay.csv", header = TRUE)

# select variable
d0 = d0[, c("ArrDelay", "CRSDepTime", "DepDelay") ] %>% drop_na()
# data splitting
n = nrow(d0)
n_train = 1:round(n/2)

d_train = d0[n_train, ]
d_test  = d0[-n_train, ]


# linear regression
reg = lm( ArrDelay ~ ., data = d_train )
print(reg)
# in Azure ML studio, the split is random. That's why the results are different

# prediction
# yhat = predict(reg, newdata = d_test)

# these coefficients are from the Keras (in one instance)

beta_keras = as.matrix( c(-0.00252398, 0.016227794, 0.9000024 ), ncol = 1 )
yhat = as.matrix( cbind(1, d_test[,2:3]) ) %*% beta_keras


# evaluate the out-of-sample prediction results
# print( cbind( d_test$ArrDelay , yhat ) )

predDiff = d_test$ArrDelay - yhat
MSE = mean( predDiff^2, na.rm = TRUE )
print(MSE)

