draw <- sample(1:nrow(dat), 0.1*nrow(dat))
train <- sample(1:length(draw), round(0.7*length(draw)))
term_matrix <- DocumentTermMatrix(corpus[draw])
threshold_score <- 0.2
threshold_freq <- 200
freq <- colSums(inspect(term_matrix))
select <- which(freq>=threshold_freq)

# binaire sur s4 -----------------------------------------
db <- data.frame(inspect(term_matrix[train, select]))
db_ <- data.frame(matrix(as.numeric(db>0), nrow=nrow(db)))
model <- naiveBayes(x=db_, y=as.factor(dat$s4[draw][train]>=threshold_score))
db <- data.frame(inspect(term_matrix[-train, select]))
db_ <- data.frame(matrix(as.numeric(db>0), nrow=nrow(db)))
pred <- predict(model, newdata=db_, type='raw')
Y_hat <- apply(pred, 1, max)
Y <- dat$s4[draw][-train]
sqrt(sum((Y-Y_hat)^2)/length(Y))

# multinomial sur s1 .. s5
db <- data.frame(inspect(term_matrix[train, select]))
db_ <- data.frame(matrix(as.numeric(db>0), nrow=nrow(db)))
z <- dat[draw[train], 5:9]
s <- factor(apply(z, 1, which.max))
model <- naiveBayes(x=db_, y=s)
db <- data.frame(inspect(term_matrix[-train, select]))
db_ <- data.frame(matrix(as.numeric(db>0), nrow=nrow(db)))
pred <- predict(model, newdata=db_, type='raw')
Y <- dat[draw[-train], 5:9]
sqrt(sum((Y-pred)^2)/length(Y))


