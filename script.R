con <- file("D:/Games/R Workspace/Capstone/Coursera-SwiftKey/final/en_US/en_US.twitter.txt", "r")
con <- file("D:/Games/R Workspace/Capstone/Coursera-SwiftKey/final/en_US/en_US.news.txt", "r")
con <- file("D:/Games/R Workspace/Capstone/Coursera-SwiftKey/final/en_US/en_US.blogs.txt", "r")
maxLength <- 0

i = 1
con <- file("D:/Games/R Workspace/Capstone/Coursera-SwiftKey/final/en_US/en_US.news.txt", "r")
n <- as.numeric(length(readLines(con)))
maxLength <- 0
while (i <= n) {
  words <- strsplit(readLines(con)," ")[[1]]
  currentLength <- length(words)
  if(currentLength > maxLength){
    maxLength <- currentLength
  }
  i <- i + 1
}

n1 <- grep("love" , readLines(con))
n2 <- grep("hate" , readLines(con))

length(n1)/length(n2)

n1 <- grep("biostats" , readLines(con))

lines <- c()
count <- 0
while(TRUE) {
  line = readLines(con, 1)
  if(length(line) == 0) break
  else if(grepl("A computer once beat me at chess, but it was no match for me at kickboxing", line)) count <- count + 1
}


#Breaking words
lines <- readLines(con)
lines <- tolower(lines)
w <- strsplit(lines, " ")
w <- data.frame(Words = unlist(w))
w$count <- 1
words_twitter <- w %>% group_by(Words) %>% summarize(count = sum(count))
words_twitter <- words_twitter[order(-words_twitter$count),]


g <- ggplot(data = words_twitter[1:15,], aes(x = Words, y = count))
g <- g + geom_bar(aes(reorder(Words, count),count), stat = "identity", fill  = "steelblue")
g <- g + labs(title = "Top 15 most frequent used words in Twitter Dataset", y = "Frequency", x = "Words")
g <- g + guides(fill = FALSE)
g

#News
con <- file("D:/Games/R Workspace/Capstone/Coursera-SwiftKey/final/en_US/en_US.news.txt", "r")
lines_news <- readLines(con)
lines_news <- tolower(lines_news)
w_news <- strsplit(lines_news, " ")
w_news <- data.frame(Words = unlist(w_news))
w_news$count <- 1
words_news <- w_news %>% group_by(Words) %>% summarize(count = sum(count))
words_news <- words_news[order(-words_news$count),]


g <- ggplot(data = words_news[1:10,], aes(x = Words, y = count ))
g <- g + geom_bar(aes(reorder(Words, count),count), stat = "identity")
g

#Blogs

con <- file("D:/Games/R Workspace/Capstone/Coursera-SwiftKey/final/en_US/en_US.news.txt", "r")
lines_blogs <- readLines(con)
lines_blogs <- tolower(lines_blogs)
w_blogs <- strsplit(lines_blogs, " ")
w_blogs <- data.frame(Words = unlist(w_blogs))
w_blogs$count <- 1
words_blogs <- w %>% group_by(Words) %>% summarize(count = sum(count))
words_blogs <- words_blogs[order(-words_blogs$count),]


g <- ggplot(data = words_blogs[1:10,], aes(x = Words, y = count ))
g <- g + geom_bar(aes(reorder(Words, count),count), stat = "identity")
g


##Concatenate
#n-gram Twitter
library(ngram)

lines_con <- concatenate(lines)
lines_con <- preprocess(lines_con, case = "lower", remove.punct = TRUE)

two_gram <- ngram(lines_con, sep = ", ", n = 2)
two_gram_twitter <- ( get.phrasetable ( two_gram ))

three_gram <- ngram(lines_con, sep = ", ", n = 3)
three_gram_twitter <- ( get.phrasetable ( three_gram ))

##n-grams News
con <- file("D:/Games/R Workspace/Capstone/Coursera-SwiftKey/final/en_US/en_US.news.txt", "r")
lines_news <- readLines(con)
lines_news <- concatenate(lines_news)
lines_news <- preprocess(lines_news, case = "lower", remove.punct = TRUE)
two_gram <- ngram(lines_news, sep = ", ", n = 2)
two_gram_news <- ( get.phrasetable ( two_gram ))

three_gram <- ngram(lines_news, sep = ", ", n = 3)
three_gram_news <- ( get.phrasetable ( three_gram ))
n 
#n-grams Blogs
con <- file("D:/Games/R Workspace/Capstone/Coursera-SwiftKey/final/en_US/en_US.blogs.txt", "r")
lines_blogs <- readLines(con)
lines_blogs <- concatenate(lines_blogs)
lines_blogs <- preprocess(lines_blogs, case = "lower", remove.punct = TRUE)
two_gram <- ngram(lines_blogs, sep = ", ", n = 2)
two_gram_blogs <- ( get.phrasetable ( two_gram ))

three_gram <- ngram(lines_blogs, sep = ", ", n = 3)
three_gram_blogs <- ( get.phrasetable ( three_gram ))

g <- ggplot(data = two_gram_twitter[1:15,], aes(x = ngrams, y = freq, fill = ngrams ))
g <- g + geom_bar(aes(reorder(ngrams, freq),freq), stat = "identity")
g <- g + labs(title = "Top 15 most frequent used two gram words in Twitter Dataset", y = "Frequency", x = "two-gram")
g <- g +  theme(axis.title.x=element_blank(),
                axis.text.x=element_blank(),
                axis.ticks.x=element_blank())
g

g <- ggplot(data = three_gram_twitter[1:15,], aes(x = ngrams, y = freq, fill = ngrams ))
g <- g + geom_bar(aes(reorder(ngrams, freq),freq), stat = "identity")
g <- g + labs(title = "Top 15 most frequent used three gram words in Twitter Dataset", y = "Frequency", x = "two-gram")
g <- g +  theme(axis.title.x=element_blank(),
                axis.text.x=element_blank(),
                axis.ticks.x=element_blank())
g


while(count <= n){
  if(sum <= 0.50){
    sum <- sum + numeric(words_twitter$prop[count])
    count <- count + 1 
  }
}