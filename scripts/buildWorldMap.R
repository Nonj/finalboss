buildWorldMap <- function(data.var, color.var, year.var){

# light grey boundaries
l <- list(color = toRGB("grey"), width = 0.5)

# specify map projection/options
g <- list(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = list(type = 'Natural Earth')
)

makeMap <- plot_geo(data) %>%
  add_trace(
    z = ~year.var, color = ~year.var, colors = color.var,
    text = ~Country, locations = ~"Code name", marker = list(line = l)
  ) %>%
  colorbar(title = "HIV") %>%
  layout(
    title = 'HIV Deaths<br>Source:<a href="http://www.who.int/hiv/en/">World Health Organization HIV</a>',
    geo = g
  )

makeMap

}
 

