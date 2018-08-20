# this script compare the R code implementation and 
# the Microsoft Azure ML Studio

# Zhentao Shi, Aug 20, 2018


# import data
d0 = read.csv("flightDelay.csv", header = TRUE)

# select variable
d0 = d0[, c("ArrDelay", "ArrDel15") ]

# data splitting
n = nrow(d0)
n_train = 1:round(n/2)

d_train = d0[n_train, ]
d_test  = d0[-n_train, ]


# linear regression
reg = lm( ArrDelay ~ ArrDel15, data = d_train )
# in Azure ML studio, the split is random. That's why the results are different

# prediction
yhat = predict(reg, newdata = d_test)

# evaluate the out-of-sample prediction results
print( cbind( d_test$ArrDelay , yhat ) )

predDiff = d_test$ArrDelay - yhat
MSE = mean( predDiff^2, na.rm = TRUE )
print(MSE)
