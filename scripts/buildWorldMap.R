buildWorldMap <- function(data, color.var){

# light grey boundaries
l <- list(color = toRGB("grey"), width = 0.5)

# specify map projection/options
g <- list(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = list(type = 'Mercator')
)

makeMap <- plot_geo(df) %>%
  add_trace(
    z = ~"data"., color = ~"data"., colors = color.var,
    text = ~"Country name", locations = ~"Code name", marker = list(line = l)
  ) %>%
  colorbar(title = 'GDP Billions US$', tickprefix = '$') %>%
  layout(
    title = 'HIV Deaths<br>Source:<a href="https://www.cia.gov/library/publications/the-world-factbook/fields/2195.html">CIA World Factbook</a>',
    geo = g
  )

makeMap

}
 

