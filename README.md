# 1. Intro

This program is suposed to read different files about an experience availabe at UCI repository.
In this experience some user were invited to perform the actions of:
 
LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
 
While acting the user´s movement were captured using smartphone and a lot of information from acelerometers, giroscope and other sensors
of this smart phone were gathered, the signal where processed and shared at some text files.
At the site from UCI a lot of usefull information (e.g raw data, signal processing # methodoloy, databook etc) is available, for further
information please check: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Before you go further, I really recomend the lecture of the thoughtfulbloke aka David Hood # available at 

https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

this post shed a lot of ligth to these task in particular, but also brings important tips# for cleaning data in genereal. 

I really recomend this post.

# 2. Script

The scritp first download the zipped datasets and unzip then in folders as follow:

 UCI HAR Dataset
 		test
 		train

The main files that will compose the data frame are:
###
 	subject_test.txt    	---------	(2.947 samples of 1 variables)
	X_test.txt 		---------	(2.947 samples of 561 variables)
	y_test.txt 		---------	(2.947 samples of 1 variables)
	subject_train.txt   	---------	(7.352 samples of 1 variable)
	X_train.txt 		---------	(7.352 samples of 561 variables)
	y_train.txt 		---------	(7.352 samples of 1 variable)

When arranged will be generate a data frame composed by 10.299 samples of 563 variables.

As per request only the variables of mean and standard deviation (std) should be selected, this result in a new dataframe of 10.299 samples with 81, 79 of those are variables, 1 is subject and 1 is activity.

It is requested to name the colunms propoerly. The UCI data set is very well explained trhough files:
###
	features.txt
	features_info.txt
	README.txt

Since they are descritive enough I decided to let them as the label for the final data set. The final result is a "mean of..." each variable but to avoid a verbose label such information is supressed at data label an explained at databook

The final task for this script is calculate the mean of each variable grouped by subject and activity resulting in a final dataframe of 180 samples that is recorded in a text file as a data table.

# 3. Data book


