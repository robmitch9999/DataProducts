
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(plyr)
data("mtcars")    
units <- c("miles/gallon(US)", "number", "cubic inches", "gross horsepower", "times", 
               "1000 lbs", "seconds", "V=0, straight=1", "0=Auto, 1=Manual", 
               "number", "number")
desc <- c("fuel efficiency", "Engine Cylinders", "Engine Displacement", "Power", "Final Drive", 
          "Weight", "Acceleration", "Engine Configuration", "Gearbox Type", "Number of Carburettors")
namesplus <- cbind(names(mtcars), units, desc)

shinyServer(function(input, output) {
  

  output$carsPlot <- renderPlot({
    Xlab = paste(input$selectX, " (", namesplus[which(namesplus[,1] == input$selectX),2], ")")
    Ylab = paste(input$selectY, " (", namesplus[which(namesplus[,1] == input$selectY),2], ")")
    title = paste(namesplus[which(namesplus[,1] == input$selectY),3], " vs ",
                  namesplus[which(namesplus[,1] == input$selectX),3])

    
    X <- mtcars[,input$selectX]
    Y <- mtcars[,input$selectY]
    
    mod <- lm(Y~X)
    newx <- seq(min(X), max(X), length = 100)
    newdata <- data.frame(newx)
    names(newdata) = "X"

    plot(x=X, y=Y, main = title, xlab = Xlab, ylab = Ylab)
    
    if("Add linear model (lm)" %in% input$checkGroup) {

    abline(mod, col = "green", lwd = 2)
           
    }
    
    # intervals
    if("Confidence Interval (CI) on lm" %in% input$checkGroup) {
        preds <- data.frame(predict(mod, newdata = newdata, interval = 'confidence'))
        lines(newx, preds[ ,3], lty = 'dashed', col = 'red')
        lines(newx, preds[ ,2], lty = 'dashed', col = 'red')      
    }
    if ("CI on point predictions" %in% input$checkGroup) {
        preds1 <-data.frame(predict(mod, newdata = newdata, interval = 'predict'))
        lines(newx, preds1[ ,3], lty = 'dashed', col = 'blue')
        lines(newx, preds1[ ,2], lty = 'dashed', col = 'blue')      
    }

  })

})
