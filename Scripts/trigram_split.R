library(tm)
library(RWeka)


corpus <- readRDS("corpus.RDS")

total_size <- length(corpus)

total_split <- 6
chunk_size <- floor(total_size/total_split)
start_index <- 1
split_index <- chunk_size
trigram_df <- data.frame()
total_processed <- 0

system.time(for (i in seq(1,total_split)){
  temp_corpus  <- corpus[start_index:split_index]
  rm(corpus)
  trigram <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3))
  trigram_tdm <- TermDocumentMatrix(temp_corpus, control = list(tokenize = trigram))
  trigram_freqTerm <- findFreqTerms(trigram_tdm,lowfreq=10)
  total_processed <- total_processed + 8
  print(paste(total_processed, "%"))
  
  trigram_freq <- rowSums(as.matrix(trigram_tdm[trigram_freqTerm,]))
  trigram_ord <- order(trigram_freq, decreasing = TRUE)
  trigram_freq <- data.frame(token=names(trigram_freq[trigram_ord]), count=trigram_freq[trigram_ord])
  total_processed <- total_processed + 6
  rm(trigram_ord,trigram_tdm,trigram)
  print(paste(total_processed, "%"))
  
  start_index <- split_index + 1
  split_index <- split_index + chunk_size
  
  trigram_df <- rbind(trigram_df,trigram_freq)
  gc()
  corpus <- readRDS("corpus.RDS")
  total_processed <- total_processed + 2.66666
  print(paste(total_processed, "%"))
})
saveRDS(trigram_df, file = "trigram_df.RDS")
print("100%")
