# this is a demonstration of the return of bitcoin
# regressed on stock market returns

# the conditional expectation approximated by B-spline

# required packages:
#   xts, magrittr, Quandl, quantmod, splines

library(magrittr)
library(splines)

# download raw data from Internet
d0 <- Quandl::Quandl('BCHARTS/BITSTAMPUSD', type = "xts") # download bitcoin data
## d1 <- Quandl::Quandl('BCIW/_INX', type = "xts") # premium service, need API

d1 <- quantmod::getSymbols("^GSPC", src = "yahoo", auto.assign = FALSE) # download S&P500 data
d2 <- quantmod::getSymbols("000001.SS", src = "yahoo", auto.assign = FALSE) # download Shanghai stock index

# save(d0, d1, d2, file = "bitcoin_stock.rda")


load(bitcoin_stock.rda)

BT = d0$Close; BT = BT[ BT > 0]
SP = d1$GSPC.Close
SH = d2[, "000001.SS.Close"]; SH = SH[ !is.na(SH)]; 

BTST = merge(BT, SP, SH, all=FALSE)
colnames(BTST) = c("BT", "SP", "SH")


ret = log(BTST) %>% diff( k = 1) # generate return data

matplot(ret, type = "l") # plot the return data


reg_lm <- lm( BT ~ SP+SH, data = ret) # a simple regression between BT and SP
summary(reg_lm)

reg_cef <- lm( BT ~ bs(SP) + bs(SH), data = ret) # b-spline
summary(reg_cef)

reg_sp <- lm( BT ~ bs(SP), data = ret) # b-spline
summary(reg_sp)
