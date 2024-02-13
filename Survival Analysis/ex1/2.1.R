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
