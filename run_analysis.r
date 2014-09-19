#Check working directory contains correct files
dir()

#Include needed libraries
library(dplyr)

#Load all data
subject_train<-read.table("./train/subject_train.txt")
X_train<-read.table("./train/X_train.txt",header=FALSE,stringsAsFactors=FALSE)
y_train<-read.table("./train/y_train.txt")
subject_test<-read.table("./test/subject_test.txt")
X_test<-read.table("./test/X_test.txt",header=FALSE,stringsAsFactors=FALSE)
y_test<-read.table("./test/y_test.txt")
features<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")

#Assign column headers
colnames(X_train)<-features$V2
colnames(X_test)<-features$V2
colnames(y_train)<-"Activity"
colnames(y_test)<-"Activity"
colnames(subject_test)<-"Subject"
colnames(subject_train)<-"Subject"

#merge data set
train<-cbind(X_train,y_train,subject_train)
test<-cbind(X_test,y_test,subject_test)
mergedData<-rbind(train,test)

#Select relevant columns (mean, std, activity and subject)
selectedData<-select(mergedData,contains("Mean"),contains("std"),Activity,Subject)

#Label the activities
selectedData$ActivityLabels<-factor(selectedData$Activity,levels=activity_labels$V1,labels=activity_labels$V2)

#Calculate mean of each column per activity per subject
outData<-aggregate(selectedData,by=list(Activity,Subject),FUN=mean,na.rm=TRUE)

#write output file
write.table(outData,file="tidyFile.txt",row.name=FALSE);
