#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(dplyr)
library(ggplot2)
library(plotly)
library(rsconnect)
library(shiny)
library(gdata)
library(qdap)

#dataset for the HIV data

gdp.data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv")
age.data <- read.csv('data/age_HIV.csv', stringsAsFactors = FALSE)
prevalance.data <- read.csv('data/prevalence_HIV.csv', stringsAsFactors = FALSE)
new.data <- read.csv('data/new_HIV.csv', stringsAsFactors = FALSE)
deaths.data <- read.csv('data/deaths_HIV.csv', stringsAsFactors = FALSE)


age.data <- read.csv('../data/age_HIV.csv', stringsAsFactors = FALSE)
prevalance.data <- read.csv('../data/prevalence_HIV.csv', stringsAsFactors = FALSE)
new.data <- read.csv('../data/new_HIV.csv', stringsAsFactors = FALSE)
deaths.data <- read.csv('../data/deaths_HIV.csv', stringsAsFactors = FALSE)
>>>>>>> 2ffb9f9a8d43dcb94329a457d35ee42db9aa7903



CleanData <- function(dataset){
  pop.data <- read.csv('../data/POP.csv', stringsAsFactors = FALSE)
  pop.data <- pop.data %>% select(X.2, X.3)
  pop.data <- pop.data[-c(1:4),]
  pop.data <- arrange(pop.data, X.2)
  pop.data <- pop.data[-c(1:94),]
  pop.data <- pop.data %>% select(X.3)
  colnames(pop.data) <- c('Population')
  df<- dataset[-1,]
  colnames(df) <- c('COUNTRY', 2015, 2010, 2005, 2000)
  df[df == 'No data'] <- 0
  df <-  genX(df, " [", "]")
  df <- gsub("<", "", df)
  df <- cbind(df, population = pop.data$Population)
  return(df)
}



age.data <- data.frame(CleanData(age.data))
prevalance.data <- data.frame(CleanData(prevalance.data))
new.data <- data.frame(CleanData(new.data))
deaths.data <- data.frame(CleanData(deaths.data))


age.data <- CleanData(age.data)
prevalance.data <- CleanData(prevalance.data)
new.data <- CleanData(new.data)
colnames(new.data)<-c('Country',2015, 2015, 2010, 2005, 2000, 'population')
deaths.data <- CleanData(deaths.data)

joined.age <- age.data %>% full_join(gdp.data)
joined.prevalance <- prevalance.data %>% full_join(gdp.data)
joined.new <- new.data %>% full_join(gdp.data)
joined.deaths <- deaths.data %>% full_join(gdp.data)

source('./scripts/buildWorldMap.R')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$map <- renderPlotly({
    return (buildWorldMap(input$data.var, input$color.var, input$year.var)) #Makes the map with whatever data we want
  })
  
})
