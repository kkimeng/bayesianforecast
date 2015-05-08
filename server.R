


 ## Define Server to plot the function above
shinyServer(function(input, output) {
  
  output$plot1<- renderPlot({
    x=forecast(input$EconomicIndex,input$Temperature,input$LaggedRidership)
    hist(x, breaks = 60, col = 'lightskyblue1', border = 'white', freq=F,xlab="Ridership Counts (Thousands)",main="")
    abline(v=mean(x),col=2,lwd=3)
    lines(density(x,na.rm=T),col='blue',lwd=3)
  })
  output$text1 <- renderText({
    x=forecast(input$EconomicIndex,input$Temperature,input$LaggedRidership)
    paste("Expected Value: ", as.integer(mean(x,na.rm=T)*1000))
  })
  output$text2 <- renderText({
    x=forecast(input$EconomicIndex,input$Temperature,input$LaggedRidership)
    paste("95% Credible Interval: [", as.integer(quantile(x,.025)*1000), ", ", as.integer(quantile(x,.975)*1000), "]")
  })
  })

