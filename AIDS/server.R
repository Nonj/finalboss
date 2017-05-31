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

#dataset for the SeattlePD

age.data <- read.csv('data/age_HIV.csv', stringsAsFactors = FALSE)
df <- age.data[-1,]
prevalance.data <- read.csv('data/prevalence_HIV.csv', stringsAsFactors = FALSE)
new.data <- read.csv('data/new_HIV.csv', stringsAsFactors = FALSE)
deaths.data <- read.csv('data/deaths_HIV.csv', stringsAsFactors = FALSE)
gdp.data <- read.xls('../data/GDP.xls', sheet = 1, header = TRUE)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  
})
