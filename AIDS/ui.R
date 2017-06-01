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

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("HIV Data"),
  
  
  navbarPage(
    
    tabPanel(
      "Overview",
      titlePanel(img(
        #change the png and etc.
        src = 'image.png',
        width = '100px',
        height = '100px'
        
      )),
      sidebarLayout(
        sidebarPanel()
      ),
      mainPanel()
    ),
    
    tabPanel(
      'World Map',
      titlePanel("World Map By Dataset"),
      
      radioButtons('data.var', ("Choose a dataset"),
                   choices = list("Deaths" = 1, "Prevalence" = 2), 
                   selected = 1),
      
      selectInput('year.var', ("Select Year"), 
                  choices = list("2000" = 1, "2005" = 2, "2010" = 3, "2015" = 4), 
                  selected = 1),
      
      sidebarPanel(
        selectInput('color.var', 'Choose a color for dataset', 
                    choices = c("Purple" = 'rgb(75,55,130)', "Yellow" = 'rgb(240,240,51)', 
                                "Green" = 'rgb(0,202,0)', "Red" = 'rgb(226,31,31)'))
      ),
      
       mainPanel(
         plotlyOutput("map")
       )
    ),
    
    tabPanel(
      "Crime Concentration by Date/Time",
      titlePanel(),
       sidebarLayout(
         sidebarPanel()
       ),
       mainPanel()
    ),

    tabPanel(
      "LMAOOOAAAAOAOAOAOAO",
      titlePanel(),
      sidebarLayout(
        sidebarPanel()
      ),
      mainPanel()
    )
  )  
))
