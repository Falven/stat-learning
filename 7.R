load("7.R.RData")
ls()
lm1 <- lm(y ~ x)
plot(lm1)
summary(lm1)
lm2 <- lm(y ~ 1 + x + poly(x, 2))
plot(lm2)
summary(lm2)
