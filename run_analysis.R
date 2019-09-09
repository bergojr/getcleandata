# This program is suposed to read different files availabe at UCI repository regarding
# an experience were some user were invited to perform some actions like walk, run, lay down
# while they were performing the action their movement were captured by electronic device
# so many information from acelerometers and giroscope were gathered and the signal from 
# them where post processed and shared in for of text files.
# At the site we can find a lot of usefull information (e.g raw data, signal processing 
# methodoloy, databook etc).
# Before you proceed, I really recomend the lecture of the thoughtfulbloke aka David Hood
# available at https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
# this post shed a lot of ligth to this task in particular but also bring important tips
# for cleaning data in genereal. I really recomend this post.

# The required steps to acomplish the task follow:

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Download and unzip files at working directory
library(dplyr)

source("gatherfiles.r")

originaldata <- read.table("sensordata.csv",sep = ",", header = TRUE)

grp_data <- tbl_df(originaldata) %>%
  arrange(subject) %>%
  group_by(subject,activity)
# 
# teste<- ddply(grp_data,.(subject,activity),summarize,mean(tBodyAcc.mean.X))
# teste2<- ddply(grp_data,.(subject,activity),summarize,mean(grp_data$tBodyAcc.mean.X))


summarized_data <- summarize_all(grp_data, mean) %>%
        arrange(subject,activity)

write.table(mergeddata,"sensordata.csv", sep = ",", col.names = names(mergeddata) )
