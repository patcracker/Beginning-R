install.packages("car")

install.packages("reshape2")

library(car); library(reshape2)

data(Salaries)

install.packages("lm.beta")
install.packages("ggplot2")

library(ggplot2); library(lm.beta)

data=data("Salaries")
str(data)

str(Salaries)

ggplot(data=Salaries, aes(x=yrs.service,y=salary,color=rank))+
  geom_point()+
  geom_smooth(method="lm",size=1.1, se=F)

model1=lm(salary~sex, data=Salaries)
summary(model1)$r.squared
R2

names(summary(model1))

pred=predict(model1)
sse=sum((pred-Salaries$salary)^2)
sse
sst=sum((mean(Salaries$salary)-Salaries$salary)^2)
sst
R2=(sst-sse)/sst
R2

pred

model2=lm(salary~.-discipline,data=Salaries)
summary(model2)


pred2=predict(model2)
sse2=sum((pred2-Salaries$salary)^2)
sse2
sst2=sum((mean(Salaries$salary)-Salaries$salary)^2)
r22=(sst2-sse2)/sst2
r22
pred2

str(Salaries)
model3=lm(salary~	
            sexMale,data=Salaries)
summary(model3)


head(Salaries)

Salaries2 = Salaries

Salaries2$salaryDi = cut(Salaries$salary,
                         breaks = c(min(Salaries$salary,na.rm=T),
                                    median(Salaries$salary,na.rm=T),
                                    max(Salaries$salary,na.rm=T)),
                         labels = c("low","high"))

names(Salaries2)

Salaries2 = Salaries2[,-c(2,6)]

head(Salaries2)

install.packages("rpart")
install.packages("rpart.plot")

library(rpart); library(rpart.plot)

############ Now, run a CART model to predict salaryDi using all other variables (Hint: use rpart()). The following code will generate a tree model and then plot it. Try to interpret the tree. The variables on top used to split in the beginning are deemed to be most important predictors. 

tree = rpart(salaryDi~.,method="class",data=Salaries2)

prp(tree)
summary(tree)

str(Salaries)

# Dr.Lala's salary

model4=lm(salary~rank+yrs.since.phd+yrs.service+sex,data=Salaries)
summary(model4)


predict.lm(model4,data.frame(rank='Prof', yrs.since.phd=11, yrs.service=10, sex='Male' ))

# In class 02/26/18
install.packages('corrplot')
library(corrplot)
corrplot(cor(statedata[,c('Population','Income','Illiteracy','Murder','HS.Grad','Frost','Area')])
         , method = 'square',type='lower')
          

