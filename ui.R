
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    
    titlePanel("Text Prediction App using Natural Language Processing")
        ,
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
            tags$b(p("References: ")),
            tags$ul(
                tags$li( tags$a(href="https://en.wikipedia.org/wiki/Natural_language_processing", "Natural Language Processing")), 
                tags$li(tags$a(href="https://en.wikipedia.org/wiki/Kneser%E2%80%93Ney_smoothing", "Kneyser Kney Smoothing")),
                tags$li(tags$a(href="https://stats.stackexchange.com/questions/114863/in-kneser-ney-smoothing-how-are-unseen-words-handled", "Kneyser Kney for unseen words")), 
                tags$li(tags$a(href="http://web.stanford.edu/class/cs124/lec/languagemodeling.pdf", "Language Modelling by Dan Jurafsky ")),
                tags$li(tags$a(href="https://github.com/amanbhagat77/Text-Prediction-NLP","GitHub Repository"))
            ),
            p(tags$b("Desclaimer:")," This is a an early build of the application. Please feel free to reach for any suggestions."),
            span(tags$b("Contact:"), "amanbhagat77@gmail.com"),
            div(tags$b("Author:"), "Aman Bhagat"),
            p(tags$b("License Copyright:"),tags$a(href = "https://github.com/amanbhagat77/Text-Prediction-NLP/blob/master/License.txt", "MIT License")),
            
            
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
