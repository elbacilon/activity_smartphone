---
title: "CodeBook"
author: "elbacilon"
date: "Wednesday, April 22, 2015"
output: html_document
---
 
## Project Description
The goal is to prepare tidy data from data collected from the accelerometers from 
the Samsung Galaxy S smartphone
 
##Study design and data processing
 
###Collection of the raw data
Raw data has been colllected from the UC Irvine Machine Learning Repository here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
 
###Notes on the original (raw) data 
Original data come from experiments which have been carried out with a group of 30 volunteers performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz haev been captrued. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
 
For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'X_train.txt': Training set.
- 'y_train.txt': Training labels.
- 'X_test.txt': Test set.
- 'y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
 
##Creating the tidy datafile

###Guide to create the tidy data file
I have consider following principles to create the tidy data set:
- Each column represents a variable or measure or characteristic.
- Each variable is in one column.
- Each observation of the variable is in a different row.

I have performed the following tasks:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with 
the average of each variable for each activity and each subject.

###Cleaning of the data
The script "run_analysis.R" perform following high level cleaning tasks on data:
- keep only mean and std variables
- rename activity value with label
- add column names
- remove dashes, coma and parenthes from column names
- rename column names by adding "mean" after reshapping the data set in step 10

Refer to the README file for more details on the script itself:
[https://github.com/elbacilon/activity_smartphone/blob/master/README.md]()
 
##Description of the variables in the tidy_data.txt file
General description of the file:
 - 180 observations, 88 variables
 - 2 factors variables: 
        - "subject" with 30 levels corresponding to the 30 subjects 
        - "activity" with 6 levels corresponding to: 
                WALKING
                WALKING_UPSTAIRS
                WALKING_DOWNSTAIRS
                SITTING
                STANDING
                LAYING
        - 86 feature variables:
                - each variable is an average of the values collected for the test 
                subject and activity specified in the data row 
                - For each, the value is a numeric normalized and bounded within [-1, 1]

1. mean.tBodyAcc.mean.X - The mean of the body acceleration on the X axis.
2. mean.tBodyAcc.mean.Y - The mean of the body acceleration on the Y axis.
3. mean.tBodyAcc.mean.Z - The mean of the body acceleration on the Z axis.
4. mean.tGravityAcc.mean.X - The mean of the gravity acceleration on the X axis. 
5. mean.tGravityAcc.mean.Y - The mean of the gravity acceleration on the y axis.
6. mean.tGravityAcc.mean.Z - The mean of the gravity acceleration on the z axis.
7. mean.tBodyAccJerk.mean.X - The mean of the body acceleration on the X axis, derived in time to obtain Jerk         signals.
8. mean.tBodyAccJerk.mean.Y - The mean of the body acceleration on the Y axis, derived in time to obtain Jerk signals.
9. mean.tBodyAccJerk.mean.Z - The mean of the body acceleration on the X axis, derived in time to obtain Jerk signals.
10. mean.tBodyGyro.mean.X - The mean of the body gyro on the X axis
11. mean.tBodyGyro.mean.Y - The mean of the body gyro on the Y axis
12. mean.tBodyGyro.mean.Z - The mean of the body gyro on the Z axis
13. mean.tBodyGyroJerk.mean.X - The mean of the body gyro on the X axis, derived in time to obtain Jerk signals.
14. mean.tBodyGyroJerk.mean.Y - The mean of the body gyro on the Y axis, derived in time to obtain Jerk signals.
15. mean.tBodyGyroJerk.mean.Z - The mean of the body gyro on the Z axis, derived in time to obtain Jerk signals.
16. mean.tBodyAccMag.mean - The mean of the body accelration magnitude
17. mean.tGravityAccMag.mean - The mean of the gravity accelration magnitude
18. mean.tBodyAccJerkMag.mean - The mean of the body accelration magnitude, derived in time to obtain Jerk signals.
19. mean.tBodyGyroMag.mean - The mean of the body gyro accelration magnitude
20. mean.tBodyGyroJerkMag.mean - The mean of the body gyro accelration magnitude, derived in time to obtain Jerk signals.
21. mean.fBodyAcc.mean.X - The mean of the body acceleration on the X axis, with a Fast Fourier Transform (FFT) applied.
22. mean.fBodyAcc.mean.Y - The mean of the body acceleration on the Y axis, with a Fast Fourier Transform (FFT) applied.
23. mean.fBodyAcc.mean.Z - The mean of the body acceleration on the Z axis, with a Fast Fourier Transform (FFT) applied.
24. mean.fBodyAcc.meanFreq.X - The mean frequency of the body acceleration on the X axis, with a Fast Fourier Transform (FFT) applied.
25. mean.fBodyAcc.meanFreq.Y - The mean frequency of the body acceleration on the Y axis, with a Fast Fourier Transform (FFT) applied.
26. mean.fBodyAcc.meanFreq.Z _ The mean frequency of the body acceleration on the Z axis, with a Fast Fourier Transform (FFT) applied.
27. mean.fBodyAccJerk.mean.X - The mean of the body acceleration on the X axis, derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
28. mean.fBodyAccJerk.mean.Y - The mean of the body acceleration on the Y axis, derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
29. mean.fBodyAccJerk.mean.Z - The mean of the body acceleration on the Z axis, derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
30. mean.fBodyAccJerk.meanFreq.X- The mean frequency of the body acceleration on the X axis, derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
31. mean.fBodyAccJerk.meanFreq.Y - The mean frequency of the body acceleration on the Y axis, derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
32. mean.fBodyAccJerk.meanFreq.Z - The mean frequency of the body acceleration on the Z axis, derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
33. mean.fBodyGyro.mean.X - The mean of the body gyro on the X axis, with a Fast Fourier Transform (FFT) applied.
34. mean.fBodyGyro.mean.Y - The mean of the body gyro on the Y axis, with a Fast Fourier Transform (FFT) applied.
35. mean.fBodyGyro.mean.Z - The mean of the body gyro on the Z axis, with a Fast Fourier Transform (FFT) applied.
36. mean.fBodyGyro.meanFreq.X  - The mean fequency of the body gyro on the X axis, with a Fast Fourier Transform (FFT) applied.
37. mean.fBodyGyro.meanFreq.Y  - The mean fequency of the body gyro on the Y axis, with a Fast Fourier Transform (FFT) applied.
38. mean.fBodyGyro.meanFreq.Z  - The mean fequency of the body gyro on the Z axis, with a Fast Fourier Transform (FFT) applied.
39. mean.fBodyAccMag.mean  - The mean of the body acceleration magnitude, with a Fast Fourier Transform (FFT) applied.
40. mean.fBodyAccMag.meanFreq - The mean fequency of the body acceleration magnitude, with a Fast Fourier Transform (FFT) applied.
41. mean.fBodyBodyAccJerkMag.mean - The mean of the body accelration magnitude, , derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
42. mean.fBodyBodyAccJerkMag.meanFreq  - The mean fequency of the body accelration magnitude, derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
43. mean.fBodyBodyGyroMag.mean  - The mean of the body gyro magnitude, with a Fast Fourier Transform (FFT) applied.
44. mean.fBodyBodyGyroMag.meanFreq - The mean frequency of the body gyro magnitude, with a Fast Fourier Transform (FFT) applied.
45. mean.fBodyBodyGyroJerkMag.mean - The mean of the body gyro magnitude,  derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
46. mean.fBodyBodyGyroJerkMag.meanFreq - The mean frequency of the body gyro magnitude,  derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
47. mean.angletBodyAccMeangravity - The mean of the body acceleartion magnitude,  derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
48. mean.angletBodyAccJerkMeangravityMean - the mean of angle between body accelration derived in time to obtain Jerk signals and mean gravity with a Fast Fourier Transform (FFT) applied.
49. mean.angletBodyGyroMeangravityMean - the mean of angle between body gyro and mean gravity with a Fast Fourier Transform (FFT) applied.
50. mean.angletBodyGyroJerkMeangravityMean - the mean of angle between body accelration derived in time to obtain Jerk signals and mean gravity with a Fast Fourier Transform (FFT) applied.
51. mean.angleXgravityMean -  The mean of the angular velocity magnitude on the X axis
52. mean.angleYgravityMean -  The mean of the angular velocity magnitude on the Y axis
53. mean.angleZgravityMean -  The mean of the angular velocity magnitude on the Z axis
54. mean.tBodyAcc.std.X - The standard deviation of the body acceleration on the X axis, with a Fast Fourier Transform (FFT) applied.
55. mean.tBodyAcc.std.Y - The standard deviation of the body acceleration on the Y axis, with a Fast Fourier Transform (FFT) applied.
56. mean.tBodyAcc.std.Z - The standard deviation of the body acceleration on the z axis, with a Fast Fourier Transform (FFT) applied.
57. mean.tGravityAcc.std.X - The standard deviation  of the gravity acceleration on the X axis, with a Fast Fourier Transform (FFT) applied.
58. mean.tGravityAcc.std.Y - The standard deviation  of the gravity acceleration on the Y axis, with a Fast Fourier Transform (FFT) applied.
59. mean.tGravityAcc.std.Z - The standard deviation  of the gravity acceleration on the Z axis, with a Fast Fourier Transform (FFT) applied.
60. mean.tBodyAccJerk.std.X - The standard deviation of the body acceleration on the X axis, derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.
61. mean.tBodyAccJerk.std.Y - The standard deviation of the body acceleration on the Y axis, derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.
62. mean.tBodyAccJerk.std.Z - The standard deviation of the body acceleration on the Z axis, derived in time to obtain Jerk signals , with a Fast Fourier Transform (FFT) applied.
63. mean.tBodyGyro.std.X - The standard deviation of the body gyro on the X axis, with a Fast Fourier Transform (FFT) applied.
64. mean.tBodyGyro.std.Y  - The standard deviation of the body gyro on the Y axis, with a Fast Fourier Transform (FFT) applied.
65. mean.tBodyGyro.std.Z  - The standard deviation of the body gyro on the Z axis, with a Fast Fourier Transform (FFT) applied.
66. mean.tBodyGyroJerk.std.X - The standard deviation of the body gyro on the X axis, derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.
67. mean.tBodyGyroJerk.std.Y - The standard deviation of the body gyro on the Y axis, derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.
68. mean.tBodyGyroJerk.std.Z - The standard deviation of the body gyro on the Z axis, derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.
69. mean.tBodyAccMag.std - The standard deviation of the body gravity magntude
70. mean.tGravityAccMag.std - The standard deviation of the gravity acceleration magntude
71. mean.tBodyAccJerkMag.std - The standard deviation of the body acceleration magnitude on the X axis,  derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.
72. mean.tBodyGyroMag.std - The standard deviation of the body gyro magnitude
73. mean.tBodyGyroJerkMag.std - The standard deviation of the body gyro magnitude on the X axis,  derived in time to obtain Jerk signals, with a Fast Fourier Transform (FFT) applied.
74. mean.fBodyAcc.std.X - The standard deviation of the body gyro magnitude on the X axis, with a Fast Fourier Transform (FFT) applied.
75. mean.fBodyAcc.std.Y - The standard deviation of the body gyro magnitude on the Y axis, with a Fast Fourier Transform (FFT) applied.
76. mean.fBodyAcc.std.Z - The standard deviation of the body gyro magnitude on the Z axis, with a Fast Fourier Transform (FFT) applied.
77. mean.fBodyAccJerk.std.X - The standard deviation of the body gyro magnitude on the X axis, derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
78. mean.fBodyAccJerk.std.Y - The standard deviation of the body gyro magnitude on the Y axis, derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
79. mean.fBodyAccJerk.std.Z - The standard deviation of the body gyro magnitude on the Z axis, derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
80. mean.fBodyGyro.std.X - The standard deviation of the body gyro on the Z axis, with a Fast Fourier Transform (FFT) applied.
81. mean.fBodyGyro.std.Y- The standard deviation of the body gyro on the Y axis, with a Fast Fourier Transform (FFT) applied.
82. mean.fBodyGyro.std.Z- The standard deviation of the body gyro on the Z axis, with a Fast Fourier Transform (FFT) applied.
83. mean.fBodyAccMag.std - The standard deviation of the body accelration magnitude, with a Fast Fourier Transform (FFT) applied.
84. mean.fBodyBodyAccJerkMag.std- The standard deviation of the body accelration magnitude, derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
85. mean.fBodyBodyGyroMag.std - The standard deviation of the body gyro  magnitude, with a Fast Fourier Transform (FFT) applied.
86. mean.fBodyBodyGyroJerkMag.std- The standard deviation of the body gyro magnitude, derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.

 
