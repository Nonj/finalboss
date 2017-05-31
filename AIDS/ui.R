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
      'Crime Concentration by Location',
      titlePanel(),
       sidebarLayout(
         sidebarPanel()
       ),
       mainPanel()
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
      "LMAOOOAAAAOAOAOAOAO"
    # titlePanel(),
    #   sidebarLayout(
    #     sidebarPanel()
    #   ),
    #   mainPanel()
    # )
    
    tabPanel(
      "LMAOOOAAAAOAOAOAOAO",
      titlePanel(),
      sidebarLayout(
        sidebarPanel()
      ),
      mainPanel()
    )
  )  
)))
