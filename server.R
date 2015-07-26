# server.R

library(quantmod)
source("helpers.R")

shinyServer(function(input, output) {

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
      type = "line", log.scale = input$log,abline(mean(datainput()),0),TA = NULL)
    
    
    
  })
            
  
  
})