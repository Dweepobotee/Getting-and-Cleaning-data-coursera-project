# Codebook
The data set for this project comes from the Human Activity Recognition using Smartphones Database from UCI. 
A more detailed description can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The dataset for this particular project comes from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# run_analysis.r script
The R script run_analysis performs the following.
1. Downloads and unzips the required files.
2.a. Reads the training data
2.b. Reads the test data
2.c. Reads the features
2.d. Reads the activity labels
2.e. Assigns the appropriate variable names
3. Merges the datasets to create activitydata
4. Creates a vector with the mean and standard deviation of each measurement and uses this vector to subset the data to create subsetactivitydata
5. Uses descriptive activity names to name the activities in the dataset
6. Appropriately labels the dataset with variable names
7. Creates a second, independent tidy data set with the average of each variable with each activity and each subject.
8. Writing the tidy data set in to a txt file called "tidydata.txt"
