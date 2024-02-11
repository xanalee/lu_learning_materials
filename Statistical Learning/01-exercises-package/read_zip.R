## Prepare training data
train <- read.table("/Users/macbookpro/Desktop/learning materials/Statistical Learning/01-exercises-package/zip.train", sep = " ")
dim(train)
colSums(is.na(train)) # last columns has only missings
train <- train[ , -258]

## Prepare test data
test <- read.table("zip.test", sep = " ")
colSums(is.na(test))
dim(test)## V1 is an indicator for the digit, select 2s and 3s
train <- train[train$V1 %in% 2:3, ]
train$V1 <- train$V1 - 2
dim(train)
test <- test[test$V1 %in% 2:3, ]
test$V1 <- test$V1 - 2
dim(test)

## This is what the images look like:
for (i in 0:9) {
  im <- matrix(as.numeric(train[train$V1 == i, 2:257][1, ]), nrow = 16, ncol = 16)
  image(t(apply(-im, 1, rev)), col = gray((0:63)/63), yaxt = "n", xaxt = "n")
  ## 63 is the minimum number of unique grayscale values observed for any variable 
}