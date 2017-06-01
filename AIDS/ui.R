# UI for Shiny 201 FINAL 

# LOADING DATA
new.data <- read.csv('../data/new_HIV.csv', stringsAsFactors = FALSE)
new.data <- CleanData(new.data)
new.data <- data.frame(new.data)
choices.for.countries <- new.data %>% select(Country)
typeof(choices.for.countries)
                              
# Define UI for application that draws a histogram
shinyUI(navbarPage("HIV Data",
  tabPanel(
    "Overview",
  p('Human immunodeficiency virus or "HIV" is a virus that if left untreated can develop into aqquired immunodeficiency syndrome. 
      Unfortunately, the human body is unable to completely rid itself of HIV, so it affects the carrier for life. HIV affects the body\'s immune
      system, and left untreated, reduces the number of T cells in the body, making the body more susceptible to infection. Eventually, the body
      is left completely defensless against infection and disease, which represents the onset of the AIDS stage.
        
      There is currently no cure for HIV/AIDS but can be controlled relatively effectively through the use of antiretroviral theropy.
      If taken carefully and diligently,antiretroviral medicine can significantly prolong the lives of people with HIV as well as lower
      their likelyhood of transmitting the virus to others.')
   ),
    
  tabPanel(
    'World Map',
    titlePanel("World Map By Dataset"),
    
    radioButtons('data.var', ("Choose a dataset"),
                 choices = list("Deaths" = 1, "Prevalence" = 2), 
                 selected = 1),
    
    sidebarPanel(
      selectInput('year.var', 'Select a Year', 
                  choices = c("2000" = 2000, "2005" = 2005, "2010" = 2010, "2015" = 2015)
      )
    ),
    mainPanel(
      plotlyOutput("map")
    )
  ),
  tabPanel(
    "HIV Infections Trends Per Country",
    titlePanel("HIV Infections Trends Per Country"),
     sidebarLayout(
       sidebarPanel(
         selectInput(inputId = 'country',
                     label = 'Country',
                     choices = choices.for.countries,
                     selected = 'Afghanistan')
       ),
       mainPanel(
         plotOutput('infections')
       )
       )
  ) 
))

