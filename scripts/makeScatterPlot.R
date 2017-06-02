# Scatter plot
makeScatterPlot <- function(data, year){
  year.to.inquire <- paste0("X", year)
  p <- plot_ly(data, x = data$year.to.inquire, y = ~GDP..BILLIONS., color = ~GDP..BILLIONS.,
          size = data$year.to.inquire, text = ~paste("Country: ", Country))
  p
}


