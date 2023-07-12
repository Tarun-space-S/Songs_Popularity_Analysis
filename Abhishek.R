?read.csv
getwd()
setwd("c:\\Users\\abhis\\OneDrive\\Documents\\summerCourse\\project\\")
songstats<-read.csv("Songs_dataset.csv")

nrow(songstats)
ncol(songstats)
dim(songstats)
head(songstats[, c("Artist","Track","Views")],n=10)
tail(songstats[, c("Artist","Track","Views")],n=10)
str(songstats)#structure
summary(songstats)
songstats$Album
levels(songstats$Track)

songstats[4:30, c("Artist","Track","Views")]
songstats[c(2,7), c("Artist","Track","Views")]
#check whether the first row of a songstats is itself a data frame
is.data.frame(songstats[1,])

songstats$Energy_Loudness_Ratio <- songstats$Energy / songstats$Loudness
head(songstats[, c("Track","Energy","Loudness","Energy_Loudness_Ratio")],n=10)

songstats$Energy_Loudness_Ratio<-NULL
head(songstats[, c("Track","Energy","Loudness","Energy_Loudness_Ratio")],n=10)
head(songstats[, c("Track","Energy","Loudness")],n=10)

#filtering
#display all song tracks that crossed 1 billion views
filter1<-songstats$Views>1000000000
oneBsongs<-songstats[filter1,c("Track","Views")]
oneBnum<-sum(complete.cases(oneBsongs[,"Views"]))
oneBsongs[1:oneBnum,c("Track","Views")]

#display dataframe where income group is Low income
filter2<-songstats$Artist=="Coldplay"
songstats[filter2,"Track"]
