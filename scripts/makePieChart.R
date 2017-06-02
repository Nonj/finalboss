makePieChart <- function(year.var){
  library(lazyeval)
  data <- arrange_(fixed.deaths, interp(~-name, name = as.name(paste0("X",year.var))))
  data <- data[1:15,]
  View(data)
  p <- plot_ly(data, labels = ~Country, values = ~eval(parse(text = paste0("X",year.var))), type = 'pie') %>%
    layout(title = 'HIV Death Pie Chart',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
}
