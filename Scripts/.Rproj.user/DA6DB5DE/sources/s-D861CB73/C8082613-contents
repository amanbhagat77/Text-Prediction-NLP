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
    return(length(grep(paste("^",word," ",sep = ""), bigram_freq$token)))
  }
    
}


p_continuation <- function(wordB){
  
  total_bigram_keeping_currword <- nrow(bigram_freq[bigram_freq$token2 == wordB, ])
  number_of_bigram_type <- nrow(bigram_freq)
  continuation_pr <- total_bigram_keeping_currword/number_of_bigram_type
  return(continuation_pr)
  
}


