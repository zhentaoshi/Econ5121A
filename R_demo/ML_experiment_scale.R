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


# Rescale data across variables and across training and test sets
d_train <- scale(d_train)
# Here we use means and standard deviations from training set to normalize test set
col_means_train <- attr(d_train, "scaled:center") 
col_stddevs_train <- attr(d_train, "scaled:scale")
d_test <- scale(d_test, center = col_means_train, scale = col_stddevs_train)

d_train = as.data.frame(d_train)
d_test  = as.data.frame(d_test)

# linear regression
reg = lm( ArrDelay ~ ., data = d_train )
print(reg)
# in Azure ML studio, the split is random. That's why the results are different

# prediction
yhat = predict(reg, newdata = d_test)
predDiff = d_test$ArrDelay - yhat
MSE = mean( predDiff^2, na.rm = TRUE )
cat("OLS out-of-sample prediction", MSE, "\n")

# these coefficients are from the Keras (in one instance)

# beta_keras = as.matrix( c(-0.00252398, 0.016227794, 0.9000024 ), ncol = 1 )
yhat = as.matrix( cbind(1, d_test[,2:3]) ) %*% beta_keras
predDiff = d_test$ArrDelay - yhat
MSE = mean( predDiff^2, na.rm = TRUE )
cat("Keras out-of-sample prediction", MSE, "\n")

# Indeed, Keras's out-of-sample prediction is better than OLS


yhat_in = as.matrix( cbind(1, d_train[,2:3]) ) %*% beta_keras
predDiff = d_train$ArrDelay - yhat_in
MSE = mean( predDiff^2, na.rm = TRUE )
cat("Keras in-sample prediction", MSE, "\n")
# this in-sample MSE is also consistent with Keras's report

yhat_in = predict(reg, newdata = d_train)
predDiff = d_train$ArrDelay - yhat_in
MSE = mean( predDiff^2, na.rm = TRUE )
cat("OLS in-sample prediction", MSE, "\n")

