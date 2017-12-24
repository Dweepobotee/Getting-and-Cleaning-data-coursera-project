# Codebook
The data set for this project comes from the Human Activity Recognition using Smartphones Database from UCI. 
A more detailed description can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The dataset for this particular project comes from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# run_analysis.r script
The R script run_analysis performs the following.
1. Downloads and unzips the required files.
2. Reads the training data
3. Reads the test data
4. Reads the features
5. Reads the activity labels
6. Assigns the appropriate variable names
7. Merges the datasets to create activitydata
8. Creates a vector with the mean and standard deviation of each measurement and uses this vector to subset the data to create subsetactivitydata
9. Uses descriptive activity names to name the activities in the dataset
10. Appropriately labels the dataset with variable names
11. Creates a second, independent tidy data set with the average of each variable with each activity and each subject.
12. Writing the tidy data set in to a txt file called "tidydata.txt"
