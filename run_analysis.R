#Week 4
library(dplyr)
library(data.table)


setwd("/Users/michalhron/Desktop/Week 4/")
URL ="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(URL,"archived.zip", method="curl")
file <- unzip("archived.zip")

#Getting vector with names of features
features <- read.table("~/Desktop/Week 4/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
features <- features$V2
features_split <- strsplit(as.character(features),"-")

#Getting vector of boolens to subset by
features_types<- sapply(features_split,function(x) x[2])
features_types_bool <- sapply(features_types, function(x) x%in% c("mean()","std()"))

#Getting a vector of names
features_names <- features[features_types_bool]
features_names<- as.character(features[features_types_bool])

X_train <- read.table("~/Desktop/Week 4/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")[,features_types_bool]
Y_train <- read.table("~/Desktop/Week 4/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
Subject_train <- read.table("~/Desktop/Week 4/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")

X_test <- read.table("~/Desktop/Week 4/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")[,features_types_bool]
Y_test <- read.table("~/Desktop/Week 4/UCI HAR Dataset/test/Y_test.txt", quote="\"", comment.char="")
Subject_test <- read.table("~/Desktop/Week 4/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")

Data <- bind_rows(X_train,X_test)
names(Data) <- features_names

Y <- bind_rows(Y_train,Y_test)

Subjects <- bind_rows(Subject_train,Subject_test)

Data <- bind_cols(Data,Y)
names(Data)[67] <- "activity"

Data <- bind_cols(Data,Subjects)
names(Data)[68] <- "subject"

activity_labels <- read.table("~/Desktop/Week 4/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
activity_labels <- as.character(activity_labels$V2)

for (i in 1:length(activity_labels)){
Data[Data$activity==as.character(i),]$activity <- as.character(activity_labels[i])
}# closing for loop

Tidy_Aggregated <- aggregate(Data[,1:66],list(Data$subject,Data$activity),mean)
write.table(Tidy_Aggregated,"summarized_file.txt")