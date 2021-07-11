
args <- commandArgs(trailingOnly = TRUE)
input_file = args[1]
output_file = args[2]
print(args)
before_uqn <- read.delim(input_file)
before_uqn <- before_uqn[-c(length(before_uqn))]
  for (i in 2:length(before_uqn)) 
  {
    c <- before_uqn[,i]
    c_nonzero <- c[c !=0]
    uqn <- quantile(c_nonzero, .75)
    n_c <- c/uqn*1000
    before_uqn[,i] <- n_c
  }
  write.table(before_uqn,output_file)
cat("result saved to", output_file)
