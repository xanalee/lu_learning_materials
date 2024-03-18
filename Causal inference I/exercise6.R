library(mice)

#----
# PART A-1
#----

n <- 1000
X <- seq_len(n)/n
Y <- 2+5*X+rnorm(n,0,1)
plot(X,Y)
dat <- data.frame(X,Y)
write.csv(dat,file="tmp.csv",row.names=FALSE)

#----
# PART A-2
#----

dat <- read.csv("tmp.csv")
#linear  regression
fit <- lm(Y~X,data=dat)
summary(fit)

#----
# PART A-3
#----

U <- runif(n)
# Make half on the Y values missing
dat$Y[U>0.5] <- NA
#linear  regression
fit <- lm(Y~X,data=dat)
summary(fit)
plot(dat$X,dat$Y)

#multiple imputation
imp1 <- mice(dat,method="norm", m=5)
# Inspect the multiple imputed information
imp1
# Explore imputed values
imp1$imp
# Perform linear regression on all imputed datasets
fitmi <- with(imp1, lm(Y ~ X))
summary(fitmi)
# pooled results
summary(pool(fitmi))

# make a combined dataframe
dat_imp <- complete(imp1, "long", inc = TRUE)
View(dat_imp)

#----
# PART A-4. Y missing if X>0.5
#----

dat <- read.csv("tmp.csv")
dat$Y[dat$X>0.5] <- NA

#linear  regression
fit <- lm(Y~X,data=dat)
summary(fit)
plot(dat$X,dat$Y)

#multiple imputation
imp2 <- mice(dat,method="norm", m=5)
# Inspect the multiple imputed information
imp2

# Perform linear regression on all imputed datasets
fitmi2 <- with(imp2, lm(Y ~ X))
# pooled results
summary(pool(fitmi2))

#----
# PART A-5.Y missing if Y>5
#----

dat <- read.csv("tmp.csv")
dat$Y[dat$Y>5] <- NA

#linear  regression
fit <- lm(Y~X,data=dat)
summary(fit)
plot(dat$X,dat$Y)

#multiple imputation
imp3 <- mice(dat,method="norm", m=5)
# Inspect the multiple imputed information
imp3

# Perform linear regression on all imputed datasets
fitmi3 <- with(imp3, lm(Y ~ X))
# pooled results
summary(pool(fitmi3))

#----
# PART A-6. Missingness of Y dependent on X and Z
#----

dat <- read.csv("tmp.csv")
dat$Z <- rnorm(n,0,1)
dat$Y <- with(dat, 2+5*X+Z +rnorm(n,0,1))

write.csv(dat,file="tmp2.csv",row.names=FALSE)

dat <- read.csv("tmp2.csv")
pairs(dat)
fit<- lm(Y~X,data=dat)
summary(fit)

dat$Y[dat$X>0.5 & dat$Z>0] <- NA

#linear  regression
fit <- lm(Y~X,data=dat)
summary(fit)
plot(dat$X,dat$Y)

#multiple imputation, using only X
dat2 <- dat[,c("X","Y")]
imp4 <- mice(dat2,method="norm", m=5)
fitmi4 <- with(imp4, lm(Y ~ X))
# pooled results
summary(pool(fitmi4))

#multiple imputation, using X and Z
imp5 <- mice(dat,method="norm", m=5)
fitmi5 <- with(imp5, lm(Y ~ X))
# pooled results
summary(pool(fitmi5))

#----
# PART A-7 Should the outcome be included in the imputation model for missing covariate values?
#----

dat <- read.csv("tmp.csv")
U <- runif(n)
dat$X[U>0.5] <- NA
fit <- lm(Y~X,data=dat)
summary(fit)

# without Y
setup <- mice(dat)
predMat <- setup$predictorMatrix
predMat["X","Y"] <- 0
imp6 <- mice(dat,method="norm",predictorMatrix=predMat)
imp6
fitmi6 <- with(imp6, lm(Y ~ X))
# pooled results
summary(pool(fitmi6))

# with Y
imp7 <- mice(dat,method="norm")
imp7
fitmi7 <- with(imp7, lm(Y ~ X))
# pooled results
summary(pool(fitmi7))

##############################################################

# PART B
# clear all memory
rm(list=ls())

#----
# PART B-1	Data import and exploration
#----

# import data
dat <- read.csv("necosad_death_miss.csv",stringsAsFactors=TRUE)

# explore data and missing data patterns
str(dat)
summary(dat)
md.pattern(dat)

#----
# PART B-2 Complete case analyses
#----

fit_uni <- glm(death=="yes" ~ therapy, family = binomial(link=logit), data = dat)
summary(fit_uni)
exp(fit_uni$coefficients)

fit_multi <- glm(death=="yes" ~therapy + sex + bmi + age + albumin + kidneydisease + smoking + gfr, family = binomial(link=logit), data = dat)
summary(fit_multi)
exp(fit_multi$coefficients)

#----
# PART B-3 multiple imputation using linear regression for gfr
#----

#initial settings mice (argument methods)
ini <- mice(dat, maxit = 0)
meth <- ini$meth
meth
meth["gfr"] <- "norm"
meth
imp1 <- mice(dat,method=meth, m=5)
# Inspect the multiple imputed information
imp1
# Explore imputed values
imp1$imp

# Perform logistic regression on all imputed datasets
fitmi <- with(imp1, glm(death=="yes" ~ therapy + sex + bmi + age + albumin + kidneydisease + smoking + gfr), family = binomial(link=logit))
summary(fitmi)
# pooled results
summary(pool(fitmi))
# exponentiate regression coefficients
res<-summary(pool(fitmi))
exp(res$estimate)

# histogram of original gfr
hist(dat$gfr)
# and of first imputed dataset
hist(complete(imp1,1)$gfr)

#----
# PART B-4 multiple imputation based on linear regression for log(gfr)
#----

# use log gfr instead of gfr for the imputations
dat$loggfr <- log(dat$gfr+1)
ini <- mice(dat, maxit = 0)
# define methods for imputation
meth["loggfr"] <- "norm"
meth["gfr"] <- "~I(exp(loggfr)-1)"
# and do not use gfr in the imputation models
predMat <- ini$predictorMatrix
predMat[,"gfr"] <- 0


imp2 <- mice(dat,method=meth,predictorMatrix = predMat, m=5)
# Inspect the multiple imputed information
imp2

# look again at imputed values
hist(complete(imp2,1)$gfr, breaks = 20)

# and again a logistic regression
fitmi2 <- with(imp2, glm(death=="yes" ~ therapy + sex + bmi + age + albumin + kidneydisease + smoking + gfr), family = binomial(link=logit))
summary(fitmi2)
summary(pool(fitmi2))
res2<-summary(pool(fitmi2))
exp(res2$estimate)

# earlier result
exp(res$estimate)

