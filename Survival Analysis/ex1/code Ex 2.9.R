# Load library
library(splines)
library(survival)
library(gtools)
library(KMsurv)

#--------------------------------------------

# Code for Exercise 2.9 page 59 K&M
# (a)
# Treatment A
pnorm((log(12)-2.5)/2, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)
pnorm((log(24)-2.5)/2, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)
pnorm((log(60)-2.5)/2, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)

# Treatment B
pnorm((log(12)-2)/2, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)
pnorm((log(24)-2)/2, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)
pnorm((log(60)-2)/2, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)

# (b)
# Treatment A
plogis((log(12)-2.5)/2, location = 0, scale = 1, lower.tail = FALSE, log.p = FALSE)
plogis((log(24)-2.5)/2, location = 0, scale = 1, lower.tail = FALSE, log.p = FALSE)
plogis((log(60)-2.5)/2, location = 0, scale = 1, lower.tail = FALSE, log.p = FALSE)

# Treatment B
plogis((log(12)-2)/2, location = 0, scale = 1, lower.tail = FALSE, log.p = FALSE)
plogis((log(24)-2)/2, location = 0, scale = 1, lower.tail = FALSE, log.p = FALSE)
plogis((log(60)-2)/2, location = 0, scale = 1, lower.tail = FALSE, log.p = FALSE)

#--------------------------------------------

