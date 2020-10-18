#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Can you guess the Regression line parameters?"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        
        sidebarPanel(
            numericInput(inputId = "slope", label = "Guess a slope", 
                         value = 0, step = 0.1),
            numericInput(inputId = "inter", label = "Guess an intercept", 
                         value = 0, step = 0.1),
            actionButton(inputId = "gen", label = "Generate new plot"),
            
            h3(checkboxInput(inputId = "showReg", label = "Show Answer", value = F))
            
    ),
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("Plot"),
            div(),
            h3("Documentation:"),
            h4("The name of the game is simple.  Generate some random numbers with the 'Generate new plot' button. Then guess what the parameters of the regression line through the data are.  Put the slope and intercept above, and you can check your guess by clicking on the 'Show Answer' button.")
        )
    )
))
