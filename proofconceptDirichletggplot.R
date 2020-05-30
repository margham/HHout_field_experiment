# simplied data to test the required data structure and ggplot code for the Dirichlet proportions ~ lnration graphs
# reproduce (possible structure) in simplified form

# d1 corresponds to the observations (the points)
library(ggplot2)
d1 <- expand.grid(proportion = c("sc","sa","pom"), ln = c(5,10,15), depth = factor(c(1,2)))
d1$value <- c(rep(c(1,2,3),3),rep(c(4,5,6),3))
d1

# d2 corresponds to the quantiles defining the limits of the confidence regions along the predictor range
d2 <- expand.grid(proportion = c("sc","sa","pom"), ln_othername = seq(4,16,length.out = 15), depth = factor(c(1,2)))
d2$upper <- c(rep(c(1,2,3),15)+0.2,rep(c(4,5,6),15)+0.2)
d2$lower <- c(rep(c(1,2,3),15)-0.2,rep(c(4,5,6),15)-0.2)


#plotting
ggplot(data = d1, aes(x = ln, y = value, colour = proportion)) + geom_point() +
  facet_grid(.~ depth) +
  geom_ribbon(data = d2, aes(x = ln_othername, y = upper, ymin=lower, ymax = upper, fill = proportion), stat="identity", alpha = 0.2, linetype = 0)

