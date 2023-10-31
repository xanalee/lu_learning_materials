# Exercise 1
# 1
12%/%5; 12%%5
# 2
823%/%17; 823%%17
# 3
475832%/%1342; 475832%%1342;

# Exercise 2
# 1
37*42+17/3
# 2
17/3-2*(15/6+1)
# 3
{3*(3/4)**2-5}/2+7

# Exercise 3
# Interbank
(1+0.015)**5
# PiggyBank
(1+0.013)**3*(1+0.02)**2
# choose PiggyBank

# Exercise 4
# 1
seq(1,8,1)
# 2
seq(5,17,3)
# 3
seq(4.5,10.5,2)

# Exercise 5
# 1
rep(14:15, 3)
# 2
rep(c(2,3,1,4), c(3,2,5,2))
# 3
a = c('male', 'female')
c(rep(a, c(3, 1)), rep(a, c(2, 5)), rep(a, c(1, 2)))

# Exercise 6
v1 = c(exp(3), 2*pi)
v2 = c('Antonio', v1)
v3 = factor(c('green', 'green', 'red'))
v4 = c('green', 'green', 'red')
class = function(x) {
  print('is.numeric:')
  print(is.numeric(x))
  print('is.character:')
  print(is.character(x))
  print('is.factor:')
  print(is.factor(x))
}
class(v1);class(v2);class(v3);class(v4)

# Exercise 7
# 1
sum(1:100)
# 2
sum(3:98)
# 3
sum((5:10)**2)
# 4
prod(1/(7:14))

