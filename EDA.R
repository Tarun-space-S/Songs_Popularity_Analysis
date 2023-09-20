?read.csv
getwd()# Get the working directory
setwd("D:/CODE/SUMMER/R_data_Analytics/data")# Replace file path with the file path in your system
data<-read.csv("Songs_dataset.csv")
View(data)

nrow(data)
ncol(data)
dim(data)
head(data[, c("Artist","Track","Views")],n=10)
tail(data[, c("Artist","Track","Views")],n=10)
str(data)#structure
summary(data)
data$Album


data[4:30, c("Artist","Track","Views")]
data[c(2,7), c("Artist","Track","Views")]
#check whether the first row of a data is itself a data frame
is.data.frame(data[1,])

data$Energy_Loudness_Ratio <- data$Energy / data$Loudness
head(data[, c("Track","Energy","Loudness","Energy_Loudness_Ratio")],n=10)

data$Energy_Loudness_Ratio<-NULL
head(data[, c("Track","Energy","Loudness","Energy_Loudness_Ratio")],n=10)
head(data[, c("Track","Energy","Loudness")],n=10)


#filtering
library(dplyr)

#display all song tracks that crossed 2 billion views
filter1 <- data %>%
  filter(Views > 2000000000) %>%
  select(Track, Views, Likes,Energy)
filter1

#display Coldplay Track
filter2 <- filter(data, Artist == "Coldplay")
filter2[,c("Track","Album","Energy")]

#display in descending order of Views the Track details of Drake's Her Loss album
filter3 <- filter(data, Artist == "Drake", Album == "Her Loss") %>%
  arrange(desc(Views))
filter3[,c("Artist","Album","Track","Views")]

filter4 <- filter(data, Artist %in% c("Eminem", "Shakira") , Danceability > 0.7)%>%
  arrange(desc(Danceability))
filter4[,c("Artist","Track","Danceability")]

#quick plot
?qplot
library("ggplot2")
qplot(data=filter3,x=Track, y=Views,size=I(3)) + theme(axis.text.x = element_text(angle = 90, hjust = 1))
qplot(data = filter1, x = Track, y = Views, size = I(3),colour="Views",shape=I(2),main="1 BILLION+ VIEWS" ,geom = "boxplot") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

qplot(data = filter4, x = Track, y = Danceability, colour = Likes) + theme(axis.text.x = element_text(angle = 90, hjust = 1))
                                                                    
#ggplot
ggplot(data = filter2, aes(x = Track, y = Energy, colour = Energy, group = 1)) +
  geom_point() +
  geom_line() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#histogram
s<-ggplot(data=filter1,aes(x=Views))
s+geom_histogram(binwidth = 100000000)
s+geom_histogram(binwidth = 100000000,aes(fill="Views"))

s+geom_density()
s+geom_density(aes(fill="Views"))
s+geom_boxplot()

