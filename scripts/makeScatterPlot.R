# returns Scatter plot
makeScatterPlot <- function(year){
  
  #filtering out all no data empty values
  data <- filter_(fixed.prevalence, paste0("X", year ,"> 0"))
  
  #making scatter plot comparing GDP and percent infected by country
  p <- plot_ly(data, x = ~eval(parse(text = paste0("X",year))), y = ~GDP..BILLIONS.,
          size = fixed.new$year.to.inquire, text = ~paste("Country: ", Country)) %>% 
       layout(xaxis = list(title = "Percent Infected of Total Population"), yaxis = list(title = "GDP"))
  p
}


