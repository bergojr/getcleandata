# This program is suposed to read different files about an experience availabe at UCI repository.
# In this experience some user were invited to perform the actions of:
# 
# LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
# 
# While acting the user´s movement were captured by electronic device and a lot of
# information from acelerometers, giroscope and other sensors were gathered, the signal from 
# them where processed and shared at some text files.
# At the site from UCI a lot of usefull information (e.g raw data, signal processing 
# methodoloy, databook etc) is available, for further information please check: 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
# Before you proceed, I really recomend the lecture of the thoughtfulbloke aka David Hood
# available at https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
# this post shed a lot of ligth to this task in particular, but also brings important tips
# for cleaning data in genereal. I really recomend this post.

# The required steps to acomplish the task follow:

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Explained the overral in few lines, this scrip is suposed to read diferent files and gather they in only one dataframe,
# once this data frame is gather, it must me labeled, some variables will be selected 
# and a tidy data set contained the average of selected variables will be recorded in
# a text file.

library(dplyr)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName <- "sensordata_files.zip"
directory <- "UCI HAR Dataset"

# Download files if not available

if(!file.exists(fileName)){
  download.file(fileURL,fileName) 
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


activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("cod_activity","activity")


# Task 1 - Combining data sets for test and train 
complete_test <- cbind(subject_test,x_test, y_test)
complete_train <- cbind(subject_train,x_train, y_train)
complete_data <- rbind (complete_test, complete_train)


# Task 4 - the reason I´ve done step 4 before steps 2 and 3 is that I would like to name all
# the variables at data set and not only those selected to this lesson.

x_labels <- read.table("./UCI HAR Dataset/features.txt")[,2] 
x_labels <- as.character(x_labels)
x_labels <- gsub("[()]","",x_labels)

names_completedata <- c("subject", x_labels ,"cod_activity")
names(complete_data) <- names_completedata

#Task 2 - Extracts only the measurements on the mean and standard deviation for each measuremen

selected_x <- grep("mean|std", names_completedata)
dataselected <- complete_data[,c(1,selected_x,563)]

# Task 3 - Uses descriptive activity names to name the activities in the data set

data_subject_activity <- merge(dataselected,activity_labels,by.x = "cod_activity",
                    by.y = "cod_activity") %>%
  select(-cod_activity)

# Task 5 - From the data set in step 4, creates a second, independent tidy data set

grouped_data <- tbl_df(data_subject_activity) %>%
  arrange(subject) %>%
  group_by(subject,activity)

summarized_data <- summarize_all(grouped_data, mean) %>%
        arrange(subject,activity)

write.table(summarized_data,"tidysensordata.txt", row.names = FALSE )
