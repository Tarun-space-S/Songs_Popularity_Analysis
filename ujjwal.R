#commit
getwd()
setwd("C:/Users/ujjwa/OneDrive/Desktop/r_files")
songs<-read.csv('Songs_dataset.csv')
View(songs)

library(tidyverse)
glimpse(songs)
class(songs$Channel)
#all distinct channels that music is being uploaded to in dataset
unique(songs$Channel)


#linear reg model
ols.lm<-lm(formula = Likes~Loudness,data=songs)
ols.lm
library(ggplot2)
ggplot(songs,aes(x=Loudness,y=Likes))+geom_point()+geom_smooth(method="lm")
#indicates users gravitate towards softer songs
# we can do this for other columns as well


#plotting residuals from our songs
ols.res<-resid(ols.lm)
ols.res
plot(songs$Loudness,ols.res,ylab='Residuals',xlab='Danceability',main='Residual Plot')
plot(fitted(ols.lm),ols.res)
plot(predict(ols.lm),ols.res)

qqnorm(ols.res)
plot(density(ols.res))
summary(songs)

#box plot
#can use any column for x and y
ggplot(songs,aes(x=as.factor(Danceability),y=Loudness))+geom_boxplot()

#pair plots
#overall condensed summ
library("GGally")
ggpairs(songs)
#here we have to increase cardinality thresshold to take in the full dataset
