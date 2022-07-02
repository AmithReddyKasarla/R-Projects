df <- read.csv("C:\\Users\\amith\\OneDrive\\Desktop\\germanfinal1.csv")
str(df)
View(df)
dim(df)
#Checking for null values
colSums(is.na(df))
summary(df)
#Deleting 2 columns
df$Personal_status_and_sex=NULL
df$Telephone=NULL
#Checking the doimensions of the data
dim(df)
#Setting the seed to the data
set.seed(123)
#Random samplinginto 70/30
index<-sample(1:nrow(df),nrow(df)*0.7)
train=df[index,]
test=df[-index,]
library(rpart)
mod = rpart(Credit_Risk~.,data = train)
mod
rpart.plot(mod)
#prediction
pred = predict(mod,test)
pred
#confusion Matrix
cm = table(pred,test$Credit_Risk)
cm 
acc <- sum(diag(cm))/sum(cm)
acc
print(paste("Accuracy",acc*100))
