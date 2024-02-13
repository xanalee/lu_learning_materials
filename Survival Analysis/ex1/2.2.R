scale = 0.001**(-1/2)
S = function(x){
  pweibull(x, shape = 2, scale = scale, lower=F)
}
S(c(30,45,60))
#approximation of the mean
mean(rweibull(10000000, shape = 2, scale = scale))
#close to the fomular
sqrt(1000)*gamma(1+1/2)
#the same as 
0.5*sqrt(1000)*sqrt(pi)
#hazard rate
h = function(x){
  0.001*2*(x**(2-1))
}
h(c(30,45,60))
#median
qweibull(0.5, shape = 2, scale = scale)
