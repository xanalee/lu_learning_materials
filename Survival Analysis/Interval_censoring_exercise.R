load("icd.Rdata")
n = nrow(icd)

# First using existing software, the interval package
library(interval)
library(survival)
# This is what the Surv object looks like
Surv(icd$left, icd$right, type = "interval2")
# Estimating the survival curve
fit1 = icfit(Surv(left, right, type = "interval2") ~ 1, data=icd)
summary(fit1)
plot(fit1)

# Now we program the EM algorithm ourselves. Instead of first figuring out the Turnbull
# intervals ourselves, we simply take *all* intervals of consecutive time points, either
# left or right interval points. We will estimate probabilities for each of these
# intervals; outside the Turnbull intervals we expect the probability mass to tend to 0
tt = sort(unique(c(icd$left, icd$right)))
tt
nt = length(tt) - 1 # number of intervals
nt
# As starting values we assign probability mass 1/nt to each of the intervals
pt = rep(1/nt, nt)
# We will keep track of "expected" number of events for each subject in each interval
# in a matrix E (n x nt)
E = matrix(0, n, nt)
# Let's look at the first subject (have a look first for yourself); in which of the
# intervals will the event of that subject fall? We can code this also in an n x nt
# matrix I, where I[i, j] = 1 if the jth (tt[j-1], tt[j]) interval falls within (Li, Ri),
# and 0 otherwise
I = matrix(0, n, nt)
for (i in 1:n) {
  wh = which(icd$left[i]<=tt & icd$right[i]>tt)
  I[i, wh] = 1
}
tmp = cut(c(icd$left, icd$right), breaks=tt)
colnames(I) = levels(tmp)
I # check for yourself that this is correct
icd[1, ]

# First iteration, fill the events
iter = 1
cat("Iteration 1\n")
for (i in 1:n) {
  whi = which(I[i,]==1) # these are the subintervals over which the event should be distributed
  E[i, whi] = pt[whi] / sum(pt[whi])
}
E
ptprev = pt # this is to check how much subsequent estimates change
pt = apply(E, 2, mean)
pt # new estimates
pt - ptprev # difference wrt previous estimate
# Iterate until convergence
while (max(abs(pt-ptprev))>1e-6) {
  cat("Iteration", iter, "\n", sep=" ")
  iter = iter + 1
  for (i in 1:n) {
    whi = which(I[i,]==1) # these are the subintervals over which the event should be distributed
    E[i, whi] = pt[whi] / sum(pt[whi])
  }
  # E # do not print E anymore
  ptprev = pt
  pt = apply(E, 2, mean)
  print(pt) # new estimates
  # pt - ptprev # difference wrt previous estimate
}

whTurnbull = which(pt>0.0001)
names(pt) = levels(tmp)
pt[whTurnbull]
summary(fit1)
iter # number of iterations

# The algorithm has converged, but probably it is quicker when you only have to consider the
# Turnbull intervals. Let's cheat a bit and think that we have already figured those out
intTurnbull = levels(tmp)[whTurnbull]
intTurnbull # the Turnbull intervals
nTurnbull = length(whTurnbull) # number of Turnbull intervals

I = I[, whTurnbull]
E = matrix(0, n, nTurnbull)
colnames(I) = colnames(E) = intTurnbull
pt = rep(0.25, nTurnbull)
# First iteration, fill the events
iter = 1
cat("Iteration 1\n")
for (i in 1:n) {
  whi = which(I[i,]==1) # these are the subintervals over which the event should be distributed
  E[i, whi] = pt[whi] / sum(pt[whi])
}
E
ptprev = pt
pt = apply(E, 2, mean)
pt # new estimates
pt - ptprev # difference wrt previous estimate
# Iterate until convergence
while (max(abs(pt-ptprev))>1e-6) {
  cat("Iteration", iter, "\n", sep=" ")
  iter = iter + 1
  for (i in 1:n) {
    whi = which(I[i,]==1) # these are the subintervals over which the event should be distributed
    E[i, whi] = pt[whi] / sum(pt[whi])
  }
  # E # do not print E anymore
  ptprev = pt
  pt = apply(E, 2, mean)
  print(pt) # new estimates
  # pt - ptprev # difference wrt previous estimate
}
names(pt) = intTurnbull
pt
summary(fit1)
iter # number of iterations
# So it definitely pays off to first determine the Turnbull intervals!
