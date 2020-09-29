## This Program will predict next words
## Function Name: find_next_word()
## Called by: server.R
## Calls : PKN(), find_candidate_list()
## Arguments:
##      input string  : String input by user
##
## Returns a dataframe of predicted words ordered by their respective probability


source("Scripts/pkn_model.R")
source("Scripts/candidate_list.R")

#directory <- "C:/Users/amanb/Documents/GitHub/Text-Prediction-NLP"
#setwd(directory)

unigram_freq <- readRDS("corpus/unigram_freq.rds")
bigram_freq <- readRDS("corpus/bigram_freq.rds")
trigram_freq <- readRDS("corpus/trigram_freq.rds")
quadgram_freq <- readRDS("corpus/quadgram_freq.rds")

find_next_word <- function(string){
  
  string <- tolower(string)
  candidate_list <- find_candidate_list(string, min_count = 2)
  probability <- vector()
  
  i <- 1  
  n <- length(candidate_list) 
  word_list <- unlist(strsplit(string , " "))
  size <- length(word_list)                   #size of the string
  temp_word_list <- c()
  
  count <- 1
  if(size > 3){
    for (i in seq(3,1, by = -1)){
      temp_word_list[count] <- word_list[size - i]
      count <- count + 1
    }
    string <-  paste(temp_word_list[1],temp_word_list[2],temp_word_list[3])
  }
  
  
  ##print(string) ##debugging
  
  for (word in candidate_list){
    
    probability[i] <- PKN(string, word, size + 1  )
    i <- i + 1
  }
  
  words_with_probability <- data.frame(word = unlist(candidate_list), PKN = unlist(probability))
  #(words_with_probability)
  
  words_with_probability <- words_with_probability[order(-words_with_probability$PKN),]
  
  return((words_with_probability))
  
  
  
}