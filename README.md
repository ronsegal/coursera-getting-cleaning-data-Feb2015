README
======

## Coursera getting and cleaning data course project, Feb 2015

This repository consists of three files:

1. run_analysis.R - an R script to download and transform a raw data set according to project requirements
2. CodeBook.md - which describes the data sets created by run_analysis.R
3. This README.md file

## run_analysis.R

This R script operates upon the data set files obtained from the URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The zipped data linked to from the Getting and Cleaning Data course website represent data collected from the accelerometers from Samsung Galaxy S smartphones. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script transforms the zipped data according to the Coursera requirements provided for the Getting and Cleaning data course project.

The file obtained from the source URL is processed by the R script called run_analysis.R as follows.
 
1.  Downloads unzips the data sets (note that this action is commented out in the script for repeated testing)
2.  Reads the data sets into R
3.  Merges the training and the test sets to create one combined data set.
4.  Extracts only the measurements on the mean and standard deviation for each combination of feature type and calculation type. 
5.  Names the activities in the data set (replaces the activity codes in the first column of the combined data set)
6.  Labels the data set with descriptive variable names (less cryptic than the original data but no other transformations). 
7.  From the data set in step 5, creates an additional tidy data set with the average of each variable for each activity and each subject.  This output a text file called average_by_activity_subject.txt (not in the repository)

**Note** that run_analysis.R uses the plyr library
It should be possible to just run run_analysis.R to fetch and process the data
However **also note** that data download uses wget rather than curl, which may need to be adjusted depending on the operating environment  (the script was developed and tested under Linux)

## CodeBook.md

Provides relevant information about the original raw and transformed data sets.


## README.md

This file




