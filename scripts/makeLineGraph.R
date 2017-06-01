# SCript to make interactive line plot

makeLineGraph <- function(user.country) {
  country.data <- new.data %>% filter(Country == user.country) 
  amount.of.people <- country.data[2:5]
  hiv.trends <- plot_ly(amount.of.people, x = colnames(amount.of.people), y = as.numeric(amount.of.people[1,]), 
               type = 'scatter', mode = 'lines+markers')
  
  hiv.trends
}
