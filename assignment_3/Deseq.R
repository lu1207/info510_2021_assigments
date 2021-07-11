

args <- commandArgs(trailingOnly = TRUE)
input_file = args[1]
output_file = args[2]

counts <- read.table(input_file, header = T)
row.names(counts) <- counts$ensembl_ID
counts <- as.matrix(counts[,-c(1,ncol(counts))])
counts_nonzero <- counts[rowSums(counts) != 0,]

for (k in 1:nrow(counts_nonzero))
{
  r=counts_nonzero[k,1:ncol(counts_nonzero)]
  r_nonzero <- r[r !=0]
  size_F <- r/geometric.mean(r_nonzero)
  r_nonzero[k,] <-size_F
}

median1 <- c()
for (l in 1:ncol(r_nonzero))
{
  
  new <- median(r_nonzero[,l])
  new_nonzero <- new[new !=0]
  median1 <- c(median1, new_nonzero)
} 
  
  for (j in 2:length(counts))
  {
    des <- counts[,j]/median1[j]
    counts[, j] <- des
  }
  
  write.table(counts,output_file)
  cat("result saved to", output_file)