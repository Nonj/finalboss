# SCript to make interactive line plot
makeLineGraph <- function(aids.data, user.country) {
  country.data <- aids.data <- filter(Country == user.country) 
  
  p <- plot_ly(data, x = colnames(country.data)[5, 2], y = c(as.numeric(country.data[5]), as.numeric(country.data[4]),
                                   as.numeric(country.data[3]), as.numeric(country.data[2])), 
                                   type = 'scatter', mode = 'lines')
  
}