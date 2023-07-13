#commit
getwd()
setwd("C:/Users/ujjwa/OneDrive/Desktop/r_files")
songs<-read.csv('Songs_dataset.csv')
View(songs)

#regress 3 variable energy,loudness and valence on views
#linear reg model
energy_views<-lm(formula=Views~Energy,data=songs)
summary(energy_views)
library(ggplot2)
ggplot(songs,aes(x=Views,y=Energy))+geom_point()
#indicates users gravitate towards softer songs
loudness_views<-lm(formula=Views~Loudness,data=songs)
summary(loudness_views)
library(ggplot2)
ggplot(songs,aes(x=Views,y=Loudness))+geom_point()

valence_views<-lm(formula=Views~Valence,data=songs)
summary(valence_views)
library(ggplot2)
ggplot(songs,aes(x=Views,y=Valence))+geom_point()



#plotting residuals from our songs
res<-resid(energy_views)
res
plot(fitted(energy_views),res)
plot(predict(ols.lm),ols.res)

qqnorm(res)
plot(density(res))

#box plot
#can use any column for x and y
ggplot(songs,aes(x=as.factor(Energy),y=Views))+geom_boxplot()



