# Load Libraries
library(dplyr)
library(ggplot2)
library(plotly)
library(rsconnect)
library(shiny)
library(gdata)
library(qdap)

# Scripts
source('../scripts/buildWorldMapDeaths.R')
source('../scripts/buildWorldMapPrevalence.R')
source('../scripts/cleanData.R')
source('../scripts/makeLineGraph.R')

#dataset for the HIV data
gdp.data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv")
colnames(gdp.data)[1] <- "Country"
age.data <- read.csv('../data/age_HIV.csv', stringsAsFactors = FALSE)
prevalance.data <- read.csv('../data/prevalence_HIV.csv', stringsAsFactors = FALSE)
new.data <- read.csv('../data/new_HIV.csv', stringsAsFactors = FALSE)
deaths.data <- read.csv('../data/deaths_HIV.csv', stringsAsFactors = FALSE)

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

#THESE ARE JUST TESTS. CAN DELETE 
test.data <- new.data %>% filter(Country == 'Bahamas') %>% select(X2015)
test.factor <- joined.new
test.factor$X2015 =  as.numeric(as.character(test.factor$X2015))
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$map <- renderPlotly({
    if(input$data.var == 1){ #Makes the map with whatever data we want
      return (buildWorldMapDeaths(input$data.var, input$year.var)) 
    } else {
      return (buildWorldMapPrevelance(input$data.var, input$year.var)) 
    }
  })
  
  output$infections <- renderPlotly({
    makeLineGraph(new.data, input$country)
  })
  
})
