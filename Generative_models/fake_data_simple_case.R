rbeta2 <- function(N, mu, phi, ...) {
  rbeta(N, shape1 = mu * phi, shape2 = (1 - mu) * phi, ...)
}

total.carbon.mu <- 0.5 # grams of C
total.carbon.sigma <- 0.03
pi <- 0.9
pi.precision <- 100
sigma.weighing <- 0.01


mass <- rnorm(50, total.carbon.mu, total.carbon.sigma)
pis <- rbeta2(50, pi, pi.precision)

mass.organic <- mass * pis + rnorm(50, sd = sigma.weighing)
mass.inorganic <- mass * (1 - pis) + rnorm(50, sd = sigma.weighing)

hist(mass)
hist(mass.organic)
hist(mass.inorganic)

fake.data <- data.frame(Total = mass, Organic = mass.organic, Inorganic = mass.inorganic)


