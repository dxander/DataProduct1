# server.R

library(quantmod)
source("helpers.R")

shinyServer(function(input, output){

        datainput <-  reactive({
                data <- getSymbols(input$symb, src = "yahoo", 
                                   from = input$dates[1],
                                   to = input$dates[2],
                                   auto.assign = FALSE)
        })
        
        datainput2 <- reactive({
                if (!input$adjust) return(datainput())
                    adjust(datainput())
                
        })
        
        
        
  output$plot <- renderPlot({
           chartSeries(datainput2(), theme = chartTheme("white"), 
      type = "line", log.scale = input$log,abline(mean(datainput2()),0),TA = NULL)
        lx= lag(datainput2())
        mx= mean(datainput2())
        vx= var(datainput2())
         sdx = sqrt(vx)
    
  })
  
  output$distPlot <- renderPlot({
          #x    <- (datainput2()-mean(datainput2()))/stderr(datainput2())  
          #bins <- seq(min(x), max(x), length.out = input$bins + 1)
          
          # draw the histogram with the specified number of bins
          
          #hist(x, breaks = bins, col = 'darkgray', border = 'white')
          barChart(datainput2(),theme='white.mono',bar.type='hlc') 
        })  
            
  
  
})

