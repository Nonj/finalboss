# Load Libraries
library(dplyr)
library(ggplot2)
library(plotly)
library(rsconnect)
library(shiny)
library(gdata)
library(qdap)
library(lazyeval)

# Scripts
source('../scripts/buildWorldMapDeaths.R')
source('../scripts/buildWorldMapPrevalence.R')
source('../scripts/cleanData.R')
source('../scripts/makeLineGraph.R')
source('../scripts/makeScatterPlot.R')
source('../scripts/makePieChart.R')

#dataset for the HIV data
gdp.data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv", stringsAsFactors = FALSE)
colnames(gdp.data)[1] <- "Country"
age.data <- read.csv('../data/age_HIV.csv', stringsAsFactors = FALSE)
prevalance.data <- read.csv('../data/prevalence_HIV.csv', stringsAsFactors = FALSE)
new.data <- read.csv('../data/new_HIV.csv', stringsAsFactors = FALSE)
deaths.data <- read.csv('../data/deaths_HIV.csv', stringsAsFactors = FALSE)
choices.for.countries <<- fixed.new %>% select(Country)

# cleaning data

age.data <- data.frame(CleanData(age.data), stringsAsFactors = FALSE)
prevalance.data <- data.frame(CleanData(prevalance.data), stringsAsFactors = FALSE)
new.data <- data.frame(CleanData(new.data), stringsAsFactors = FALSE)
deaths.data <- data.frame(CleanData(deaths.data), stringsAsFactors = FALSE)

# joining data

joined.age <- age.data %>% full_join(gdp.data)
joined.prevalance <- prevalance.data %>% full_join(gdp.data)
joined.new <- new.data %>% full_join(gdp.data)
joined.deaths <- deaths.data %>% full_join(gdp.data)

# Took spaces out the numbers (use these)
fixed.age <- data.frame(lapply(joined.age, function(x) {gsub(" ", "", x)}), stringsAsFactors = FALSE)
fixed.prevalence <- data.frame(lapply(joined.prevalance, function(x) {gsub(" ", "", x)}), stringsAsFactors = FALSE)
fixed.new <- data.frame(lapply(joined.new, function(x) {gsub(" ", "", x)}), stringsAsFactors = FALSE)
fixed.deaths <- data.frame(lapply(joined.deaths, function(x) {gsub(" ", "", x)}), stringsAsFactors = FALSE)

fixed.age[2:7] <- data.frame(lapply(fixed.age[2:7], function(x) as.numeric(as.character(x))), stringsAsFactors = FALSE)
fixed.prevalence[2:7] <- data.frame(lapply(fixed.prevalence[2:7], function(x) as.numeric(as.character(x))), stringsAsFactors = FALSE)
fixed.new[2:8] <- data.frame(lapply(fixed.new[2:8], function(x) as.numeric(as.character(x))), stringsAsFactors = FALSE)
fixed.deaths[2:7] <- data.frame(lapply(fixed.deaths[2:7], function(x) as.numeric(as.character(x))), stringsAsFactors = FALSE)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  #Choose between two world maps to show death or prevalence by country and year
  output$map <- renderPlotly({
    if(input$data.var == 1){ #Makes the map with whatever data we want
      return (buildWorldMapDeaths(input$data.var, input$year.var)) 
    } else {
      return (buildWorldMapPrevalence(input$data.var, input$year.var)) 
    }
  })
  
  #create line graph to show individual country stats
  output$infections <- renderPlotly({
      return (makeLineGraph(input$country))
  })
  
  #All country list
  output$allCountries <- renderUI({
    selectInput('country', 'Country', as.list(choices.for.countries), selected = 'Afghanistan') 
  })
  
  #create scatter plot comparing GDP and HIV prevalence
  output$gdp <- renderPlotly({
    return(makeScatterPlot(input$test))
  })
  
  #create pie chart of 10 top mortality countries
  output$pie <- renderPlotly({
    makePieChart(input$years)
  })
  
})
