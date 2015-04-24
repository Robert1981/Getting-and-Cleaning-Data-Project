# Getting and Cleaning Data
Course Project
April 24, 2015


## The goal with this project 
The goal is to prepare tidy data that can be used for later analysis.


## This file explains how the script works  
1. You need to download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ("UCI HAR Dataset") and unzip the data into the same directory as the file run_analysis.R -> "Your project folder".
2. Set your project folder as your working directory using the setwd() function in RStudio.
3. Run the file "run_analysis.R" using source("run_analysis.R")
4. The script till generate the result tidy_data.txt


## Assignment
You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.