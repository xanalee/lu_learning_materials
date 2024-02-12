library(survival)

# simulate survival time from an exponential distribution 
fu_time <- c(rep(1, 30), rep(2, 28), rep(3, 31), rep(4, 12), rep(5, 4), 
             rep(6, 13), rep(7, 8), rep(8, 9), rep(9, 3), rep(10, 8))
status <- c(rep(1, 27), rep(0, 3), rep(1, 18), rep(0, 10), rep(1, 21), 
            rep(0, 10), rep(1, 9), rep(0, 3), rep(1, 1), rep(0, 3),
            rep(1, 2), rep(0, 11), rep(1, 3), rep(0, 5), rep(1, 1), rep(0, 8),
            rep(1, 2), rep(0, 1), rep(1, 2), rep(0, 6))

# plot the survival function S(t) (Kaplan meier)
km <- survfit(Surv(fu_time, status) ~ 1)
plot(km, conf.int = F, mark.time = F)

# the probabilities at each time-point are:
data.frame(year = km$time, survival_prob = km$surv)
