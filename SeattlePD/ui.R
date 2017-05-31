#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(plotly)
library(rsconnect)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Seattle Police Department Data"),
  
  
  navbarPage(
    tabPanel(
      "Overview",
      
      titlePanel(img(
        #change the png and etc.
        src = 'image.png',
        width: '100px',
        height = '100px'
        
      )),
      #Add once decided on data
      sidebarLayout()
      
    )
    
    
    
    
  )
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
