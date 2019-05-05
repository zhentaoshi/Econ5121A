# balanced panel 


N = 10; T = 3;


x = rnorm(N*T)

i_ind = rep(1:N, each = T)
t_ind = rep(1:T, N)


g = data.frame(i = i_ind, t = t_ind, x = x)
g$y = 2 * x + rnorm(N*T)

g$mean_x = tapply(g$x, g$i, mean) %>% rep( , each = T)


##########################
g1 <- pdata.frame( g, index = c("i", "t") )

g.fe <- plm( y ~ x , data=g1, effect = "individual", model="within") %>% print()
g.cre = lm(  y ~ x + mean_x , data=g1 ) %>% print()


g.fe.self = lm( y ~   I( x - mean_x ) , data=g1 ) %>% print()



########################################

# unbalanced panel 

N = 10; T1 = 3; T2 = 5;
total = (N/2)*( T1 + T2 )


x = rnorm(total)

i_ind = c( rep(1:(N/2), each = T1), rep(  (1+N/2):N, each = T2 ) )
t_ind = c( rep(1:T1, N/2), rep(1:T2, N/2) )


g = data.frame(i = i_ind, t = t_ind, x = x)
g$y = 2 * x + rnorm( total )

mean_x = tapply(g$x, g$i, mean) 
g$mean_x =  c( rep( mean_x[1:(N/2)] , each = T1), rep( mean_x[((N/2)+1): N], each = T2)  )


##########################
g1 <- pdata.frame( g, index = c("i", "t") )

g.fe <- plm( y ~ x , data=g1, effect = "individual", model="within") %>% print()
g.cre = lm(  y ~ x + mean_x , data=g1 ) %>% print()


g.fe.self = lm( y ~   I( x - mean_x ) , data=g1 ) %>% print()


