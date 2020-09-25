##
## Function Name: CKN()
## Called by: pkn_model
## Arguments:
##      input string  : String input by user and length 
##
## Returns discounted Count of a word

CKN <- function(n , word){
  if (n == 4){
    result <- quadgram_freq$count[grepl(paste("^" , word, "$", sep = ""), quadgram_freq$token)]
    if(length(result) == 0)
      return(0)
    else
      return(result)
  }
  else if (n == 3){
      result <- trigram_freq$count[grepl(paste("^" , word, "$", sep = ""), trigram_freq$token)]
      if(length(result) == 0)
        return(0)
      else
        return(result)
  }
  else if (n == 2){
    result <- bigram_freq$count[grepl(paste("^" , word, "$", sep = ""), bigram_freq$token)]
    if(length(result) == 0)
      return(0)
    else
      return(result)
  }
  
  else{
    result <- unigram_freq$count[grepl(paste("^" , word, "$", sep = ""), unigram_freq$token)]
    if(length(result) == 0)
      return(0)
    else
      return(result)
  }
}







