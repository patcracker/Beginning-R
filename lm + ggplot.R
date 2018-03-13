
nfl=read.csv('C:/Users/prati/Downloads/nfl-suspensions-data.csv')
pulitzer=read.csv('C:/Users/prati/Downloads/pulitzer.csv')
library(ggplot2)
ggplot(data=nfl, aes(x=team))+
  geom_bar()

ggplot(data=nfl, aes(x=category))+
  geom_bar()

ggplot(nfl, aes(x =factor(year), width=.15)) +
  geom_bar(position='dodge', colour='red')

ggplot(data=diamonds, aes(x=price))+
  geom_histogram(binwidth = 2000)
facet_wrap(~cut)


ggplot(data=diamonds, aes(x=price, fill=cut))+
  geom_histogram(binwidth = 2000)
facet_wrap(~cut)

ggplot(data=diamonds, aes(x=price, fill=cut))+
  geom_freqpoly()
facet_wrap(~cut)

ggplot(data=diamonds, aes(x=price, fill=cut))+
  geom_density()
facet_wrap(~cut)

ggplot(data=diamonds,aes(x=carat)) + 
  geom_density(size=1.5)  + 
  scale_x_continuous(limits=c(0,3),breaks=seq(0,3,0.2))

ggplot(data=diamonds,aes(x=carat, color=cut)) + 
  geom_density(size=1.5)  + 
  scale_x_continuous(limits=c(0,3),breaks=seq(0,3,0.2))

str(nfl)
head(nfl)

str(pulitzer)
ggplot(data=pulitzer,aes(x=newspaper,y=dailyCirculation2004)) +  
  geom_bar(stat="identity") +  
  theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust = 0.1))

ggplot(data=pulitzer,aes(x=PulitzerWinFinalist1990_2003,y=PulitzerWinFinalist1990_2014)) +  
  scatter(stat="identity") +  
  theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust = 0.1))

# q4
pulitzerlm = lm(PulitzerWinFinalist1990_2003~dailyCirculation2004,data=pulitzer)
summary(pulitzerlm)

  
  plot(pulitzer$PulitzerWinFinalist1990_2003, pulitzer$dailyCirculation2004)
abline(pulitzerlm)

# q5 
pulitzerlm2 = lm(PulitzerWinFinalist1990_2003~dailyCirculation2013,data=pulitzer)
summary(pulitzerlm2)

plot(pulitzer$PulitzerWinFinalist1990_2003, pulitzer$dailyCirculation2013)
abline(pulitzerlm2)

# q 7

pulitzerlm3 = lm(PulitzerWinFinalist1990_2003~PulitzerWinFinalist2004_2014,data=pulitzer)
summary(pulitzerlm3)

plot(pulitzer$PulitzerWinFinalist1990_2003, pulitzer$PulitzerWinFinalist2004_2014)
abline(pulitzerlm3)




