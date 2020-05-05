library(brms)

prior1 <- prior(normal(0,0.01), nlpar = "sigma") + prior(beta(1,1), coef="pi")

brm(bf(Organic ~ (Total * pi) +sigma, pi + sigma ~ 1),  data = fake.data, prior=prior1)               

model1 <- brm(data= fake.data, family = gaussian,
    Organic ~ 1+ Total,
    prior =c(prior(exponential(1), class= sigma),
             prior(beta(1,1), class=b)), 
    iter = 2000,
    warmup = 1000, 
    chains = 2, 
    cores = 2, 
    seed = 7)

stancode(model1)
