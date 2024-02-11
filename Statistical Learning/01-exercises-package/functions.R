## function for exercise 1, see exercise document for description
make_ex_1 = function(beta = .1, n_train = 50) {
  n_reps = 100
  shrinkage = seq(0, 1, by = 0.1)
  mse = beta_hats = matrix(0, nrow = n_reps, ncol = length(shrinkage))
  colnames(mse) = colnames(beta_hats) = shrinkage
  set.seed(123)
  for (i in 1:n_reps) {
    ## generate training data
    x = runif(n_train, min = -3, max = 3)
    y = beta * x + rnorm(n_train)

    ## fit OLS and get parameter estimates
    fit = lm(y ~ 0 + x)
    b_ols = coef(fit)

    ## generate test data:
    xtest = runif(10000, min = -3, max = 3)
    ytest = beta * xtest + rnorm(1000)
    ## apply shrinkage and obtain predictions
    for (s in 1:length(shrinkage)) {
      ## generate predictions for test observations
      ypred = xtest * shrinkage[s] * b_ols
      mse[i, s] = mean((ytest - ypred)^2)
      beta_hats[i, s] = shrinkage[s] * b_ols
    }
  }
  par(mfrow = c(1, 2))
  min_id = which(colMeans(mse) == min(colMeans(mse)))
  ## Plot MSE versus shrinkage
  plot(
    x = shrinkage, y = colMeans(mse), type = "b",
    col = "red", xlab = "shrinkage", ylab = "test MSE",
    main = paste0(
      "beta = ", beta, "; N = ", n_train,
      ";\n optimal shrinkage factor: ",
      shrinkage[min_id]
    )
  )
  ## Plot distributions of beta estimates (add line for true value)
  boxplot(beta_hats, xlab = "shrinkage", ylab = "beta_hat", outline = FALSE)
  lines(c(1, 11), c(beta, beta), col = "red")
  ## Compute variance of the estimates
  bias_est = colMeans(mse)
  var_est = round(apply(beta_hats, 2, var), digits = 3)
  epe_est = bias_est + var_est
  return(list(optimal_s = shrinkage[min_id], bias = bias_est, var = var_est, epe = epe_est))
}
result1 = make_ex_1()
result2 = make_ex_1(n_train = 100)