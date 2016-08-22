library(timeDate) # load a package

SS = read.csv("http://ichart.finance.yahoo.com/table.csv?s=000001.SS") 
# download data of Shanghai stock index

sc = rev(SS$Close) # revert the time series

T = dim(SS)[1] # compute the length of the time series

return = log( sc[2:T] ) - log( sc[1:(T-1)] ) # compute the log return

k = kurtosis(return)
print(k)
