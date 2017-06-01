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
      mainPanel(
        p('Human immunodeficiency virus or "HIV" is a virus that if left untreated can develop into aqquired immunodeficiency syndrome. 
        Unfortunately, the human body is unable to completely rid itself of HIV, so it affects the carrier for life. HIV affects the body\'s immune
        system, and left untreated, reduces the number of T cells in the body, making the body more susceptible to infection. Eventually, the body
        is left completely defensless against infection and disease, which represents the onset of the AIDS stage.
          
        There is currently no cure for HIV/AIDS but can be controlled relatively effectively through the use of antiretroviral theropy.
        If taken carefully and diligently,antiretroviral medicine can significantly prolong the lives of people with HIV as well as lower
        their likelyhood of transmitting the virus to others.
        
        '
        )
      )
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
      "LMAOOOAAAAOAOAOAOAO",
      titlePanel(),
      sidebarLayout(
        sidebarPanel()
      ),
      mainPanel()
    )
  )  
))
