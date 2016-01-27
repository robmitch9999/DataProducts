### revision with tabs is below this line

library(shiny)
require(markdown)
require(data.table)
data("mtcars")


shinyUI (
  navbarPage("Dataset view: mtcars",
             tabPanel("Documentation",
                      mainPanel(
                        includeMarkdown("Documentation.md")
                      ), style='width: 140%'
             ),
             
             tabPanel("View",
                      sidebarPanel(
                        selectInput("selectX", label = h4("X axis variable"), 
                                    choices = names(mtcars), selected = "qsec"),
                        selectInput("selectY", label = h4("Y axis variable"), 
                                    choices = names(mtcars), selected = "mpg"),
                        checkboxGroupInput("checkGroup", 
                                           label = h4("Modelling"), 
                                           choices = list("Add linear model (lm)", "Confidence Interval (CI) on lm", 
                                                          "CI on point predictions"))
                      ),
                      
                      mainPanel(
                        plotOutput("carsPlot")
                        
                      )
              )


  ))