# SCript to make interactive line plot

makeLineGraph <- function(aids.data, user.country) {
  country.data <- aids.data %>% filter(Country == user.country) 
  amount.of.people <- c(as.numeric(country.data[5]), as.numeric(country.data[4]),
                        as.numeric(country.data[3]), as.numeric(country.data[2]), 0, 0, 0)
  
  p <- plot_ly(country.data, x = ~colnames(country.data), y = ~amount.of.people, 
                                   type = 'scatter', mode = 'lines')

}

#source('../scripts/cleanData.R')
#new.data1 <- read.csv('../data/new_HIV.csv', stringsAsFactors = FALSE)
#new.data1 <- CleanData(new.data)
#new.data1 <- data.frame(new.data)
#makeLineGraph(new.data1, 'Bahamas')