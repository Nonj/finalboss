# Scatter plot
makeScatterPlot <- function(year){
  year.to.inquire <- paste0("X", year)
  p <- plot_ly(fixed.new, x = fixed.new$year.to.inquire, y = ~GDP..BILLIONS., color = ~GDP..BILLIONS.,
          size = fixed.new$year.to.inquire, text = ~paste("Country: ", Country))
  p
}


