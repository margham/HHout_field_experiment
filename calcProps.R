calcProp <- function(mat){
  output <- matrix(NA, nrow = nrow(mat), ncol = ncol(mat)+1)
  for(i in 1:ncol(mat)){
    output[,i] <- exp(mat[,i])/(rowSums(exp(mat)+1))
  }
  output[,ncol(mat)+1] <- 1 - rowSums(output[,1:ncol(mat)])
  return(output)
}
