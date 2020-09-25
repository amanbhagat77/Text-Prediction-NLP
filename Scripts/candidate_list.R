## The candidate list is prepared based on the bigram model
## 
## Function Name: find_candidate_list()
## Called by: find_next_word()
## Arguments:
##      input string  : String input by user
##      minimum Count : Minimum count of the found word
## Returns list of candidate words

find_candidate_list <- function(string, min_count){
  
  wordslist <- unlist(strsplit(string, " "))
  n <- length(wordslist)
  
  word <- wordslist[n] ## word to be searched in the bigram model to get the list words which are followed by this word
  
  candidate_list <- bigram_freq[grepl(paste("^",word,"$", sep = ""),bigram_freq$token1 ) & bigram_freq$count > min_count,]
  candidate_list <- candidate_list$token2[order(-candidate_list$count)][1:50]
  candidate_list <- candidate_list[!is.na(candidate_list)]                        ## Remove NA from the list
  candidate_list <- candidate_list[candidate_list!= "s" & candidate_list!= "rt" & candidate_list!= "th" & candidate_list != "st"]
  if(length(candidate_list) == 0){
    candidate_list <- unigram_freq$token[order(-unigram_freq$count)][1:100]        ## If there is no match then return Top 50 words from 
  }                                                                               ## Unigram model
  
  return(candidate_list)
  
}