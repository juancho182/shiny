#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a barplot
shinyUI(fluidPage(

    # Application title
    titlePanel("Covid Deaths by Country"),

    # Sidebar with a slider input for number of deaths
    sidebarLayout(
        sidebarPanel(
            sliderInput("deaths",
                        "Number of deaths:",
                        min = 0,
                        max = 650000,
                        value = c(20000,50000))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
