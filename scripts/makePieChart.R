makePieChart <- function(year.var){
  
  #sorting data from most deaths to least deaths in the inputted year
  data <- arrange_(fixed.deaths, interp(~-name, name = as.name(paste0("X",year.var))))
  #grabbing top 10 most deaths
  data <- data[1:10,]
  
  #making pie chart of top 10 mortality countries with hover information
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
  p
}
