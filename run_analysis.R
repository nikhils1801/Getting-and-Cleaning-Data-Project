
#loading the train data
subject_train<-read.table(".//UCI HAR Dataset//train//subject_train.txt")
x_train<-read.table(".//UCI HAR Dataset//train//X_train.txt")
y_train<-read.table(".//UCI HAR Dataset//train//y_train.txt")

#loading the test data
subject_test<-read.table(".//UCI HAR Dataset//test//subject_test.txt")
x_test<-read.table(".//UCI HAR Dataset//test//X_test.txt")
y_test<-read.table(".//UCI HAR Dataset//test//y_test.txt")

#loading the feature names
features<-read.table(".//UCI HAR Dataset//features.txt")

#loading the activity labels
activity<-read.table(".//UCI HAR Dataset//activity_labels.txt")

#merging train and test features data
x_traintest<-rbind(x_train,x_test)

#assigning column names to merged features data
names(x_traintest)<-features[,2]

#extracting only measurements on mean and standard deviation
traintest<-x_traintest[,grep("mean()|std()",names(x_traintest))]

#merging train and test activity numbers and assigning activity labels
y_traintest<-rbind(y_train,y_test)
label<-as.character(activity[,2])
for(i in 1:nrow(activity)){
  y_traintest<-sub(i,label[i],y_traintest[,1])
  y_traintest<-as.data.frame(y_traintest)
}
names(y_traintest)<-"activity"

#merging subject train and test subject data
subject<-rbind(subject_train,subject_test)
names(subject)<-"subject"

#merging subject, activity and measurement data
data<-cbind(subject,y_traintest,traintest)

#creating tidy data set with average of each variable for each activity and each subject
library(dplyr)
groupdata<-group_by(data,subject,activity)
tidy_data<-summarise_each(groupdata,funs(mean))
write.table(tidy_data,"tidy_data.txt",row.name=FALSE)