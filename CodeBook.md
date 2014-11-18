## Getting and cleaning data course project ##

### Introduction###

The variables for this project were based on the data set in [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

####Dataset's Original Feature Description####

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
	
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

The set of variables that were estimated from these signals are: 

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
	meanFreq(): Weighted average of the frequency components to obtain a mean frequency
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


### Transformations ###

The following transformations took place.

- Merge of the training and the test sets to create one data set. **test/X_test.txt, test/y_test.txt, test/subject_test.txt, train/X_train.txt, train/y_train.txt, train/subject_train.txt**
- Extracted only the measurements on the mean and standard deviation for each measurement. 
- Used the labels from **activity_labels.txt** to for activity names
- Transformed **features.txt**  to descriptive variable names. (see the next paragraph)
- Summarized the data set by subject and activity taking the average of each variable.

Descriptive Name Transformation was realized using the following pattern matching described below. We choose to capitalize the first letter of each word to improve readability.

	"Acc"-> "Accelerometer"
	"Gyro"-> "Gyroscope"
	"Mag"-> "Magnitude"
	"-mean()"-> "Mean"
	"-std()"-> "StandardDeviation"
	"-X"-> "AxisX"
	"-Y"-> "AxisY"
	"-Z"-> "AxisZ"
	"tBody"-> "TimeDomainBody"
	"tGravity"-> "TimeDomainGravity"
	"fBody"-> "FrequencyDomainBody"
	"fGravity"-> "FrequencyDomainGravity"
	"BodyBody"-> "Body"

	In the final step the prefix "MeanBySubjectByActivity" was added to indicate taking the average over subject & activity. 

### Variables ###

####Variable list####

	Subject
	Activity
	MeanBySubjectByActivityTimeDomainBodyAccelerometerMeanAxisX
	MeanBySubjectByActivityTimeDomainBodyAccelerometerMeanAxisY
	MeanBySubjectByActivityTimeDomainBodyAccelerometerMeanAxisZ
	MeanBySubjectByActivityTimeDomainBodyAccelerometerStandardDeviationAxisX
	MeanBySubjectByActivityTimeDomainBodyAccelerometerStandardDeviationAxisY
	MeanBySubjectByActivityTimeDomainBodyAccelerometerStandardDeviationAxisZ
	MeanBySubjectByActivityTimeDomainGravityAccelerometerMeanAxisX
	MeanBySubjectByActivityTimeDomainGravityAccelerometerMeanAxisY
	MeanBySubjectByActivityTimeDomainGravityAccelerometerMeanAxisZ
	MeanBySubjectByActivityTimeDomainGravityAccelerometerStandardDeviationAxisX
	MeanBySubjectByActivityTimeDomainGravityAccelerometerStandardDeviationAxisY
	MeanBySubjectByActivityTimeDomainGravityAccelerometerStandardDeviationAxisZ
	MeanBySubjectByActivityTimeDomainBodyAccelerometerJerkMeanAxisX
	MeanBySubjectByActivityTimeDomainBodyAccelerometerJerkMeanAxisY
	MeanBySubjectByActivityTimeDomainBodyAccelerometerJerkMeanAxisZ
	MeanBySubjectByActivityTimeDomainBodyAccelerometerJerkStandardDeviationAxisX
	MeanBySubjectByActivityTimeDomainBodyAccelerometerJerkStandardDeviationAxisY
	MeanBySubjectByActivityTimeDomainBodyAccelerometerJerkStandardDeviationAxisZ
	MeanBySubjectByActivityTimeDomainBodyGyroscopeMeanAxisX
	MeanBySubjectByActivityTimeDomainBodyGyroscopeMeanAxisY
	MeanBySubjectByActivityTimeDomainBodyGyroscopeMeanAxisZ
	MeanBySubjectByActivityTimeDomainBodyGyroscopeStandardDeviationAxisX
	MeanBySubjectByActivityTimeDomainBodyGyroscopeStandardDeviationAxisY
	MeanBySubjectByActivityTimeDomainBodyGyroscopeStandardDeviationAxisZ
	MeanBySubjectByActivityTimeDomainBodyGyroscopeJerkMeanAxisX
	MeanBySubjectByActivityTimeDomainBodyGyroscopeJerkMeanAxisY
	MeanBySubjectByActivityTimeDomainBodyGyroscopeJerkMeanAxisZ
	MeanBySubjectByActivityTimeDomainBodyGyroscopeJerkStandardDeviationAxisX
	MeanBySubjectByActivityTimeDomainBodyGyroscopeJerkStandardDeviationAxisY
	MeanBySubjectByActivityTimeDomainBodyGyroscopeJerkStandardDeviationAxisZ
	MeanBySubjectByActivityTimeDomainBodyAccelerometerMagnitudeMean
	MeanBySubjectByActivityTimeDomainBodyAccelerometerMagnitudeStandardDeviation
	MeanBySubjectByActivityTimeDomainGravityAccelerometerMagnitudeMean
	MeanBySubjectByActivityTimeDomainGravityAccelerometerMagnitudeStandardDeviation
	MeanBySubjectByActivityTimeDomainBodyAccelerometerJerkMagnitudeMean
	MeanBySubjectByActivityTimeDomainBodyAccelerometerJerkMagnitudeStandardDeviation
	MeanBySubjectByActivityTimeDomainBodyGyroscopeMagnitudeMean
	MeanBySubjectByActivityTimeDomainBodyGyroscopeMagnitudeStandardDeviation
	MeanBySubjectByActivityTimeDomainBodyGyroscopeJerkMagnitudeMean
	MeanBySubjectByActivityTimeDomainBodyGyroscopeJerkMagnitudeStandardDeviation
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerMeanAxisX
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerMeanAxisY
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerMeanAxisZ
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerStandardDeviationAxisX
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerStandardDeviationAxisY
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerStandardDeviationAxisZ
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerJerkMeanAxisX
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerJerkMeanAxisY
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerJerkMeanAxisZ
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerJerkStandardDeviationAxisX
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerJerkStandardDeviationAxisY
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerJerkStandardDeviationAxisZ
	MeanBySubjectByActivityFrequencyDomainBodyGyroscopeMeanAxisX
	MeanBySubjectByActivityFrequencyDomainBodyGyroscopeMeanAxisY
	MeanBySubjectByActivityFrequencyDomainBodyGyroscopeMeanAxisZ
	MeanBySubjectByActivityFrequencyDomainBodyGyroscopeStandardDeviationAxisX
	MeanBySubjectByActivityFrequencyDomainBodyGyroscopeStandardDeviationAxisY
	MeanBySubjectByActivityFrequencyDomainBodyGyroscopeStandardDeviationAxisZ
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerMagnitudeMean
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerMagnitudeStandardDeviation
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerJerkMagnitudeMean
	MeanBySubjectByActivityFrequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation
	MeanBySubjectByActivityFrequencyDomainBodyGyroscopeMagnitudeMean
	MeanBySubjectByActivityFrequencyDomainBodyGyroscopeMagnitudeStandardDeviation
	MeanBySubjectByActivityFrequencyDomainBodyGyroscopeJerkMagnitudeMean
	MeanBySubjectByActivityFrequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation

####Variable Description & Unit####

	
	Subject - Subject identifier - Unit: 1 to 30
	Activity - Activity label - Unit: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
	Others - see above - Unit: numerical
