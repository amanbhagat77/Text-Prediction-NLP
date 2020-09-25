library(shiny)
library(data.table)
library(wordcloud)

##directory <- "C:/Users/amanb/Documents/GitHub/Text-Prediction-NLP/Scripts"
##setwd(directory)

source("Scripts/find_next_word.R")

shinyServer(
    function(input, output) {
        
        output$oWordPredictions <- renderText({
            #input$submitButton
            predicted_words_df <- find_next_word(string = input$sentenceInputVar)
            results <- isolate(paste(
                unlist(lapply(predicted_words_df$word[1:5],
                              function(x) paste0("[", x, "]")
                )
                )
            ))
        })
        output$word_cloud <- renderPlot({
            input$submitButton
            df <- isolate(find_next_word(string = input$sentenceInputVar))
            results <- wordcloud(df$word, df$PKN, colors=brewer.pal(8, "Set1"))
            
        },res = 120, height = 600, width = "auto")
    })