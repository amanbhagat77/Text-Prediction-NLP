#Establishing connection to the English version of the twitter, Blogs and news dataset

con_twitter <- file("D:/Games/R Workspace/Capstone/Coursera-SwiftKey/final/en_US/en_US.twitter.txt", "r")
con_news <- file("D:/Games/R Workspace/Capstone/Coursera-SwiftKey/final/en_US/en_US.news.txt", "r")
con_blogs <- file("D:/Games/R Workspace/Capstone/Coursera-SwiftKey/final/en_US/en_US.blogs.txt", "r")

# Reading lines from each of the dataset
lines_twitter <- readLines(con_twitter, warn=FALSE, encoding="UTF-8")
lines_news <- readLines(con_news, encoding="UTF-8")
lines_blogs <- readLines(con_blogs, warn=FALSE, encoding="UTF-8")

twitter <- sample(lines_twitter, length(lines_twitter)*0.05)
blogs <- sample(lines_blogs, length(lines_blogs)*0.05)
news <- sample(lines_news, length(lines_news)*0.05)

corpus <- c(twitter, blogs, news)
corpus <- iconv(corpus, "UTF-8","ASCII", sub = "")
length(corpus)

corpus <- VCorpus(VectorSource(corpus))
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, PlainTextDocument)
corpus <- tm_map(corpus, removeWords, stopwords("english"))