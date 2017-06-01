#buildWorldMap <- function(data.var, color.var, year.var){

# light grey boundaries
l <- list(color = rgb(240,240,51, maxColorValue = 255), width = 0.5)

# specify map projection/options
g <- list(
  showframe = TRUE,
  showcoastlines = TRUE,
  projection = list(type = 'Mercator')
)

makeMap <- plot_geo(joined.age) %>%
  add_trace(
    z = ~population, color = ~population, colors = 'Blues',
    text = ~COUNTRY, locations = ~CODE, marker = list(line = l)
  ) %>%
  colorbar(title = "HIV Age$", tickprefix = '$') %>%
  layout(
    title = 'HIV Deaths<br>Source:<a href="http://www.who.int/hiv/en/">World Health Organization HIV</a>',
    geo = g
  )

makeMap


 

