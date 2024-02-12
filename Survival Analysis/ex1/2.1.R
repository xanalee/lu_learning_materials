
################### code exercises page 57 K&M #################################################################
#################################################################
# ex 2.1 page 57 exponential distribution
# plot density and hazard functions
.x <- seq(0.5, 7600.902, length.out=100)

plot(.x, dexp(.x, rate=0.001), xlab="x", ylab="Density", main="Exponential 
+   Distribution: rate = 0.001", type="l")
abline(h=0, col="gray")
abline(h=0.001, lty=2)

#plot survival
plot(.x, 1-pexp(.x, rate=0.001), xlab="x", ylab="Survival", 
  main="Exponential Distribution: rate = 0.001", type="l")
abline(h=0, col="gray")

remove(.x)

# compute the median for the exponential distribution
qexp(0.5, rate=0.001, lower.tail=TRUE)

#prob X>2000
pexp(2000, rate=0.001, lower.tail=FALSE)
##########################################################################
# ex 2.2 Weibull page 57. NB! other parametrization in R than in K&M
# look at the help ?Weibull and see definition for the density 
# X ~ Weibull(alpha=shape, lambda=scale)
scale <- 0.001^(-1/2) 
.x <- seq(0, 100, length.out=100)
# plot S(t)=1-F(t)
plot(.x, 1-pweibull(.x, shape=2, scale=scale), xlab="x", ylab="Survival", 
main="Weibull Distribution: shape = 2, scale = 0.001", 
  type="l")
abline(h=0, col="gray")

#############################################################################
# compute values for the survival S(t): S(30), S(45), S(60) 
pweibull(30,shape=2, scale=scale, lower.tail=FALSE) #S(30)
pweibull(45,shape=2, scale=scale, lower.tail=FALSE)
pweibull(60,shape=2, scale=scale, lower.tail=FALSE)

#plot the hazard
plot(.x, dweibull(.x, shape=2, scale=scale)/(1-pweibull(.x, shape=2, scale=scale)), xlab="x", ylab="Hazard", 
main="Weibull Distribution: shape = 2, scale = 0.001", 
  type="l")
  
#find the hazard rate h(x)=f(x)/S(x)
dweibull(30, shape=2, scale=scale)/(1-pweibull(30, shape=2, scale=scale))
#check with the formula for the hazard:
 2/scale*(30/scale)^1
dweibull(45, shape=2, scale=scale)/(1-pweibull(45, shape=2, scale=scale))
dweibull(60, shape=2, scale=scale)/(1-pweibull(60, shape=2, scale=scale))

#find the median
qweibull(c(0.5),shape=2, scale=scale, lower.tail=TRUE)
###########################################################################
#Exercise 2.6
Gomsurv <- function(theta,alpha,x)
{gom <- exp(theta/alpha*(1-exp(alpha*x)))
gom}
Gomsurv(0.01,0.25,12)
1-Gomsurv(0.01,0.25,6)

Ghere <- function(x) Gomsurv(0.01,0.25,x)
fhere <- function(x) {Ghere(x)-0.5}
#numerical approximation: use uniroot
uniroot(fhere, c(0,100))
#or analytically 
4*(log(1-0.25/0.01*log(0.5)))

###########################################################################
#Exercise 2.7
# look in the help at ?GammaDist
pgamma(18, shape=3, rate = 0.2, lower.tail = FALSE, log.p = FALSE)
pgamma(12, shape=3, rate = 0.2, lower.tail = TRUE, log.p = FALSE)
#mean=beta/lambda


 

