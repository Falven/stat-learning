load("5.R.RData")

ls()
summary(Xy)

fit <- lm(y ~ ., data = Xy)
summary(fit)

# There is very strong autocorrelation between
# consecutive rows of the data matrix.
# Roughly speaking, we have about 10-20 repeats of every data point,
# so the sample size is in effect much smaller than the number of rows
# (1000 in this case).
matplot(Xy, type = "l")

# Now, use the (standard) bootstrap to estimate . To within 10%, what do you get?
require(boot)

reg.fit <- function(data, indices) {
    d <- data[indices, ]
    fit <- lm(y ~ X1 + X2, data = d)
    return(coef(fit)[2])
}
results <- boot(data = Xy, statistic = reg.fit, R = 100)
se_bhat_1 <- sd(results$t)
se_bhat_1
