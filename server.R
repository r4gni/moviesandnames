library(shiny)
library(datasets)
library(reshape2)
library(ggplot2)

RoseBella <- data.frame(time = seq(1880, 2011), Bella$Bella, Rosemary$Rosemary)
Molten<-melt(RoseBella, id.vars="time")
write.csv(RoseBella, file="RoseBella.csv", row.names=TRUE)

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    if(input$movie){ paste("Movie releases and the first names", input$variable[1], " & " ,input$variable[2])
    } else if(input$variable[1]){paste(input$variable[1])
    }else if(input$variable[2]){paste(input$variable[2])
    }else{paste(input$variable[1], " & ", input$variable[2])
    } 
  })
   
    
  output$caption <- renderText({
    formulaText()
  })

  output$Rosemary <- renderPlot({
    p<-ggplot(RoseBella, aes(x=time)) + geom_line(aes(y = RoseBella$Rosemary.Rosemary, colour = "Rosemary")) 
    if(input$movie){p <- p + geom_vline(xintercept=1918,col="green") + geom_vline(xintercept=1915,col="green") }
    print(p) 
  })
  
  output$Bella <- renderPlot({
    p<-ggplot(RoseBella, aes(x=time)) + geom_line(aes(y = RoseBella$Bella.Bella, col= "Bella"))
    if(input$movie){p <- p + geom_vline(xintercept=2008, col="blue") + geom_vline(xintercept=2005, col="blue") }
    print(p) 
  })
  
  output$Rosemaryandbella <- renderPlot({
    p<-ggplot(RoseBella, aes(x=time)) + geom_line(aes(y = RoseBella$Rosemary.Rosemary, colour = "Rosemary")) + geom_line(aes(y = RoseBella$Bella.Bella, colour = "Bella"))
    if(input$movie){p <- p + geom_vline(xintercept=2008, col="blue") + geom_vline(xintercept=2005, col="blue") + geom_vline(xintercept=1918,col="green") + geom_vline(xintercept=1915,col="green")}
    print(p) 
    })
})
