# UI for Shiny 201 FINAL 

choices.for.countries <- new.data %>% filter((X2015 + X2010 + X2005 + X2000) > 0) %>% select(Country)

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
    If taken carefully and diligently, antiretroviral medicine can significantly prolong the lives of people with HIV as well as lower
    their likelyhood of transmitting the virus to others.'),
    span(),
    p('You can learn more about HIV/AIDS from this government', a("website", href = "https://www.aids.gov/hiv-aids-basics/hiv-aids-101/what-is-hiv-aids/")),
    h3("The Data"),
    p("This project focuses on the prevalence of HIV throughout the world by country between the years of", strong('2000 and 2015'), "using 
    interactive visuals. It will find which countries had the highest overall infection rate, as well as portray how the infection to death 
    ration fluctuated throughout the decade. The top 5 most infected countries will also be analyzed for their GDP and population side to 
    reveal any underlying similarities. Understanding the weight in which HIV/AIDS affects countries around the world allows one to begin to
    identify where and why HIV/AIDS is impacting peoples lives in this century.")
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
    
    sidebarPanel( p("This world map visualization shows either the prevalence or amount of deaths per country throughout the world. 
                    By hovering over each country you can see the data attached depending on the selection.")
    ),
    mainPanel(
      plotlyOutput("map")
    )
  ),
  tabPanel(
    "HIV Infections Trends Per Country",
    titlePanel("HIV Infection Trends Per Country"),
     sidebarLayout(
       sidebarPanel(
         selectInput(inputId = 'country',
                     label = 'Country',
                     choices = choices.for.countries,
                     selected = 'Afghanistan')
       ),
       sidebarPanel(
         p("This visualization shows the trends of infection throughout the decade of 2015. Each country can be selected
           and the trend will be shown through the line plot. ")
       ),
       mainPanel(
         plotlyOutput("infections")
       )
       )
  ),
  tabPanel(
    "Infection rate compare to GDP",
    titlePanel("HIV Infection Prevalency Compared to Countries GDP"),
    sidebarLayout(
      sidebarPanel(
        selectInput(inputId = 'top',
                    label = 'Top X Countries',
                    choices = c(3, 5, 7),
                    selected = '3')
      ),
      mainPanel(
        plotlyOutput("gdp")
      )
    )
  ) 
))

