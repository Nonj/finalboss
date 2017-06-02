makePieChart <- function(year.var){
  library(lazyeval)
  data <- arrange_(fixed.deaths, interp(~-name, name = as.name(paste0("X",year.var))))
  data <- data[1:10,]
  View(data)
  p <- plot_ly(data, labels = ~Country, values = ~eval(parse(text = paste0("X",year.var))), type = 'pie',
           textposition = 'inside',
           textinfo = 'label',
           insidetextfont = list(color = '#FFFFFF'),
           hoverinfo = 'text',
           text = ~paste(eval(parse(text = paste0("X",year.var))), 'people'),
           marker = list(colors = colors,
                         line = list(color = '#FFFFFF', width = 1)),
           showlegend = FALSE,
           pull = .2) %>%
    layout(title = 'HIV Death Pie Chart',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
}
