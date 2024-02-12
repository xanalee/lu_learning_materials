set.seed(50234)
# simulate survival time from an exponential distribution 
 survtime <- rexp(500, 0.2)
# simulate censored data from an exponential distribution 
 censtime <- rexp(500, 0.1)
# indicator variable
 status <- (survtime <= censtime)
# observed time 
 obstime <- survtime*status + censtime*(1 - status)
# estimate the mean for a sample with and without censored obervations 

# plot the survival function S(t) (Kaplan meier)
plot(survfit(Surv(obstime, status) ~ 1), conf.int = F, mark.time = F)
# true survival function
y <- seq(0, 30, by = 0.1)
truesurv <- exp(-0.2*y)
lines(y, truesurv, type = "l", col = "green")

# plot F(t)
plot(survfit(Surv(obstime, status) ~ 1), conf.int = F, mark.time = F, fun = "event")
lines(y, 1 - truesurv, type = "l", col = "red")
rm(survtime)
rm(censtime)
rm(status)

############################################################################
# simulate from a Weibull rweibull(n, shape, scale = 1)
lambda <- 2
alpha <- 2
survtime <- rweibull(500, lambda, alpha)
censtime <- rweibull(500, lambda, alpha)
status <- (survtime <= censtime)
obstime <- survtime*status + censtime*(1 - status)
# plot S(t)
plot(survfit(Surv(obstime, status) ~ 1), conf.int = F, mark.time = F)
# true survival function
y <- seq(0, 30, by = 0.1)
truesurv <- 1 - pweibull(y, lambda, alpha)
lines(y, truesurv, type = "l", col = "green")

