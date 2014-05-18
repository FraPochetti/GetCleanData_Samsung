##Brief Introduction to Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (**WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING**) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it is provided:

1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

2. Triaxial Angular velocity from the gyroscope. 

3. A 561-feature vector with time and frequency domain variables (obtained applying several mathematical operations such as mean(), std(), max(), min() etc on the properly filtered and processed signals detailed in points 1 and 2). 

4. Its activity label (a number from 1 to 6 according to the above cited activities). 

5. An identifier of the subject who carried out the experiment (a number from 1 to 30).

***

##Variables Description

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals **tAcc-XYZ** and **tGyro-XYZ** (as stated in points 1 and 2 of the previous section). 

These time domain signals (prefix 't' to denote time) were originally collected and then properly filtered to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (**tBodyAcc-XYZ** and **tGravityAcc-XYZ**). 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (**tBodyAccJerk-XYZ** and **tBodyGyroJerk-XYZ**). 

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (**tBodyAccMag**, **tGravityAccMag**, **tBodyAccJerkMag**, **tBodyGyroMag**, **tBodyGyroJerkMag**). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing **fBodyAcc-XYZ**, **fBodyAccJerk-XYZ**, **fBodyGyro-XYZ**, **fBodyAccJerkMag**, **fBodyGyroMag**, **fBodyGyroJerkMag**. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. The list of the collected signals is reported below.

1. tBodyAcc-XYZ (3 signals X, Y, Z)


2. tGravityAcc-XYZ (3 signals X, Y, Z)


3. tBodyAccJerk-XYZ (3 signals X, Y, Z)


4. tBodyGyro-XYZ (3 signals X, Y, Z)


5. tBodyGyroJerk-XYZ (3 signals X, Y, Z)


6. fBodyAcc-XYZ (3 signals X, Y, Z)


7. fBodyAccJerk-XYZ (3 signals X, Y, Z)


8. fBodyGyro-XYZ (3 signals X, Y, Z)


9. tBodyAccMag 


10. tGravityAccMag


11. tBodyAccJerkMag


12. tBodyGyroMag


13. tBodyGyroJerkMag


14. fBodyAccMag


15. fBodyAccJerkMag


16. fBodyGyroMag


17. fBodyGyroJerkMag

Several variables were measured from the above signals, leading to a total of 561 features. In particular the focus of this study was mainly on the **mean** and the **standard devation** of the single collected series of signals, meaning that the tidy data set which is provided, is the result of an accurate subsetting of the original one.

The performed analysis, its logic and the details of the passages in order to format a final tidy data set are reported in the following section.

***

##Logic of Data Cleaning and Subsetting

The aim of the sudy was to start from the raw data provided in the original zipped project folder and create a tidy data set with the average of significant variables for each activity and each subject.

As anticipated in the previous section among the 561 features obtained processing the original signals, only the **mean** and the **standard deviation** of each of the available signals were treated. As listed in the section **Variables Description**, there are 17 signals; the first 8 of them wrap 3 directions (X, Y, Z) for a total of 24 different features. This first part sums up to 33 counting the remaining 9 variables in the list (9-17). For each of them the mean and standard deviation has been computed and taken into account for the final dataset. This means that we should expect a total number of selected features equal to 66.

The experiments have been carried out with a group of 30 volunteers. Each person performed 6 activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING). The target of the project is to compute the mean of the 66 selected variables for each subject and activity, meaning that we should expect a 30 X 6 = 180 entries in the final dataset.

To summarize, the output of the cleaning R script (provided in the repo) is a tidy data.frame with 180 rows (30 subject each performing 6 activities) and 68 columns (Subject + Activity + 66 features).

###Brief "run_analysis.R" Script Description

The aim of the sudy was to start from the raw data provided in the original zipped project folder and create a tidy data set with the average of significant variables for each activity and each subject.

As anticipated in the previous section among the 561 features obtained processing the original signals, only the **mean** and the **standard deviation** of each of the available signals were treated. As listed in the section **Variables Description**, there are 17 signals; the first 8 of them wrap 3 directions (X, Y, Z) for a total of 24 different features. This first part sums up to 33 counting the remaining 9 variables in the list (9-17). For each of them the mean and standard deviation has been computed and taken into account for the final dataset. This means that we should expect a total number of selected features equal to 66.

The experiments have been carried out with a group of 30 volunteers. Each person performed 6 activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING). The target of the project is to compute the mean of the 66 selected variables for each subject and activity, meaning that we should expect a 30 X 6 = 180 entries in the final dataset.

To summarize, the output of the cleaning R script (provided in the repo) is a tidy data.frame with 180 rows (30 subject each performing 6 activities) and 68 columns (Subject + Activity + 66 features).

###Brief "run_analysis.R" Script Description

In order to have a properly running script the following steps are mandatory. 

After downloading the material [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), unzip the folder, create a new directory and paste and copy inside it the following files:

-  **run_analysis.R**: script that takes as input the listed text files and returns a text file ('SamsungTidy.txt') with a 180 X 68 data.frame.


- **features.txt**: List of all features.



- **activity_labels.txt**: Links the class labels with their activity name.



- **train/X_train.txt**: Training set.



- **train/y_train.txt**: Training labels.



- **test/X_test.txt**: Test set.



- **test/y_test.txt**: Test labels.


- **train/subject_train.txt**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.


- **test/subject_test.txt**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

The steps of the R script (which is fully commented) are the following:

1. Load the data.

2. Bind the datasets in a unique data.frame (10299 X 563)

3. Select the correct features (the ones containing the substring '-mean()' and '-std()')

4. Subset the data.frame at point 2 according to the features selected at point 3.

5. Reshape the data.frame with melt and dcast passing the mean function as argument and obtaining a tidy dataset with the average of the variables for each activity and each subject (180 X 68).

6. Save the final data.frame.

