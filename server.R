library(shiny)
library(datasets)
library(reshape2)
library(ggplot2)

# We tweak the "am" field to have nicer factor labels. Since this doesn't
# rely on any user inputs we can do this once at startup and then use the
# value throughout the lifetime of the application
RoseBella <- data.frame(time = seq(1880, 2011), Bella$Pure.Number, Rosemary$Pure.Number)
Molten <-melt(RoseBella, id.vars="time")

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    paste("Movie and ", input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$mpgPlot <- renderPlot({
    ggplot(Molten, aes(x=time, y=value, colour = variable)) +geom_line()
  })
 
  
})
