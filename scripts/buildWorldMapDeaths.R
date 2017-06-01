buildWorldMapDeaths <- function(data.var, year.var){
  
  # light yellow boundaries between countries
  l <- list(color = toRGB("white"), width = .75)
  
  # specify map details
  g <- list(
    showframe = TRUE,
    showcoastlines = TRUE,
    projection = list(type = 'Mercator')
  )
  
  makeMap <- plot_geo(deaths.data) %>%
    add_trace(
      z = ~eval(parse(text = paste0("X",year.var))), color = ~eval(parse(text = paste0("X",year.var))), colors = 'Purples',
      text = ~Country, locations = ~CODE, marker = list(line = l)
    ) %>%
    colorbar(title = 'Number of People') %>%
    layout(
      title = 'HIV Deaths by Country<br>Source:<a href="http://www.who.int/hiv/en/">World Health Organization HIV</a>',
      geo = g
    )
  
  makeMap
}



