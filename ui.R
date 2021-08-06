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
                        value = c(20000,50000)),
            h5("Help: The chart on the right will show one bar per country with the total covid 19 deaths up to July 31th, 2021. Use the slider to filter the countries with the number of deaths you are interested in. If there are too many bars, country names may not fit the plot. Source code: https://github.com/juancho182/shiny")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
