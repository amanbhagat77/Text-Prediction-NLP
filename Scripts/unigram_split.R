library(tm)
library(RWeka)


corpus <- readRDS("corpus.RDS")

total_size <- length(corpus)

total_split <- 6
chunk_size <- floor(total_size/total_split)
start_index <- 1
split_index <- chunk_size
unigram_df <- data.frame()
total_processed <- 0

system.time(for (i in seq(1,total_split)){
  temp_corpus  <- corpus[start_index:split_index]
  rm(corpus)
  unigram <- function(x) NGramTokenizer(x, Weka_control(min = 1, max = 1))
  unigram_tdm <- TermDocumentMatrix(temp_corpus, control = list(tokenize = unigram))
  unigram_freqTerm <- findFreqTerms(unigram_tdm,lowfreq = 40)
  total_processed <- total_processed + 8
  print(paste(total_processed, "%"))
  
  unigram_freq <- rowSums(as.matrix(unigram_tdm[unigram_freqTerm,]))
  unigram_ord <- order(unigram_freq, decreasing = TRUE)
  unigram_freq <- data.frame(word=names(unigram_freq[unigram_ord]), frequency=unigram_freq[unigram_ord])
  total_processed <- total_processed + 6
  rm(unigram_ord,unigram_tdm,unigram)
  print(paste(total_processed, "%"))
  
  start_index <- split_index + 1
  split_index <- split_index + chunk_size
  
  unigram_df <- rbind(unigram_df,unigram_freq)
  gc()
  corpus <- readRDS("corpus.RDS")
  total_processed <- total_processed + 2.66666
  print(paste(total_processed, "%"))
})