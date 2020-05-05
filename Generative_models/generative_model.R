library(DirichletReg)

rbeta2 <- function(N, mu, phi, ...) {
rbeta(N, shape1 = mu * phi, shape2 = (1 - mu) * phi, ...)
}

dbeta2 <- function(X, mu, phi, ...) {
dbeta(X, shape1 = mu * phi, shape2 = (1 - mu) * phi, ...)
}


## TRUE VALUES
fractions <- rdirichlet(120, 100*(c(0.1,0.2,0.15,0.55))) # parameter
DR_fractions<-DR_data(fractions)
plot(DR_fractions)

total.mass <- 10 # data
prop.mass.inorganic <- rbeta2(4, mu = 0.05, phi = 40) # parameter
c.percent.org <- rbeta2(4, mu = 0.45, phi = 500)  # estimated can be constrained

curve(dbeta2(x, 0.35, 200))
mass.fractions <- fractions * total.mass # observed

organic.mass.fractions <- (1-prop.mass.inorganic) * mass.fractions #inferred


mass.fractions.observed <- mass.fractions + rnorm(4, 0, sd = 0.1) # bad scale, bad CN machine


