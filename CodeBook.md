## 3. Codebook

This program is suposed to read different files about an experience availabe at UCI repository.

In this experience some user were invited to perform the actions of:
 
 LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
 
While acting the user´s movement were captured by electronic device and a lot of  information from acelerometers, giroscope and other sensors were gathered, the signal from 
them where processed and shared at some text files.

At the site from UCI a lot of usefull information (e.g raw data, signal processing  methodoloy, databook etc) is available, for further information please check: 
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Before you proceed, I really recomend the lecture of the thoughtfulbloke aka David Hood  available at https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
this post shed a lot of ligth to this task in particular, but also brings important tips for cleaning data in genereal. I really recomend this post.

 The required steps to acomplish the task follow:

###
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names.
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Explained the overral in few lines, this scrip is suposed to read diferent files and gather they in only one dataframe,
once this data frame is gather, it must me labeled, some variables will be selected and a tidy data set contained the average of selected variables will be recorded in
a text file.

Is worth to say that, except for the variables subject and activity, the final data set presented is a mean of the previous one pre-calculated.
For simplification and verbosity reduction the term "Mean of" is supressed for every numeric variable. Moreover, the original dataset is normalizes, so for numeric variables the range lays at interval [-1,1].

###
	Variable 1 - Subject, refers to id person using the smartphone during activity.
	Variable 2 - Activity, 6 factors activities:  LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
	Variables 3 to 81 where grouped in category as follow: 

###
	tBodyAcc: Body acceleration
	tGravityAcc: Gravity acceleration
	tBodyAccJerk: Derived of body acceleration
	tBodyGyro: Body angular velocity
	tBodyGyroJerk: Derived of body angular velocity
	tBodyAccMag: Magnitude (Euclidean distance) of body acceleration
	tGravityAccMag: Magnitude (Euclidean distance) of gravity acceleration
	tBodyAccJerkMag: Magnitude  (Euclidean distance) of derived of body acceleration
	tBodyGyroMag: Magnitude of body angular velocity
	tBodyGyroJerkMag: Magnitude of derived of body angular velocity
	fBodyAcc: Frequency of body acceleration
	fBodyAccJerk: Derived of frequency of body acceleration
	fBodyGyro: Frequency of body angular velocity
	fBodyAccMag: Magnitude (Euclidean distance) of frequency of body acceleration
	fBodyBodyAccJerkMag: Magnitude of derived of frequency of body acceleration
	fBodyBodyGyroMag: Magnitude of frequency of body angular velocity
	fBodyBodyGyroJerkMag: Magnitude of derived of frequency of body angular velocity

for further information please check CodeBook.xlxs file at the repository.
