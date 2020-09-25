## 
## Function Name: p_continuation()
## Called by: pkn_model
## Arguments:
##      input string  : candidate word
##
## Returns continuation probability when length of given input scentense is 1


p_continuation <- function(wordB){
  
  total_bigram_keeping_currword <- nrow(bigram_freq[bigram_freq$token2 == wordB, ])
  number_of_bigram_type <- nrow(bigram_freq)
  continuation_pr <- total_bigram_keeping_currword/number_of_bigram_type
  return(continuation_pr)
  
}