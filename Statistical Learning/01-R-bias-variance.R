library(ggplot2)
library(papaja)
library(tidyverse)
set.seed(123)
n_train = 50
true_f = sin
x_gen = function(n_train) {
  runif(n_train, min = -3, max = 5)
}
x = x_gen(n_train)
y = true_f(x) + rnorm(n_train) * 0.8

lm_simple = lm(y ~ x)
lm_middle = lm(y ~ sin(x))
lm_complex = lm(y ~ poly(x, 18))
y_simple = predict(lm_simple)
y_middle = predict(lm_middle)
y_complex = predict(lm_complex)


df = data.frame(x = x, obs = y, zsimple = y_simple, zmiddle = y_middle, zcomplex = y_complex, true = true_f(x)
) %>% pivot_longer(!x, names_to = "method", values_to = "y")

print(dplyr::filter(df, method == "zcomplex" | method == "obs" | method == "true") %>% ggplot(aes(x = x, y = y, color = method)) +
  geom_line(size = 1.5) +
  theme_apa() +
  ggtitle("Training"))
print(dplyr::filter(df, method == "zsimple" | method == "obs" | method == "true") %>% ggplot(aes(x = x, y = y, color = method)) +
  geom_line(size = 1.5) +
  theme_apa() +
  ggtitle("Training"))
print(dplyr::filter(df, method == "zmiddle" | method == "obs" | method == "true") %>% ggplot(aes(x = x, y = y, color = method)) +
  geom_line(size = 1.5) +
  theme_apa() +
  ggtitle("Training"))

n_test = 1000
x_test = x_gen(n_test)
y_test = true_f(x_test) + 0.8 * rnorm(n_train)
test_set = data.frame(x = x_test)
y_simple = predict(lm_simple, test_set)
y_middle = predict(lm_middle, test_set)
y_complex = predict(lm_complex, test_set)
print(paste0("MSE Simple: ", mean((y_simple - y_test)^2)))
print(paste0("MSE Middle: ", mean((y_middle - y_test)^2)))
print(paste0("MSE Complex: ", mean((y_complex - y_test)^2)))

# df = data.frame(x = x_test, obs = y_test, .simple = y_simple, .middle = y_middle, .complex = y_complex, true = true_f(x_test)) %>% pivot_longer(!x, names_to = "method", values_to = "y")
# 
# print(dplyr::filter(df, method == ".complex" | method == "obs" | method == "true") %>% ggplot(aes(x = x, y = y, color = method)) +
#   geom_line(size = 1.5) +
#   theme_apa() +
#   ggtitle("Test"))
# print(dplyr::filter(df, method == ".simple" | method == "obs" | method == "true") %>% ggplot(aes(x = x, y = y, color = method)) +
#   geom_line(size = 1.5) +
#   theme_apa() +
#   ggtitle("Test"))
# print(dplyr::filter(df, method == ".middle" | method == "obs" | method == "true") %>% ggplot(aes(x = x, y = y, color = method)) +
#   geom_line(size = 1.5) +
#   theme_apa() +
#   ggtitle("Test"))
