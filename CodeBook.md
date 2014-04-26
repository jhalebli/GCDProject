Code Book for Getting and Cleaning Data Peer Assessment 
========================================================

We assume that the files have been downloaded and extracted to a local directory. The working directory of the script should be set to the 'UCI HAR Dataset' directory in the unzipped extracted file directory as it assumes the existence of the train and test subdirs directly in its working directory.

Code Book
---------
We specifically ignore meanFreq() variables and are using mean() and std() features only. Inertial signal data is not used, only the summary data available in the source dataset.  Since only aggregates of averages/means are computed, the units of all resultant features in the observation remain unchanged from the features described in the original dataset.  All activity codes in the original dataset have been converted using the activity_labels.txt file into directly readable activity names in the result dataset.

The first two variables are id/key variables and have no specific units.

### subject                   
The subject id of the subject performing the activity.
### activity                  
The type of activity being performed by the subject.

For the purposes of this analysis, the following variable names were derived from the features described in the features_info.txt file in the "UCI HAR Dataset" directory in the source dataset. the "-" characters in each variable name have been replaced with "." characters, and the "()" string has been removed.

The first tuple in each name is the base measurement (without axis) designator.  This maps directly back to the source feature names.  The second tuple denotes whether or not the original feature was a mean measurement "mean()" or a standard deviation measurement "std()".  The final optional tuple decribes the axis in which that feature was measured.  Those features which were total magnitude-only observations lack an axis tuple.

All variables denoted the value of the average (mean) of the set of measurement taken for a specific subject performing a specific activity.  All units for these variables are unchanged from the sources dataset's description.

### tBodyAcc.mean.X           
### tBodyAcc.mean.Y          
### tBodyAcc.mean.Z           
### tBodyAcc.std.X            
### tBodyAcc.std.Y            
### tBodyAcc.std.Z           
### tGravityAcc.mean.X        
### tGravityAcc.mean.Y        
### tGravityAcc.mean.Z        
### tGravityAcc.std.X        
### tGravityAcc.std.Y         
### tGravityAcc.std.Z         
### tBodyAccJerk.mean.X       
### tBodyAccJerk.mean.Y      
### tBodyAccJerk.mean.Z       
### tBodyAccJerk.std.X        
### tBodyAccJerk.std.Y        
### tBodyAccJerk.std.Z       
### tBodyGyro.mean.X          
### tBodyGyro.mean.Y          
### tBodyGyro.mean.Z          
### tBodyGyro.std.X          
### tBodyGyro.std.Y           
### tBodyGyro.std.Z           
### tBodyGyroJerk.mean.X      
### tBodyGyroJerk.mean.Y     
### tBodyGyroJerk.mean.Z      
### tBodyGyroJerk.std.X       
### tBodyGyroJerk.std.Y       
### tBodyGyroJerk.std.Z      
### tBodyAccMag.mean          
### tBodyAccMag.std           
### tGravityAccMag.mean       
### tGravityAccMag.std       
### tBodyAccJerkMag.mean      
### tBodyAccJerkMag.std       
### tBodyGyroMag.mean         
### tBodyGyroMag.std         
### tBodyGyroJerkMag.mean     
### tBodyGyroJerkMag.std      
### fBodyAcc.mean.X           
### fBodyAcc.mean.Y          
### fBodyAcc.mean.Z           
### fBodyAcc.std.X            
### fBodyAcc.std.Y            
### fBodyAcc.std.Z           
### fBodyAccJerk.mean.X       
### fBodyAccJerk.mean.Y       
### fBodyAccJerk.mean.Z       
### fBodyAccJerk.std.X       
### fBodyAccJerk.std.Y        
### fBodyAccJerk.std.Z        
### fBodyGyro.mean.X          
### fBodyGyro.mean.Y         
### fBodyGyro.mean.Z          
### fBodyGyro.std.X           
### fBodyGyro.std.Y           
### fBodyGyro.std.Z          
### fBodyAccMag.mean          
### fBodyAccMag.std           
### fBodyBodyAccJerkMag.mean  
### fBodyBodyAccJerkMag.std  
### fBodyBodyGyroMag.mean     
### fBodyBodyGyroMag.std      
### fBodyBodyGyroJerkMag.mean 
### fBodyBodyGyroJerkMag.std 


Study Design
------------

The study uses summary data from the project described fully at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip for both testing and training subjects performing six activities.  The original 561 features in each observation are culled to the mean and standard deviation features only, and then means (averages) are computed, one for each combination of unique combination of subject and activity (tuple {subject, activity} in the resulting tidy dataset).  The data is collected through download of the zipped dataset at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .