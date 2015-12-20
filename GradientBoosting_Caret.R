library(xgboost)
library(MASS) #Contains Boston dataframe
library(caret)

View(Boston)
#Cross Validation
cv.ctrl <- trainControl(method = "repeatedcv", repeats = 2,number = 5, allowParallel=T)
#GridSeach
xgb.grid <- expand.grid(nrounds=1000,eta = c(0.005,0.01,0.05,0.1), max_depth = c(4,5,6,7,8))

set.seed(1860)
#Hyper Parametertuning
xgb_tune <-train(medv~.,
                 data=Boston,
                 method="xgbTree",
                 trControl=cv.ctrl,
                 tuneGrid=xgb.grid,
                 importance = TRUE, 
                 subsample =0.8)

#Cross Validation results
xgb_tune
plot(xgb_tune)

#Variable Importance
plot(varImp(xgb_tune), top = 10)

