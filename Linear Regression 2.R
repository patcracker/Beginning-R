model1=lm(Life.Exp~Population+Income+Illiteracy+Murder+HS.Grad+Frost+Area, data=statedata)
summary(model1)

model2=lm(Life.Exp~Population+Murder+HS.Grad+Frost, data=statedata)
summary(model2)


sort(predict(model2))


statedata[which.min(statedata$Life.Exp),]

sort(predict(model2), decreasing = TRUE)

statedata[which.max(statedata$Life.Exp),]

pred=predict(model2)
sort(pred-statedata$Life.Exp)
