Code Book
========

Data Set Background
-------------------

### Brief Background

The data sets output from this project were based on raw data obtained from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

derived from the original data set:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

from the UCI Machine Learning repository, due to a 2012 study (Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita, Università degli Studi di Genova, Genoa, Italy) of human activity recognition using smartphone sensors. 

The data (Human Activity Recognition Using Smartphones Dataset Version 1.0) was created from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. An accelerometer and gyroscope embedded in each smartphone was used to capture 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. 

The obtained data was randomly partitioned into two sets, where 70% of the volunteers were used for generating training data and 30% test data.

UCI Derived Input Data Set
-------------------------- 

Each data record of 'training' and 'test' datasets provided:
1. An activity label
2. An identifier of the subject who carried out the experiment.
3. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
4. Triaxial Angular velocity from the gyroscope. 
5. A 561-feature vector with time and frequency domain variables.

## Dataset Files

The data was provided in text files(with space delimitation between readings and carriage return linefeed to delimit each record) as follows:

####For both data sets:-
__*activity_labels.txt*__ - activity codes and labels: 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING
__*features.txt*__ - labels for 561 feature variables based on combinations of feature types and calculation types carried out on the data collected for those features.

**feature types:**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

tBodyAcc-XYZ    
tGravityAcc-XYZ    
tBodyAccJerk-XYZ    
tBodyGyro-XYZ    
tBodyGyroJerk-XYZ    
tBodyAccMag    
tGravityAccMag    
tBodyAccJerkMag    
tBodyGyroMag    
tBodyGyroJerkMag    
fBodyAcc-XYZ    
fBodyAccJerk-XYZ    
fBodyGyro-XYZ    
fBodyAccMag    
fBodyAccJerkMag    
fBodyGyroMag    
fBodyGyroJerkMag

Where -XYZ' is used to denote 3-axial signals in the X, Y and Z directions e.g. tBodyAcc-X, tBodyAcc-Y, and tBodyAcc-Z

With the calculations applied to the above feature types and units of measure being: 

mean(): Mean value    
std(): Standard deviation    
mad(): Median absolute deviation     
max(): Largest value in array    
min(): Smallest value in array    
sma(): Signal magnitude area    
energy(): Energy measure. Sum of the squares divided by the number of values.     
iqr(): Interquartile range     
entropy(): Signal entropy    
arCoeff(): Autorregresion coefficients with Burg order equal to 4    
correlation(): correlation coefficient between two signals    
maxInds(): index of the frequency component with largest magnitude    
meanFrequency(): Weighted average of the frequency components to obtain a mean frequency    
skewness(): skewness of the frequency domain signal     
kurtosis(): kurtosis of the frequency domain signal     
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.    
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean    
tBodyAccMean    
tBodyAccJerkMean    
tBodyGyroMean    
tBodyGyroJerkMean

#### For the training data set:-

__*subject_train.txt*__ - numeric subject identifiers for each data record
__*X_train.txt*__ - numeric data for each feature and calculation combination described in features.txt
__*y_train.txt*__ - activity codes for each record
A folder entitled 'Intertial Signals' containing corresponding raw data files which were not used in this project

#### For the test data set:-

__*subject_test.txt*__ - numeric subject identifiers for each data record
__*X_test.txt*__ - numeric data for each feature and calculation combination described in features.txt
__*y_test.txt*__ - activity codes for each record
A folder entitled 'Intertial Signals' containing corresponding raw data files which were not used in this project

Study Data Treatment
--------------------

### Transformations conducted

The project required a number of transformations to be performed on the above data.

The data sets were processed by the R script called run_analysis.R as follows. 
1.  Downloads, unzips and reads the data sets
2.  Merges the training and the test sets to create one combined data set.
3.  Extracts only the measurements on the mean and standard deviation for each combination of feature type and calculation type. 
4.  Names the activities in the data set (replaces the activity codes in the first column of the combined data set)
5.  Labels the data set with descriptive variable names (less cryptic than the original data). 
6.  From the data set in step 4, an additional tidy data set was created with the average of each variable for each activity and each subject.  This was output to a text file: average_by_activity_subject.txt

The data set resulting from treatment 3. comprises 79 combinations of features and mean and standard deviation measurements

**The tidy data set labels applied in 5. are:-**

 activityType = WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING                                       
 subjectIdentifier                                   
 time.BodyAcceleration-mean-XYZ                                          
 time.BodyAcceleration-std-XYZ                                               
 time.GravityAcceleration-mean-XYZ                                        
 time.GravityAcceleration-std-XYZ                                            
 time.BodyAccelerationJerk-mean-XYZ                                        
 time.BodyAccelerationJerk-std-XYZ                                          
 time.BodyGyroscopic-mean-XYZ                                                   
 time.BodyGyroscopic-std-XYZ                                                      
 time.BodyGyroscopicJerk-mean-XYZ                                            
 time.BodyGyroscopicJerk-std-XYZ                                             
 time.BodyAccelerationMagnitude-mean                 
 time.BodyAccelerationMagnitude-std                  
 time.GravityAccelerationMagnitude-mean              
 time.GravityAccelerationMagnitude-std               
 time.BodyAccelerationJerkMagnitude-mean             
 time.BodyAccelerationJerkMagnitude-std              
 time.BodyGyroscopicMagnitude-mean                   
 time.BodyGyroscopicMagnitude-std                    
 time.BodyGyroscopicJerkMagnitude-mean               
 time.BodyGyroscopicJerkMagnitude-std                
 frequency.BodyAcceleration-mean-XYZ                                     
 frequency.BodyAcceleration-std-XYZ                                       
 frequency.BodyAcceleration-meanFrequency-XYZ                              
 frequency.BodyAccelerationJerk-mean-XYZ                           
 frequency.BodyAccelerationJerk-std-XYZ                                
 frequency.BodyAccelerationJerk-meanFrequency-XYZ           
 frequency.BodyAccelerationJerk-meanFrequency-Y           
 frequency.BodyAccelerationJerk-meanFrequency-Z           
 frequency.BodyGyroscopic-mean-XYZ                                         
 frequency.BodyGyroscopic-std-XYZ                                            
 frequency.BodyGyroscopic-meanFrequency-XYZ                                  
 frequency.BodyAccelerationMagnitude-mean            
 frequency.BodyAccelerationMagnitude-std             
 frequency.BodyAccelerationMagnitude-meanFrequency        
 frequency.BodyBodyAccelerationJerkMagnitude-mean    
 frequency.BodyBodyAccelerationJerkMagnitude-std     
 frequency.BodyBodyAccelerationJerkMagnitude-meanFrequency
 frequency.BodyBodyGyroscopicMagnitude-mean          
 frequency.BodyBodyGyroscopicMagnitude-std           
 frequency.BodyBodyGyroscopicMagnitude-meanFrequency      
 frequency.BodyBodyGyroscopicJerkMagnitude-mean      
 frequency.BodyBodyGyroscopicJerkMagnitude-std       
 frequency.BodyBodyGyroscopicJerkMagnitude-meanFrequency 
 
 Where -XYZ' is used to denote 3-axial signals in the X, Y and Z directions e.g. tBodyAcc-X, tBodyAcc-Y, and tBodyAcc-Z


