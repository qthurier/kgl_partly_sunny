score_threshold <- 0.5

s2 <- which(dat$s2>score_threshold) # negative tweets
term_matrix_s2 <- DocumentTermMatrix(corpus[s2])
neg_words <- findFreqTerms(term_matrix_s2, 1000)

s4 <- which(dat$s4>score_threshold) # positive tweets
term_matrix_s4 <- DocumentTermMatrix(corpus[s4])
pos_words <- findFreqTerms(term_matrix_s4, 1000)

prob_s2 <- colSums(inspect(term_matrix_s2))/length(s2)

s3 <- which(dat$s3>0)
term_matrix_s3 <- DocumentTermMatrix(corpus[s3])
findFreqTerms(term_matrix_s3, 1000)

s1 <- which(dat$s1>0)
term_matrix_s1 <- DocumentTermMatrix(corpus[s1])
findFreqTerms(term_matrix_s1, 1000)