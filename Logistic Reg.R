churn=read.csv('C:/Users/prati/Downloads/churn.csv')
set.seed(123)
library(caTools)
split=sample.split(churn$Churn,SplitRatio = .7)
table(split)
nrow(churn)
train=churn[split,]
test=churn[!split,]

churnmodel=glm(Churn~Day_Mins,data=train,family='binomial')
summary(churnmodel)
(exp(churnmodel$coefficients[2])-1)*100
pred=predict(churnmodel, type='response')

a=table(train$Churn[1:10],pred[1:10]>0.5)
a
accuracy=sum(a[1,1],a[2,2])/length(train$Churn[1:10])
accuracy

pred_test=predict(churnmodel, newdata=test, type='response')
b=table(test$Churn, pred_test>0.5)
accuracy1=sum(b[1,1],b[2,2])/nrow(test)
accuracy;accuracy1
       