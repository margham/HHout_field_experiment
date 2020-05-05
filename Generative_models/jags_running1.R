library(rjags)
load.module('dic')
library(mcmcplots)

data.object <- list(fake.data = fake.data, N = dim(fake.data)[1])

inits = list(
  list(mu = 0.5, phi = 10, prec = 5, weigh.error.org = 1, weigh.error.inorg = 1),
  list(mu = 0.8, phi = 30, prec = 100, weigh.error.org = 1, weigh.error.inorg = 1))

# Initialize JAGS model with jags.model function. Be sure to specify correct name of 
# JAGS model file.
jm1 <- jags.model("jags_model1.jags", data=data.object, inits=inits, n.chains = 2, n.adapt=1000)


jm_coda1 <- coda.samples(jm1, variable.names = c("deviance", "mu", "phi","prec", "weigh.error.org", "weigh.error.inorg"), n.iter=1000)

mcmcplot(jm_coda1)
