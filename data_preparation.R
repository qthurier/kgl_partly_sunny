library(tm); library(multicore); library(SnowballC)
dat <- read.csv("train.csv", header=TRUE); head(dat)
corpus <- Corpus(VectorSource(dat$tweet)); corpus 
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, stemDocument)
