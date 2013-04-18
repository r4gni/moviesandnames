library(shiny)
library(reshape2)
library(ggplot2)

shinyUI(bootstrapPage(
  
  headerPanel("Movies and the popularity of names"),
  
  sidebarPanel(
    checkboxInput("movie", "Movie Releases", FALSE)
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Rosemary", plotOutput("Rosemary")), 
      tabPanel("Bella", plotOutput("Bella")), 
      tabPanel("Rosemary and Bella", plotOutput("Rosemaryandbella"))
    )
))
)
