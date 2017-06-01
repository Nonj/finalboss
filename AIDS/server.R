# Load Libraries
library(dplyr)
library(ggplot2)
library(plotly)
library(rsconnect)
library(shiny)
library(gdata)
library(qdap)

# functions
source('../scripts/buildWorldMap.R')
source('../scripts/cleanData.R')

#dataset for the HIV data
gdp.data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv")
age.data <- read.csv('data/age_HIV.csv', stringsAsFactors = FALSE)
prevalance.data <- read.csv('data/prevalence_HIV.csv', stringsAsFactors = FALSE)
new.data <- read.csv('data/new_HIV.csv', stringsAsFactors = FALSE)
deaths.data <- read.csv('data/deaths_HIV.csv', stringsAsFactors = FALSE)

# cleaning data
age.data <- data.frame(CleanData(age.data))
prevalance.data <- data.frame(CleanData(prevalance.data))
new.data <- data.frame(CleanData(new.data))
deaths.data <- data.frame(CleanData(deaths.data))

# joining data
joined.age <- age.data %>% full_join(gdp.data)
joined.prevalance <- prevalance.data %>% full_join(gdp.data)
joined.new <- new.data %>% full_join(gdp.data)
joined.deaths <- deaths.data %>% full_join(gdp.data)




# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$map <- renderPlotly({
    return (buildWorldMap(input$data.var, input$color.var, input$year.var)) #Makes the map with whatever data we want
  })
  
})
