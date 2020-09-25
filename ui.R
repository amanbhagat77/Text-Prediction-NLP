
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    
    titlePanel( fluidRow(
        column(4, align="left",
               h2("Text Prediction App using Natural Language Processing")
        )
    )),
    #span("Note: When the page loads, please give 10-15 seconds for the app to load in the background."),
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3("Overview"),
            p("This app is built to predict the next word as the user types a scentence. This app takes the inspiration from switkey app available
            on our mobile phones. The prediction is based on the words present in the database on which the model is trained. Maximum Likelihood
            estimator with Kneyser Ney Smoothing has been used as the prediction model. This is a very simple version of Kneyser Ney smoothing based 
            on certain assumptions made on the discount value."),
            h3("Instruction"),
            p("Please follow the below steps to use this application"),
            tags$ol(
                tags$li("Please enter you scentence in the input box"), 
                tags$li("Wait for few seconds as the list of next word appears"),
                tags$li("Press Submit button to update the word cloud"), 
                tags$li("Please click on the clear button to clear the text")
            ),
            h3("Enter your scentence"),
            textInput('sentenceInputVar', 'Type here:'),
            p('(Example: "I want to go" or "She used to")'),
            verbatimTextOutput("oWordPredictions"),
            actionButton('submitButton', 'Submit'),
            br(),
            HTML('<hr style="color: black;border-top: 1px dashed #8c8b8b;">'),
            span("Author: Aman Bhagat"),
            span("Contact: amanbhagat77@gmail.com"),
            p("License Copyright: MIT License")
            
            
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput(outputId = "word_cloud"),
            hr(),
            hr(),
            hr(),
            fluidRow(
                column(12, align="center",
                       h4("A word cloud representation of a set of possible words")
                )
            )
            
        )
        
    )
))
