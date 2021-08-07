Present
========================================================
author: Juan Noval
date: 6/Aug/21
autosize: true

Index
========================================================

Reproducible Pitch Presentation

- Describe shiny app
- Show code
- Show chart

Description
========================================================

This shiny app Covid Deaths by Country enables the user to select the range of deaths so only the countries with deaths among that range will be shown in the chart.

Code - ui.R
========================================================

The shiny app has ui.R with the following code

```r
library(shiny)
shinyUI(fluidPage(
    titlePanel("Covid Deaths by Country"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("deaths",
                        "Number of deaths:",
                        min = 0, max = 650000, value = c(20000,50000)),
            h5("Help: ...")
        ),
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
```

<!--html_preserve--><div class="container-fluid">
<h2>Covid Deaths by Country</h2>
<div class="row">
<div class="col-sm-4">
<form class="well" role="complementary">
<div class="form-group shiny-input-container">
<label class="control-label" id="deaths-label" for="deaths">Number of deaths:</label>
<input class="js-range-slider" id="deaths" data-skin="shiny" data-type="double" data-min="0" data-max="650000" data-from="20000" data-to="50000" data-step="1" data-grid="true" data-grid-num="10" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-drag-interval="true" data-data-type="number"/>
</div>
<h5>Help: ...</h5>
</form>
</div>
<div class="col-sm-8" role="main">
<div id="distPlot" class="shiny-plot-output" style="width:100%;height:400px;"></div>
</div>
</div>
</div><!--/html_preserve-->

Code - server.R
========================================================

The shiny app has server.R with the following code

```r
library(shiny)
shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
        x    <- read.csv("coviddata2.csv",sep=",",header = TRUE)
        min  <- input$deaths[1]
        max  <- input$deaths[2]
        x    <- subset(x, Deaths>=min & Deaths<=max)
        barplot(x[,2],  
                ylab="Country", 
                xlab="Deaths",
                horiz=TRUE,
                names.arg=x[,1]) 

    })
})
```


Output
========================================================

The plot can be found at https://juancho182.shinyapps.io/Covid_Deaths_per_Country/
The code can be found at https://github.com/juancho182/shiny
