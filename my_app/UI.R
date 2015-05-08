library(shiny)
source('helpers.R')


# Define UI for application that selects route 
shinyUI(fluidPage(
  # Application title
  titlePanel('Using Bayesian Analysis to Forecast Metro Transit Monthly Ridership'),
  
  sidebarLayout(
    sidebarPanel(
             sliderInput("EconomicIndex", label = h3("Economic Index"),
                         min = 100, max = 200, value = mean(express$econ_index)),
             sliderInput("Temperature", label = h3("Temperature"),
                         min = -50, max = 100, value = mean(express$Temperature)),
    
    sliderInput("bins",
                label = h3("Number of bins:"),
                min = 1,
                max = 100,
                value = 50)
  ),
    # Show a plot of the generated distribution
    mainPanel(
      h3 ("Distribution of Forecasted Ridership for Next Period") ,
      plotOutput('plot1'),
      h4(textOutput('text1')),
      h4(textOutput('text2')),
      img(src="http://www.metrotransit.org/Data/Sites/1/media/logos/metcolor.jpg",width=300,align="right")
    ))

))

