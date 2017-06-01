# SCript to make interactive line plot
makeLineGraph <- function(aids.data, user.country) {
  country.data <- aids.data <- filter(Country == user.country) 
  data.2000 <- country.data <- 
  p <- plot_ly(data, x = ~x, y = ~random_y, type = 'scatter', mode = 'lines')
  
}