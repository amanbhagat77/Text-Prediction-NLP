## This Program will predict next words
## Function Name: find_next_word()
## Called by: predict_next_word()
## Arguments:
##      input string  : String input by user
##
## Returns list of predicted words

find_next_word <- function(string){
  
  candidate_list <- find_candidate_list(string, min_count = 2)
  probability <- vector()
  
  i <- 1  
  n <- length(candidate_list) 
  size <- length(unlist(strsplit(string , " ")))                   #size of the string
  
  
  for (word in candidate_list){
    
    probability[i] <- PKN(string, word, size + 1  )
    i <- i + 1
  }
  
  words_with_probability <- data.frame(word = unlist(candidate_list), PKN = unlist(probability))
  ##print(words_with_probability)
  
  words_with_probability <- words_with_probability$word[order(-words_with_probability$PKN)][1:5]
  
  return(unlist(words_with_probability))
  
  
  
}