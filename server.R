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
source('scripts/buildWorldMapDeaths.R', local = TRUE)
source('scripts/buildWorldMapPrevalence.R', local = TRUE)
source('scripts/makeLineGraph.R', local = TRUE)
source('scripts/makeScatterPlot.R', local = TRUE)
source('scripts/makePieChart.R', local = TRUE)

#dataset for the HIV data
gdp.data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv", stringsAsFactors = FALSE)
colnames(gdp.data)[1] <- "Country"
age.data <- read.csv('data/fixed_age.csv', stringsAsFactors = FALSE)
prevalance.data <- read.csv('data/fixed_prevalence.csv', stringsAsFactors = FALSE)
new.data <- read.csv('data/fixed_new.csv', stringsAsFactors = FALSE)
deaths.data <- read.csv('data/fixed_deaths.csv', stringsAsFactors = FALSE)
choices.for.countries <<- new.data %>% select(Country)

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
