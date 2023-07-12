getwd()
setwd("D:/CODE/SUMMER/R_data_Analytics/data")
data<-read.csv("Songs_dataset.csv")
summary(data)
str(data)
library(ggplot2)
ggplot(data,aes(x=Loudness,y=Liveness))+geom_point()
ggplot(data,aes(x=Loudness,y=Views))+geom_point()

hello