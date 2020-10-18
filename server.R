#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    combined <- reactiveValues(data = NULL, yVals = NULL, xlims = NULL, ylims = NULL)
    
    generate <- observeEvent(input$gen, {
        combined$slope <- rnorm(n = 1, mean = 0, sd = 1)
        combined$data <- runif(n = 100, min = 0, max = 5)
        combined$yVals <- combined$data * combined$slope + rnorm(n = 100, mean = 0, sd = 2)
        combined$xlims <- c(min(combined$data), max(combined$data))
        combined$ylims <- c(min(combined$yVals), max(combined$yVals))
    })
    
    output$Plot <- renderPlot({
        if(is.null(combined$data)){
            return()
        }
        dataSet <- data.frame(x = combined$data, y = combined$yVals)
        
        p <- ggplot(data = dataSet, aes(x=x, y=y)) +
            geom_point(aes(x=x, y= y), size = 3, alpha = 0.5) +
            coord_cartesian(xlim = combined$xlims, ylim = combined$ylims) + 
            geom_abline(slope = input$slope, intercept = input$inter, color = "red", lwd = 1.5)
            
        if(input$showReg){
            p <- p + geom_smooth(formula = y~x, method='lm',mapping = aes(x=x, y=y), se = F, lwd = 1.5)
        }
        p
    })
})
        
#
        # dataSet0 <- data.frame(pop1 = rnorm(n = input$nObs, mean = input$h0mean, sd = input$stdDev))
        # dataSet1 <- data.frame(pop2 = rnorm(n = input$nObs, mean = input$h1mean, sd = input$stdDev))
        # 
        # xmin <- min(min(dataSet0), min(dataSet1))
        # xmax <- max(max(dataSet0), max(dataSet1))
        # 
        # sigCut <- 0 + 1.97*sd(dataSet0$pop1)
        # 
        # dataSet0$fill0 <- factor(ifelse(test = dataSet0$pop1 > sigCut, yes = 1, no = 0))
        # dataSet1$fill1 <- factor(ifelse(test = dataSet1$pop2 > sigCut, yes = 1, no = 0))
        # 
        # ggplot()+
        #     geom_histogram(data = dataSet0, aes(x = pop1, y =..density.., fill = "blue", alpha = 0.3, 
        #                                         color = fill0), 
        #                    size = 2) +
        #     stat_function(fun = dnorm, args = list(mean = mean(dataSet0$pop1), 
        #                                            sd = sd(dataSet0$pop1)), color = "blue") +
        #     
        #     geom_histogram(data = dataSet1, aes(x = pop2, y =..density.., fill = fill1, alpha = 0.3), 
        #                    color = "red", size = 2) +
        #     
        #     stat_function(fun = dnorm, args = list(mean = mean(dataSet1$pop2), 
        #                                            sd = sd(dataSet1$pop2)), color = "red") +
        #     
        #     geom_vline(xintercept = sigCut, color = "blue", lwd = 3) +
        #     coord_cartesian(xlim = c(xmin, xmax))
