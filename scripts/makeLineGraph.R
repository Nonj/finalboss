# SCript to make interactive line plot

makeLineGraph <- function(aids.data, user.country) {
  country.data <- aids.data %>% filter(Country == user.country) 
  amount.of.people <- country.data[5:2]
  hiv.trends <- plot_ly(amount.of.people, x = colnames(country.data)[5:2], y = as.numeric(amount.of.people[1,]), 
               type = 'scatter', mode = 'lines+markers')
  
<<<<<<< HEAD
  p <- plot_ly(country.data, x = ~colnames(country.data), y = ~amount.of.people, 
                                   type = 'scatter', mode = 'lines')

=======
  hiv.trends
>>>>>>> clean up code
}
