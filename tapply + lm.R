#lm

wages = read.csv('https://raw.githubusercontent.com/pseudorational/myDatasets/master/wages.csv')



table(wages$sex)
table(wages$race)

tapply()

tapply(wages$earn, wages$race, mean )
tapply(wages$earn, wages$sex, mean )
tapply(wages$earn, wages$sex, min )
tapply(wages$earn, wages$sex, max )
tapply(wages$earn, wages$sex, median )
tapply(wages$earn, wages$sex, sd )


sort(wages$earn)[1:20]


wage1=wages[wages$earn>0,]

lm(earn~height,data=wage1)

m2=lm(earn~sex,data=wage1)
summary(m2)
#sex is a categorical vairbale with categories: M & F
# R create sexmale dummy variable and uses female as the baseline category 
#avg earn of a male = 24246 +22742*sex male
24246+22742*1
#predicted earn=46988
#avg earn of a female
24246
#overlay density plots of earns of male and femalle
ggplot(data=wage1,aes(x=earn,color=sex))+
  geom_density()

#model predicting earning from age

m3=lm(earn~age,data=wage1)
summary(m3)
plot(wage1$age, wage1$earn)
abline(m3)
str(m3)


#R2=(SST-SSE)/SST=1-SSE/SST
SST =sum((wage1$earn - mean(wage1$earn))^2)
SSE =sum((wage1$earn - pred)^2)

pred = predict(m3) #predicted earn = 26847 + 129 * age
head(pred)

(SST-SSE)/SST

#measures improvement (variability due to age)/total variation

# try all variables to predict earn

m4 = lm(earn~ height + sex +  ed + age, data = wage1)
summary(m4)
m4 = lm(earn~., data=wage1)
m5 = lm(earn~.-race, data=wage1)
summary(m5)


m6=lm(earn~height+sex+height:sex, data=wage1)
summary(m6)

#45 years old male, 60 inches tall, 16 years of education 
# predict expected earn for this individual 

summary(m4)
df=data.frame(age=45, sex='male', height =60, ed=16)
predict(m4, newdata = df)

