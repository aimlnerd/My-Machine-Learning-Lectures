library(randomForest)
library(MASS) #Contains Boston dataframe
library(caret)

View(Boston)
#Cross Validation
cv.ctrl <- trainControl(method = "repeatedcv", repeats = 2,number = 5, allowParallel=T)
#GridSeach
rf.grid <- expand.grid(mtry = 2:13)

# randomizedgridsearchcv

set.seed(1861) ## make reproducible here, but not if generating many random samples
#Hyper Parametertuning
rf_tune <-train(medv~.,
                data=Boston,
                method="rf",
                trControl=cv.ctrl,
                tuneGrid=rf.grid,
                ntree = 1000,
                importance = TRUE)

#Cross Validation results
rf_tune
plot(rf_tune)
#Variable Importance
varImp(rf_tune)
plot(varImp(rf_tune), top = 10)
