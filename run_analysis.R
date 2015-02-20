library(plyr)
require(plyr)

setwd('/home/ron/Coursera/GCdata');

########################################################
## Download the data source file and read-in the data 
########################################################

## Download and unzip the dataset source file  - Commented out to avoid downloading when testing
#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl,destfile="Dataset.zip",method="wget") # NB - wget rather than curl on my Linux system 
#unzip(zipfile="Dataset.zip",exdir="./")

## Read dataset files into data frames
featureNames = read.table('UCI HAR Dataset/features.txt',header=FALSE); 
activityLabels = read.table('UCI HAR Dataset/activity_labels.txt',header=FALSE); 

subjectTrainData = read.table('UCI HAR Dataset/train/subject_train.txt',header=FALSE); 
featuresTrainData = read.table('UCI HAR Dataset/train/X_train.txt',header=FALSE);
activityTrainData = read.table('UCI HAR Dataset/train/y_train.txt',header=FALSE);

subjectTestData = read.table('UCI HAR Dataset/test/subject_test.txt',header=FALSE); 
featuresTestData = read.table('UCI HAR Dataset/test/X_test.txt',header=FALSE); 
activityTestData = read.table('UCI HAR Dataset/test/y_test.txt',header=FALSE); 

## Note - Raw Inertial Signals folder data are not used in this project

###################################################################
## 1. Merges the training and the test sets to create one data set.
###################################################################

## Combine the training data
trainingData <- cbind(activityTrainData, subjectTrainData, featuresTrainData)

## Combine the test data
testData <- cbind(activityTestData, subjectTestData, featuresTestData)

## Merge the rows of the two data sets
combinedData <- rbind(trainingData, testData)

## Label the data set columns
colnames(combinedData)<-c("activityId", "subjectIdentifier", as.character(featureNames[,2]))

#############################################################################################
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#############################################################################################

## Retain only mean and standard deviation measurements
combinedData <- combinedData[,grepl("mean|std|activityId|subjectIdentifier", names(combinedData))]    

############################################################################
## 3. Uses descriptive activity names to name the activities in the data set
############################################################################

## Add descriptive activityType names
colnames(activityLabels)<-c("activityId","activityType") # name activityLabel columns
combinedData = merge(combinedData, activityLabels, by='activityId', all.x=TRUE)[,-1]  #add activityType column and remove activityId column               

# Move new activityType column to beginning of data frame and sort - cosmetic adjustment
col_idx <- grep("activityType", names(combinedData))
combinedData <- combinedData[, c(col_idx, (1:ncol(combinedData))[-col_idx])] # move activityType column
rm(col_idx)
combinedData <- combinedData[with(combinedData, order(subjectIdentifier, activityType)),] # sort by subjectIdentifier and activityType
rownames(combinedData)<-NULL # remove row.names

########################################################################
## 4. Appropriately labels the data set with descriptive variable names. 
########################################################################

# Make clearer names
names(combinedData) <- gsub('\\(|\\)',"",names(combinedData)) 
names(combinedData) <- gsub('\\.std',".StandardDeviation",names(combinedData))
names(combinedData) <- gsub('\\-std',"-standardDeviation",names(combinedData))
names(combinedData) <- gsub('\\.mean',".Mean",names(combinedData))
names(combinedData) <- gsub('^f',"frequency.",names(combinedData))
names(combinedData) <- gsub('Gyro',"Gyroscopic",names(combinedData))
names(combinedData) <- gsub('Acc',"Acceleration",names(combinedData))
names(combinedData) <- gsub('Mag',"Magnitude",names(combinedData))
names(combinedData) <- gsub('^t',"time.",names(combinedData))
names(combinedData) <- gsub('meanFreq',"meanFrequency",names(combinedData))
names(combinedData) <- gsub('Freq$',"Frequency",names(combinedData))



##################################################################################################################
##  5. Create a second, independent tidy data set with the average of each variable for each activityType and each subject               
##################################################################################################################

avbyActSubData = ddply(combinedData, c("subjectIdentifier","activityType"), numcolwise(mean))
write.table(avbyActSubData, file = "average_by_activity_subject.txt", row.name=FALSE)


#################################################################################################################


