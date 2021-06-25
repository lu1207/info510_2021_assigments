

Remove_non_numeric <- function(raw_data)
  {for (i in 1:length(names(raw_data))) 
    {while (class(raw_data[,i]) != "numeric") 
      {raw_data <- raw_data[,-i]
     break }
  }
  return(raw_data) 
}


Remove_non_numeric(iris)
