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
age.data <- read.csv('../data/age_HIV.csv', stringsAsFactors = FALSE)
prevalance.data <- read.csv('../data/prevalence_HIV.csv', stringsAsFactors = FALSE)
new.data <- read.csv('../data/new_HIV.csv', stringsAsFactors = FALSE)
new.data[2] <- NULL
deaths.data <- read.csv('../data/deaths_HIV.csv', stringsAsFactors = FALSE)

# cleaning and joining data

age.data <- data.frame(CleanData(age.data), stringsAsFactors = FALSE)
prevalance.data <- data.frame(CleanData(prevalance.data), stringsAsFactors = FALSE)
new.data <- data.frame(CleanData(new.data), stringsAsFactors = FALSE)
deaths.data <- data.frame(CleanData(deaths.data), stringsAsFactors = FALSE)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$map <- renderPlotly({
    if(input$data.var == 1){ #Makes the map with whatever data we want
      return (buildWorldMapDeaths(input$data.var, input$year.var)) 
    } else {
      return (buildWorldMapPrevalence(input$data.var, input$year.var)) 
    }
  })
  
  output$infections <- renderPlotly({
    return(makeLineGraph(input$country))
  })
  
})
