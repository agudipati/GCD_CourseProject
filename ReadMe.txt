========================================
How run_analysis.R runs
========================================

Project: This R file is related to wearable measurements related to a study. This tidies the data and provides the meaningful names

Background: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Assumptions:
Zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip has been unzipped in the working directory

Task 1:
--------------
Reads all the data sets from train and test and meges the data using data frames, subsetting and merging techniques

Task 2:
--------------
Collects mean and standard vaiables using 

Task 3:
--------------
Reads the variable names from functions.txt file and assigns to data frame

Task 4:
--------------

Added the descriptive/valid variable names using make.names() function

Task 5:
--------------
Adds Subject and Activity to the final tidy data set
