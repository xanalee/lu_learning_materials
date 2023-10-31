# Exercise 1
# Exercise 2
A = matrix(c(-2,5,3,1,-4,2), nrow=2, ncol=3, byrow=T)
B = matrix(c(-1,1,1,-1), nrow=2, ncol=2, byrow=T)
C = matrix(c(3,4,1,-4), nrow=2, ncol=2, byrow=T)
# 1
B+C
# 2
B-2*C
# 3
B%*%A
# 4
t(A)%*%C
# 5
solve(C)
# Exercise 3
# 1
sin(exp(5))
# 2
y1=function(x) (x+49)**0.5
y1(c(0,5,17))
# 3
round(y1(c(0,5,17)), 2)
# 4
y2=function(x) (x+7)**(1/3)
y2(c(0,1,4))
# 5
log(exp(7)+12.5**2)
# 6
log(exp(7)+12.5**2, base = 4)
# 7
y3=function(x) abs(x**2-4)
y3(c(0:3))
# 8
sum(log(c(6:20)**0.5, base = 3))
# 9
sum(log(c(6:20),base=3)/2)
# Exercise 4
# Install and load `remotes`
# install.packages('remotes')
library(remotes)
# install `brolgar`
# install_github("njtierney/brolgar")
library(brolgar)
data(heights)
heights = as.data.frame(heights)
data(wages)
wages = as.data.frame(wages)
# Exercise 5
# 1
head(heights, 10)
head(wages, 10)
# 2
tail(heights, 15)
tail(wages, 15)
# 3
ncol(heights)
ncol(wages)
names(heights)
names(wages)
v1 = names(heights)
v2 = names(wages)
# Exercise 6
# 1
nrow(heights)
# 2
heights[1245, 'country']
# 3
heights[heights$country == 'Portugal', ]
# 4
p_heights = heights[heights$country == 'Portugal', ]
nrow(p_heights)
unique(p_heights$year)
# 5
corr = cor(p_heights$year, p_heights$height_cm)
corr > 0
# Exercise 7
# 1
heights_1970 = heights[heights$year==1970, ]
heights_2000 = heights[heights$year==2000, ]
# 2
length(unique(heights_1970$country))
length(unique(heights_2000$country))
# 3
intersect(unique(heights_1970$country), unique(heights_2000$country))
# 4
mean_1970 = mean(heights_1970[heights_1970$country=='Vietnam', 'height_cm'])
mean_2000 = mean(heights_2000[heights_2000$country=='Vietnam', 'height_cm'])
mean_1970 < mean_2000
# Exercise 8
# 1
heights_am = heights[(heights$year==1980)&(heights$continent=='Americas'), ]
heights_as = heights[(heights$year==1980)&(heights$continent=='Asia'), ]
# 2
range(heights_am$height_cm)
range(heights_as$height_cm)
# 3
median(heights_am$height_cm)
median(heights_as$height_cm)
# 4
am_cou_mean = as.data.frame(tapply(heights_am$height_cm, heights_am$country, FUN = mean))
colnames(am_cou_mean) = c('height_cm')
am_cou_mean[am_cou_mean$height_cm==max(am_cou_mean$height_cm),, drop=F]
# Exercise 9
# 1
dim(wages)
# 2
wages$hourly_wage=exp(wages$ln_wages)
# 3
range(wages$hourly_wage)
# 4
mean(wages$hourly_wage)
median(wages$hourly_wage)
# 5
s_xp = wages[wages$xp <= 2, ]
m_xp = wages[(wages$xp > 2)&(wages$xp <= 5), ]
l_xp = wages[wages$xp > 5, ]
# 6
mean(s_xp$hourly_wage)
# 7
mean_wage_df = data.frame(
  xp=c("<=2", "2~5", ">5"),
  mean_hourly_wage=c(mean(s_xp$hourly_wage), mean(m_xp$hourly_wage), mean(l_xp$hourly_wage)))

