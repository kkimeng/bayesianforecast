library(shiny)
source('helpers.R')


# Define UI for application that selects route 
shinyUI(fluidPage(
  # Application title
  titlePanel('Choosing the Best Route Forecast Model'),
  
  sidebarLayout(
    sidebarPanel(
      column(3, 
             sliderInput("slider1", label = h3("Economic Index"),
                         min = 100, max = 200, value = mean(express$econ_index)),
             sliderInput("slider2", label = h3("Temperature"),
                         min = -50, max = 100, value = mean(express$Temperature))
      ),
    
    sliderInput("bins",
                "Number of bins:",
                min = 1,
                max = 100,
                value = 50)
  ),
    # Show a plot of the generated distribution
    mainPanel(
      h4 ("Distribution of Forecasted Ridership for Next Period using Bayesian Analysis") ,
      plotOutput('plot1'),
      uiOutput("summary")
    ))

))

