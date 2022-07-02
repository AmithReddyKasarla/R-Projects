df<- read.csv("C:\\Users\\amith\\OneDrive\\Desktop\\Datasets\\breastcancer.csv")
str(df)
dim(df)
View(df)
colSums(is.na(df))
summary(df)
#Simple Random Sampling
set.seed(123)
index<-sample(1:nrow(df),nrow(df)*0.7)
train=df[index,]
test=df[-index,]
library(rpart)
mod = rpart(Class~.,data = train)
mod
rpart.plot(mod)
#prediction
pred = predict(mod,test,"class")
pred
#confusion Matrix
cm = table(pred,test$Class)
cm 
acc <- sum(diag(cm))/sum(cm)
acc
print(paste("Accuracy",acc*100))
