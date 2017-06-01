buildWorldMapPrevalence <- function(data.var, year.var){

# light yellow boundaries between countries
l <- list(color = 'rgb(0,202,0)', width = .75)

# specify map details
g <- list(
  showframe = TRUE,
  showcoastlines = TRUE,
  projection = list(type = 'Mercator')
)

makeMap <- plot_geo(fixed.prevalence) %>%
  add_trace(
    z = ~eval(parse(text = paste0("X",year.var))), color = ~eval(parse(text = paste0("X",year.var))), colors = 'Blues',
    text = ~Country, locations = ~CODE, marker = list(line = l)
  ) %>%
  colorbar(title = 'In Percent') %>%
  layout(
    title = 'HIV Prevalence by Country<br>Source:<a href="http://www.who.int/hiv/en/">World Health Organization HIV</a>',
    geo = g
  )

makeMap
}

 

