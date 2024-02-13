library(splines)
library(survival)
library(gtools)
library(KMsurv)

pnorm((log(60)-2.5)/2, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)

# Treatment B
pnorm((log(60)-2)/2, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)

# (b)
# Treatment A
plogis((log(60)-2.5)/2, location = 0, scale = 1, lower.tail = FALSE, log.p = FALSE)

# Treatment B
plogis((log(60)-2)/2, location = 0, scale = 1, lower.tail = FALSE, log.p = FALSE)
