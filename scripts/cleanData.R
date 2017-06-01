
CleanData <- function(dataset){
  pop.data <- read.csv('../data/POP.csv', stringsAsFactors = FALSE)
  pop.data <- pop.data %>% select(X.2, X.3)
  pop.data <- pop.data[-c(1:4),]
  pop.data <- arrange(pop.data, X.2)
  pop.data <- pop.data[-c(1:94),]
  pop.data <- pop.data %>% select(X.3)
  colnames(pop.data) <- c('Population')
  df<- dataset[-1,]
  colnames(df) <- c('Country', 2015, 2010, 2005, 2000)
  df[df == 'No data'] <- 0
  df <-  genX(df, " [", "]")
  df <- gsub("<", "", df)
  df <- cbind(df, population = pop.data$Population)
  return(df)
}
