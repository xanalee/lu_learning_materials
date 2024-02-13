#Exercise 2.6
Gomsurv = function(theta,alpha,x) {
  gom = exp(theta/alpha*(1-exp(alpha*x)))
  gom
}
Gomsurv(0.01,0.25,12)
1-Gomsurv(0.01,0.25,6)

Ghere = function(x) Gomsurv(0.01,0.25,x)
fhere = function(x) {Ghere(x)-0.5}
#numerical approximation: use uniroot
uniroot(fhere, c(0,100))
#or analytically
4*(log(1-0.25/0.01*log(0.5)))