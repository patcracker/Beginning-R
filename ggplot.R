ggplot(data = mpg,aes(x=displ,y=cty))+
  geom_point()

ggplot(data = mpg,aes(x=displ,y=cty, color=class))+
  geom_point()

ggplot(data = mpg,aes(x=displ,y=cty, size=class))+
  geom_point()

ggplot(data = mpg,aes(x=displ,y=cty, shape=class))+
  geom_point()

ggplot(data = mpg,aes(x=displ,y=cty, alpha=class))+
  geom_point()
ggplot(data = mpg,aes(x=displ,y=cty, size=cyl))+
  geom_point()

ggplot(data = mpg,aes(x=displ,y=cty, alpha=cyl))+
  geom_point()

ggplot(data = mpg,aes(x=displ,y=cty, color=cyl, shape=factor(year)))+
  geom_point()
colors()

ggplot(data = mpg,aes(x=displ,y=cty))+
  geom_point()+
  facet_grid(cyl~.)

ggplot(data = mpg,aes(x=displ,y=cty))+
  geom_point()+
  facet_wrap(~cyl)

ggplot(data = mpg,aes(x=displ,y=cty))+
  geom_point()+
  facet_wrap(year~cyl)

ggplot(data = mpg,aes(x=displ,y=cty))+
  geom_line()

ggplot(data = mpg,aes(x=displ,y=cty))+
  geom_smooth()

ggplot(data = mpg,aes(x=displ,y=cty))+
  geom_point()+
geom_smooth(method ='lm')

ggplot(data = mpg,aes(x=displ,y=cty))+
  geom_point(color='violetred2', size=.9)+
  geom_smooth(method ='lm', size=1.2, color='blue',)


ggplot(data = mpg,aes(x=factor(year),y=hwy))+
  geom_bar(stat='summary',fun.y='median')





library(ggplot2)
head(diamonds)
diamonds$cut=factor(diamonds$cut, ordered= F)
diamonds$cut
head(model.matrix(diamonds$price~diamonds$cut))
levels(diamonds$cut)
levels(diamonds$color)
diamonds$color=factor(diamonds$color,ordered=F)
summary(lm(price~color, diamonds))
levels(diamonds$color)=c("J","D","E", "G","H","I")

