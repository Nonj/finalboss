# Scatter plot
makeScatterPlot <- function(year){
  colname = paste0("X",year)
  data <- filter_(fixed.prevalence, paste0("X", year ,"> 0"))
  p <- plot_ly(data, x = ~eval(parse(text = colname)), y = ~GDP..BILLIONS.,
          size = fixed.new$year.to.inquire, text = ~paste("Country: ", Country)) %>% 
       layout(xaxis = list(title = "Percent Infected of Total Population"), yaxis = list(title = "GDP"))
  p
}


