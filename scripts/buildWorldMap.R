buildWorldMap <- function(data.var, color.var, year.var){

# light yellow boundaries between countries
l <- list(color = 'rgb(240,240,51)', width = .75)

# specify map details
g <- list(
  showframe = TRUE,
  showcoastlines = TRUE,
  projection = list(type = 'Mercator')
)

makeMap <- plot_geo(data.var) %>%
  add_trace(
    z = ~paste0("X",year.var), color = ~paste0("X",year.var), colors = color.var,
    text = ~COUNTRY, locations = ~CODE, marker = list(line = l)
  ) %>%
  colorbar(title = 'HIV Deaths') %>%
  layout(
    title = 'HIV Deaths<br>Source:<a href="http://www.who.int/hiv/en/">World Health Organization HIV</a>',
    geo = g
  )

makeMap
}

 

