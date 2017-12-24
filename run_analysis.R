library(dplyr)

## Downloading and unzipping required files
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

## 1. Merging the training and test data sets to create one data set
##Reading training data
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

##Reading test data
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

##Reading features
features <- read.table('./data/UCI HAR Dataset/features.txt')

##Reading activity labels
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

##Creating column names
colnames(x_train)<-features[,2]
colnames(y_train)<-"activityid"
colnames(subject_train)<-"subjectid"
colnames(x_test)<-features[,2]
colnames(y_test)<-"activityid"
colnames(subject_test)<-"subjectid"
colnames(activityLabels)<-c('activityid','activitytype')

## Merging the data sets
activitydata<-rbind(cbind(y_train, subject_train, x_train), cbind(y_test, subject_test, x_test))

##Reading the column names of the merged data
colNames<-colnames(activitydata)

## 2. Extracting only the measurements on the mean and standard deviation of each measurement
##Creating a vector of mean and standard deviation for each measurement
mean_std<-(grepl("activityid", colNames)| grepl("subjectid", colNames)|grepl("mean..", colNames)|grepl("std..", colNames))

##Using the mean_std vector to subset the data
subsetactivitydata<-activitydata[,mean_std==TRUE]

##3. Using descriptive activity names to name the activities in the dataset
newactivitydata<-merge(subsetactivitydata,activityLabels, by='activityid', all.x=TRUE)

##4. The data has already been labelled with the appropriate descriptive variable names in the previous steps

## 5. Creating the tidy dataset
aggactivitydata<-aggregate(.~subjectid+activityid, newactivitydata,mean)
tidydata<-aggactivitydata[order(aggactivitydata$subjectid,aggactivitydata$activityid),]

## Writing the tidy dataset
write.table(tidydata,"tidydata.txt", row.names=FALSE)
