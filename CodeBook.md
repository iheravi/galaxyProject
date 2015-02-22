The raw data for this data set was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data included activity measurements for a training and a test population of 30 volunteers within the age bracket of 19-48. The 30 individuals were divided into 70% training and 30% test population.
Each person preformed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist.
The following was provided for each record of the dataset:
- Triaxial acceleration from the accleometer (total acceleration) and estimated body acceleration.
- Triaxial Angular velocity from the gyoscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.
For complete information on the data set see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
For this analysis I have only used the time component of the measurements provided in the 561- feature vector.
To obtain the averages the following steps were preformed on the data:
1- For training data: measurement file, subject file, and activity files were read and consolidated into one data frame. The activities were named based on the activity labels provided by authors. Also the features were named according to the feature list provided by authors. 
2- The test data was processed in the same fashion as the training data.
3- The test and training data were consolidated into one table.
4- For the purposes of this exercise only the mean and standard deviation measurements of the time components of the 561-feature data set were averaged for each subject and activity and written into the PersonalActivity.csv file.

The csv file contains the following column headings:
subject: idetifier for the subject   
activity: name of the activity	
avg_tBodyAcc_mean___X : average of the mean of x axis component of the body acceleration
avg_tBodyAcc_mean___Y : average of the mean of y axis component of the body acceleration	
avg_tBodyAcc_mean___Z : average of the mean of z axis component of the body acceleration	
avg_tGravityAcc_mean___X : average of the mean of x axis component of the gravitaional acceleration	
avg_tGravityAcc_mean___Y : average of the mean of y axis component of the gravitaional acceleration    	
avg_tGravityAcc_mean___Z : average of the mean of z axis component of the gravitaional acceleration    	
avg_tBodyAccJerk_mean___X : average of the mean of x axis component of the body jerk acceleration    	
avg_tBodyAccJerk_mean___Y : average of the mean of y axis component of the body jerk acceleration 	
avg_tBodyAccJerk_mean___Z : average of the mean of z axis component of the body jerk acceleration 	
avg_tBodyGyro_mean___X	: average of the mean of x axis component of the body gyration 
avg_tBodyGyro_mean___Y : average of the mean of y axis component of the body gyration 	
avg_tBodyGyro_mean___Z	: average of the mean of z axis component of the body gyration 
avg_tBodyGyroJerk_mean___X : average of the mean of x axis component of the body jerk gyration 	
avg_tBodyGyroJerk_mean___Y : average of the mean of y axis component of the body jerk gyration	
avg_tBodyGyroJerk_mean___Z: average of the mean of z  axis component of the body jerk gyration	
avg_tBodyAccMag_mean__	: average of the mean of the body acceleration
avg_tGravityAccMag_mean__	: average of the mean of the gravitaional acceleration
avg_tBodyAccJerkMag_mean__	: average of the mean of the body jerk acceleration
avg_tBodyGyroMag_mean__	: average of the mean of the body gyration
avg_tBodyGyroJerkMag_mean__	: average of the mean of the body jerk gyration

avg_tBodyAcc_std___X : average of the standare deviation of x axis component of the body acceleration
avg_tBodyAcc_std___Y : average of the standard deviation of y axis component of the body acceleration	
avg_tBodyAcc_std___Z : average of the standard deviation of z axis component of the body acceleration	
avg_tGravityAcc_std___X	: average of the standard deviation of x axis component of the gravitaional acceleration    
avg_tGravityAcc_std___Y	: average of the standard deviation of y axis component of the gravitaional acceleration
avg_tGravityAcc_std___Z	: average of the standard deviation of z axis component of the gravitaional acceleration 
avg_tBodyAccJerk_std___X : average of the standard deviation of x axis component of the body jerk acceleration  	
avg_tBodyAccJerk_std___Y : average of the standard deviation of y axis component of the body jerk acceleration     	
avg_tBodyAccJerk_std___Z : average of the standard deviation of z axis component of the body jerk acceleration	
avg_tBodyGyro_std___X	: average of the standard deviation of x axis component of the body gyration 
avg_tBodyGyro_std___Y	: average of the standard deviation of y axis component of the body gyration
avg_tBodyGyro_std___Z	: average of the standard deviation of z axis component of the body gyration 
avg_tBodyGyroJerk_std___X : average of the standard deviation of x axis component of the body jerk gyration	
avg_tBodyGyroJerk_std___Y : average of the standard deviation of y axis component of the body jerk gyration	
avg_tBodyGyroJerk_std___Z : average of the standard deviation of z  axis component of the body jerk gyration    	
avg_tBodyAccMag_std__	: average of the standard deviation of the body acceleration
avg_tGravityAccMag_std__ : average of the standard deviation of the gravitaional acceleration