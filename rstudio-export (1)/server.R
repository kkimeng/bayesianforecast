##Set packages


### Extracting the data from Db_prod_serv_hist
#no inputs
#output: all historical monthly ridership data
### Extracting the data from Db_prod_serv_hist

# saveRDS( all, "all.RDS")
# #route number has to be in quotes
#all <- readRDS("H:/StrategicInitiatives/Research & Analytics/Ridership Analysis/Data and Models/By Route/Forecast shiny app/all.RDS")

##Change so that the data to be used can be imported

#get historical ridership data for any route
#inputs: list of all routes' data (can be obtained by calling all.routes.ridership), route number (has to be in quotes), (optional) day type
#output: data frame of historical monthly ridership data for the route specified






 ## Define Server to plot the function above
shinyServer(function(input, output) {
  
  datasetInput1 <- reactive ({
    input$EconomicIndex
  })
  datasetInput2 <- reactive ({
    input$Temperature
  })
  
  mods <- reactiveValues()
  mods <- reactiveValues()
  
  output$plot1<- renderPlot({
    x=forecast(datasetInput1(),datasetInput2()) 
    #bins <- input$bins
    hist(x,50)
    #, breaks = bins, col = 'darkgray', border = 'white')
  })
  })

