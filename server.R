#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        # generate data based on slider input
        x    <- read.csv("coviddata2.csv",sep=",",header = TRUE)
        min  <- input$deaths[1]
        max  <- input$deaths[2]
        x    <- subset(x, Deaths>=min & Deaths<=max)

        # draw the barplot with the selected data
        barplot(x[,2],  
                ylab="Country", 
                xlab="Deaths",
                horiz=TRUE,
                names.arg=x[,1]) 

    })

})
