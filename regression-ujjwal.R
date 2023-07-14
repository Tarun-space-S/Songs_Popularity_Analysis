#commit
getwd()
#setwd("C:/Users/ujjwa/OneDrive/Desktop/r_files")
setwd("D:/CODE/SUMMER/R_data_Analytics/data")
songs<-read.csv('spotify_songs.csv')
View(songs)


#regress 5 variables energy,loudness,valence,playlist genre and subgenre on views or track popularity
popularity_fit_energy <- lm(formula = track_popularity ~ energy,data =songs)
plot(songs$energy,songs$track_popularity)
library(ggplot2)
ggplot(songs,aes(x=track_popularity,y=energy))+geom_point()
summary(popularity_fit_energy)

popularity_fit_loudness<-lm(formula = track_popularity ~loudness, data = songs)
#plot(songs$loudness,songs$track_popularity)
#abline(popularity_fit_loudness)
summary(popularity_fit_loudness)
library(ggplot2)
ggplot(songs,aes(x=track_popularity,y=loudness))+geom_point()

popularity_fit_valence <- lm(formula = track_popularity ~ valence,data =songs)
#plot(songs$valence,songs$track_popularity)
library(ggplot2)
ggplot(songs,aes(x=track_popularity,y=valence))+geom_point()
summary(popularity_fit_valence)

#using playlist genre
genre_fit <- lm(track_popularity ~ playlist_genre, data = songs)
summary(genre_fit)
ggplot(songs,aes(x=track_popularity,y=playlist_genre))+geom_boxplot()

#using playlist genre#highest influence
subgenre_fit <- lm(track_popularity ~ playlist_subgenre, data = songs)
summary(subgenre_fit)
ggplot(songs,aes(x=track_popularity,y=playlist_subgenre))+geom_boxplot()#visualising
#post-teen pop results in highest popularity

library(tidyverse)

songs %>% 
  filter(playlist_subgenre == 'post-teen pop') %>% 
  summary()


# Variable	        Q1	   Mean	  Median	 Q3
#-------------------------------------------------
# track_popularity 	49	   60	    67	     77
# energy	          0.59   0.71	  0.73	   0.84
# loudness	       -6.6	  -5.8	 -5.3	    -4.2
# valence	          0.39	 0.55	  0.55     0.72




