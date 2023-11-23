### Statistical Computing with R ###
#### Additional script for L11 #####

# negative log-lik needed in the M step:
neg.logl = function(theta, pi1, w1, x) {
  mu1 = theta[1]
  mu2 = theta[2]
  # density of the mixture model:
  f.x1 = pi1 * dnorm(x, mu1, sd = 1)
  f.x2 = (1-pi1) * dnorm(x, mu2, sd = 1)
  # negative log-likelihood:
  - sum(w1 * log(f.x1) + (1 - w1) * log(f.x2))
}

# EM algorithm function
EM_function = function(x, n.iter) {
  # 1. preallocate objects
  n = length(x)
  pi1hat = rep(NA, n.iter)
  p1hat = matrix(NA, n.iter, n)
  muhat = matrix(NA, n.iter, 2)
  # 2: initialize the algorithm
  range_pi1start = c(runif(1, 0.2, 0.45), runif(1, 0.55, 0.8))
  pi1hat[1] = mean(range_pi1start)
  p1hat[1, ] = runif(n, range_pi1start[1], range_pi1start)
  # 3. first M step:
  muhat[1, ] = optim(c(2, 3), function(theta) 
    neg.logl(theta, pi1hat[1], p1hat[1,], x))$par
  # 4. run the EM:
  for (t in 2:n.iter) {
    # E step: update individual probability memberships
    p.temp = cbind(
      p1hat[t-1,] * dnorm(x, muhat[t-1, 1], sigma),
      (1 - p1hat[t-1,]) * dnorm(x, muhat[t-1, 2], sigma) )
    p1hat[t, ] = p.temp[ , 1]/rowSums(p.temp)
    # M step: update parameter estimates
    pi1hat[t] = mean(p1hat[t, ])
    muhat[t, ] = optim(muhat[t-1, ], function(theta)
      neg.logl(theta, pi1hat[t], p1hat[t,], x))$par
  }
  # 5: compute the loglikelihood at the end of the algorithm
  muhat = muhat[n.iter, ]
  pi1hat = pi1hat[n.iter]
  p1hat = p1hat[n.iter, ]
  loglikFinal = - neg.logl(theta = muhat, pi1 = pi1hat, 
                           w1 = p1hat, x)
  # 6: define the exports
  out = list('muhat' = muhat,
             'pi1hat' = pi1hat,
             'p1hat' = p1hat,
             'logl' = loglikFinal)
  return(out)
}
