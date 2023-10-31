# Exercise 1
# Exercise 2
# 1
vc=function(v){
  result = v-mean(v)
  return(result)
}
# 2
vs=function(v){
  n = length(v)
  result = v/(var(v)*n/(n-1))**0.5
  return(result)
}
# 3
vn=function(v){
  n = length(v)
  result = (v-mean(v))/(var(v)*n/(n-1))**0.5
  return(result)
}
# Exercise 3
v = c(2, 4, 17, -8, -2, 3, 6:8, -5, -2)
# 1
v_bar=mean(v)
v_sigma=var(v)
# 2
v1 = vc(v)
mean(v1)
var(v1)
# 3
v2 = vs(v)
mean(v2)
var(v2)
# 4
v3 = vn(v)
mean(v3)
var(v3)
# Exercise 4
sum_sta=function(v){
  result_df=data.frame(quantity=c('minimum', 'first quartile', 'median', 'mean',
                                  'third quartile', 'maximum'))
  value_v=c(min(v), as.numeric(quantile(v, probs = 0.25)), median(v), mean(v), 
            as.numeric(quantile(v, probs = 0.75)), max(v))
  result_df$value=value_v
  return(result_df)
}
sum_sta(cars$speed)
sum_sta(cars$dist)
# Exercise 5
# 1
sk = function(v){
  v_bar = mean(v)
  result = mean((v - v_bar) ** 3)/(var(v)**(3/2))
  return(result)
}
# 2
set.seed(12)
vb1 = rbinom(1000, size=3, prob=0.1)
vb2 = rbinom(1000, size=3, prob=0.5)
vb3 = rbinom(1000, size=3, prob=0.8)
sk(vb1);sk(vb2);sk(vb3)
# Exercise 6
# 1
library(moments)
library(brolgar)
data(heights)
heights = as.data.frame(heights)
data(wages)
wages = as.data.frame(wages)
heights_1900 = heights[heights$year==1900, ]
heights_1950 = heights[heights$year==1950, ]
heights_2000 = heights[heights$year==2000, ]
skewness(heights_1900$height_cm);sk(heights_1900$height_cm)
skewness(heights_1950$height_cm);sk(heights_1950$height_cm)
skewness(heights_2000$height_cm);sk(heights_2000$height_cm)
# 2
wages$hourly_wage=exp(wages$ln_wages)
t1 = wages[wages$xp <= 1,]$hourly_wage
skewness(t1);sk(t1)
# right skewed
# Exercise 7
# 1
# 2
# 3
setwd('/Users/macbookpro/Desktop/learning materials/Statistical Computing with R')
population = read.csv('data/data.csv', skip=4)
metadata = read.csv('data/metadata_country.csv')
# 4
save(population, file = 'data/data.RData')
# 5
save(population, metadata, file = 'data/data_metadata_country.RData')
library(readxl)
# 7
population1 = read_excel('data/data.xls', sheet = 'Data', skip = 3)
metadata1 = read_excel('data/data.xls', sheet = 'Metadata - Countries')
# 8
c_population = population[population$Country.Name!='World', 'X2022']
population$Country.Name[which.max(c_population)]
population$Country.Name[which.min(c_population)]




