# Project 


-Getting and tiding data from the data set http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
1.Download the file and unzipped the file.
2. Work with the file and generate to work with the source code.


- The data has 2 variables
1. Data X showing sensor signals and
2. Data Y showing activity type

- The main idea of the code is to merge data X and data Y into creating one data set which shows totals of each activity.

- There would be new generated dataset which will calculate the new mean and standard deviation.

The first instruction was to merges the training and the test sets to create one data set. Use command rbind to combine training and test set.
The second was to extracts only the measurements on the mean and standard deviation for each measurement. Use grep command to get column indexes for variable name contains "mean()" or "std()".
The third was to uses descriptive activity names to name the activities in the data set Convert activity labels to characters and add a new column as factor.
Fourth, ppropriately labels the data set with descriptive variable names. Give the selected descriptive names to variable columns.
And the last one was to tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package.

-This all was done in R





