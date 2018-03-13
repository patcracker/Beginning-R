#1
data = read.csv("C:/Users/prati/Downloads/eBayCleanAssignment.csv")
nrow(data)
str(data)
nrow(data[data$color=='Black',])
str(data)
levels(data$productline)
max(data$startprice[data$UniqueID])

#2
library(caTools)
set.seed(196)
split = sample.split(data$sold,SplitRatio = 0.8)
train = data[split,]
test = data[!split,]

nrow(train)
median(train$startprice[train$sold==1])
median(train$startprice[train$sold==0])

model1 = glm(sold~biddable + startprice + condition + cellular+carrier+ color+ storage+ productline+ noDescription+charCountDescription+ upperCaseDescription+ startprice_99end,data=data,family='binomial')
summary(model1)

names(model1)
model1$coef[4]
