# This scrip is suposed to read diferent files and gather they in only one dataframe


library(dplyr)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName <- "sensordata_files.zip"
directory <- "UCI HAR Dataset"


if(!file.exists(fileName)){
  download.file(url,fileName) 
}

if(!file.exists(directory)){
  unzip("sensordata_files.zip", files = NULL, exdir=".")
}

# Read the files necesssary to tidy

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

x_labels <- read.table("./UCI HAR Dataset/features.txt")[,2] 
x_labels <- as.character(x_labels)
x_labels <- gsub("[()]","",x_labels)
x_labels <- gsub("\\.","-",x_labels)
x_labels <- gsub("\\,","_",x_labels)


activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("cod_activity","activity")



# Combining data sets for test and train and removing unecesssary data

complete_test <- cbind(subject_test,x_test, y_test)
complete_train <- cbind(subject_train,x_train, y_train)
complete_data <- rbind (complete_test, complete_train)

names_completedata <- c("subject", x_labels ,"cod_activity")
names(complete_data) <- names_completedata

selected_x <- grep("mean|std", names_completedata)
dataselected <- complete_data[,c(1,selected_x,563)]

mergeddata <- merge(dataselected,activity_labels,by.x = "cod_activity",
                    by.y = "cod_activity")


write.table(mergeddata,"sensordata.csv", sep = ",", col.names = names(mergeddata) )
print("File 'sensordata.csv' is recorded as a table, use read.table() to load data")
rm(list = ls())

