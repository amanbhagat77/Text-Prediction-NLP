library(tm)
library(RWeka)


corpus <- readRDS("corpus.RDS")

total_size <- length(corpus)

total_split <- 6
chunk_size <- floor(total_size/total_split)
start_index <- 1
split_index <- chunk_size
bigram_df <- data.frame()
total_processed <- 0

system.time(for (i in seq(1,total_split)){
  temp_corpus  <- corpus[start_index:split_index]
  rm(corpus)
  bigram <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
  bigram_tdm <- TermDocumentMatrix(temp_corpus, control = list(tokenize = bigram))
  bigram_freqTerm <- findFreqTerms(bigram_tdm,lowfreq=20)
  total_processed <- total_processed + 8
  print(paste(total_processed, "%"))
  
  bigram_freq <- rowSums(as.matrix(bigram_tdm[bigram_freqTerm,]))
  bigram_ord <- order(bigram_freq, decreasing = TRUE)
  bigram_freq <- data.frame(token=names(bigram_freq[bigram_ord]), count=bigram_freq[bigram_ord])
  total_processed <- total_processed + 6
  rm(bigram_ord,bigram_tdm,bigram)
  print(paste(total_processed, "%"))
  
  start_index <- split_index + 1
  split_index <- split_index + chunk_size
  
  bigram_df <- rbind(bigram_df,bigram_freq)
  gc()
  corpus <- readRDS("corpus.RDS")
  total_processed <- total_processed + 2.66666
  print(paste(total_processed, "%"))
})