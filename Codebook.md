Motiviation
-----------
The full details of the course project requirments can be found on the website. How the data was combined and transformed to meet these requiremnts is described below.

Raw data
--------
- Two data sets, <code>test</code> and <code>train</code>.
  - Each includes a list of subject ids, a list of activities performed by those subjects (stored as integers) and a table of measurements derived from raw data. The raw data is also included, but was not considered in this analysis as it had already been processed.
  
- Labels for the derived measurements and for the activities.

Transformation
--------------
The two data sets were combined. First, the respective tables of measurements were combined vertically, as were the lists of activities and the lists of subject ids. The activity labels were used to convert the activities to factors. The column headings of the measurements were then labelled, with parentheses and whitespace removed and commas converted to dashes. The three data frames produced were then combined horizontally to produce a single, tidy data frame.

This data frame was converted to a <code>dplyr</code> data table and reduced by removing those columns that did not report the mean or standard deviation of measurements in the time and frequency domain. A typographic error that had duplicated the word 'Body' in several names was corrected. This left the following variables:

- Activity
- Subject
- tBodyAcc.mean.X
- tBodyAcc.mean.Y
- tBodyAcc.mean.Z
- tGravityAcc.mean.X
- tGravityAcc.mean.Y
- tGravityAcc.mean.Z
- tBodyAccJerk.mean.X
- tBodyAccJerk.mean.Y
- tBodyAccJerk.mean.Z
- tBodyGyro.mean.X
- tBodyGyro.mean.Y
- tBodyGyro.mean.Z
- tBodyGyroJerk.mean.X
- tBodyGyroJerk.mean.Y
- tBodyGyroJerk.mean.Z
- tBodyAccMag.mean
- tGravityAccMag.mean
- tBodyAccJerkMag.mean
- tBodyGyroMag.mean
- tBodyGyroJerkMag.mean
- fBodyAcc.mean.X
- fBodyAcc.mean.Y
- fBodyAcc.mean.Z
- fBodyAccJerk.mean.X
- fBodyAccJerk.mean.Y
- fBodyAccJerk.mean.Z
- fBodyGyro.mean.X
- fBodyGyro.mean.Y
- fBodyGyro.mean.Z
- fBodyAccMag.mean
- fBodyAccJerkMag.mean
- fBodyGyroMag.mean
- fBodyGyroJerkMag.mean
- tBodyAcc.std.X
- tBodyAcc.std.Y
- tBodyAcc.std.Z
- tGravityAcc.std.X
- tGravityAcc.std.Y
- tGravityAcc.std.Z
- tBodyAccJerk.std.X
- tBodyAccJerk.std.Y
- tBodyAccJerk.std.Z
- tBodyGyro.std.X
- tBodyGyro.std.Y
- tBodyGyro.std.Z
- tBodyGyroJerk.std.X
- tBodyGyroJerk.std.Y
- tBodyGyroJerk.std.Z
- tBodyAccMag.std
- tGravityAccMag.std
- tBodyAccJerkMag.std
- tBodyGyroMag.std
- tBodyGyroJerkMag.std
- fBodyAcc.std.X
- fBodyAcc.std.Y
- fBodyAcc.std.Z
- fBodyAccJerk.std.X
- fBodyAccJerk.std.Y
- fBodyAccJerk.std.Z
- fBodyGyro.std.X
- fBodyGyro.std.Y
- fBodyGyro.std.Z
- fBodyAccMag.std
- fBodyAccJerkMag.std
- fBodyGyroMag.std
- fBodyGyroJerkMag.std

After ordering the data table by activity and subject, it was summarised by calculating the mean for each measurment.
