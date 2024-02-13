#Exercise 2.7
# look in the help at ?GammaDist
beta = 3
lambda = 0.2
pgamma(18, shape=beta, rate = lambda, lower.tail = FALSE, log.p = FALSE)
pgamma(12, shape=beta, rate = lambda, lower.tail = TRUE, log.p = FALSE)
mean_x = beta/lambda