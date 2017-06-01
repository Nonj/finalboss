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
    h1('HIV/AIDS', align= "center"),
    HTML('<center><img src="hivimage.JPG" width="700"></center>'),
    h3('About'),
    p(strong('Human immunodeficiency virus or "HIV"'), 'is a virus that if left untreated can develop into aqquired immunodeficiency syndrome. 
    Unfortunately, the human body is', em('unable'), 'to completely rid itself of HIV, so it affects the carrier for life. HIV affects the body\'s immune
    system, and left untreated, reduces the number of T cells in the body, making the body more susceptible to infection. Eventually, the body
    is left completely defensless against infection and disease, which represents the onset of the AIDS stage.'), 
    span(),
    p('There is currently no cure for HIV/AIDS but can be controlled relatively effectively through the use of antiretroviral theropy.
    If taken carefully and diligently,antiretroviral medicine can significantly prolong the lives of people with HIV as well as lower
    their likelyhood of transmitting the virus to others.'),
    span(),
    p('You can learn more about HIV/AIDS ', a("here", href = "https://www.aids.gov/hiv-aids-basics/hiv-aids-101/what-is-hiv-aids/")),
    h3("The Data"),
    p("This project focuses on the prevalence of HIV throughout the world by country between the years of 2000 and 2015. It will find which countries
      had the highest overall infection rate, as well as portray how the infection to death ration fluctuated throughout the decade. The top 5 most
      infected countries will also be analyzed for their GDP and population side to reveal any underlying similarities")
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
                              "Green" = 'rgb(0,202,0)', "Red" = 'rgb(226,31,31)')),
      mainPanel(
        plotlyOutput("map")
      )
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

