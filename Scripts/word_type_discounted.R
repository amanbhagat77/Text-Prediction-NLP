## 
## Function Name: word_type_discounted()
## Called by: pkn_model
## Arguments:
##      input string  : String input by user and length 
##
## Returns total word type discounted keeping previuos word constant

word_type_discounted <- function(n , wordA){
  if (n == 4) {
    wordA_in_quadgram <- paste(quadgram_freq$token1, quadgram_freq$token2, quadgram_freq$token3, sep = " ")
    return(length(grep(wordA, wordA_in_quadgram)))
  }
  
  else if (n == 3){
    wordA_in_trigram <- paste(trigram_freq$token1, trigram_freq$token2, sep = " ")
    return(length(grep(wordA, wordA_in_trigram)))
  }
  
  
  else if (n == 2){
    return(length(grep(paste("^",wordA," ",sep = ""), bigram_freq$token)))
  }
  
}