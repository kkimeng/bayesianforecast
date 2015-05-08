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
             sliderInput("LaggedRidership",label=h3("Lagged Ridership (thousands)"),
                         min = 100, max=1500, value=mean(express$ridership.counts/1000))
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

