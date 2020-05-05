 

data{ 
  int <lower = 1> N; //sample size
  vector[N] x; //predictor
  vector[N] y; //outcome
}

parameters{
 real alpha; //intercept
 real beta;  //slope
 real <lower=0> sigma; //error SD
}

model {
  y~normal(x*beta + alpha, sigma);
}

generated quantities { 
  real y_rep[N];
  
  for (n in 1:N){
  y_rep[n] = normal_rng(x[n] * beta + alpha, sigma);
  }
  
}
