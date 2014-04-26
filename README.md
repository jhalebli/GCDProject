README for Getting and Cleaning Data Peer Assessment 
========================================================

This project uses one script, run_analysis.R, to read in the data in the UCI HAR Dataset and perform a summary mean calculation on the means and standard deviation obervations for subject performing activities under the experiment.

Assumptions:

1. The UCI dataset hase been unzipped into a file structure
2. The directory at the top of that files structure "UCI HAR Dataset" is the Working Directory for the script (set at the top of the script)
3. The summary analysis is by subject and activity and as a result contains 6*30 rows (one row for each {subject, activity} tuple) of the means of 66 observations (resulting in a dataset of 180 rows and 68 columns include the two id columns activity and subject)
4. The columns are title with cleaned derivative names of the observation variables from the features.txt file.
5. The dataset is derived from the summary data in the test and train subdirectories only, all relevant "Inertial Signals" data is assumed to have been incorporated in the summary files.

Description of operation:

The script performs the following operations:

1. Sets the the working directory for the script.
2. Loads the plyr and reshape2 libraries in order to make rbind, melt, and cast available to the script
library("plyr", lib.loc="D:/algorepo/R/win-library/3.1")
library("reshape2", lib.loc="D:/algorepo/R/win-library/3.1")
3. Reads in the base labeling
4. Loads the activity axis (y axis) for each of the test and training groups
5. Loads the subject axis (x axis) for each of the test and training groups
6. Reads the feature data for each of the test and training groups 
7. Builds a list of the relevant features ( mean() and std() )
8. Uses that list to cull non relevant features out of the data
9. Attaches the subject and activity axes read earlier into the table
10. Uses rbind to concatenate the rows of the training and the test data (resulting in one table with all the rows of all observations)
11. Reorders the activity and subject columns to the left of the table for readability
12. Replaces the activity code integer with the actual decriptor of the activity from activity_labels.txt
13. Melts the table according to activity and subject
14. Uses the melted table to cast the new table which produces the actual means for the 66 variable grouped by subject and activity
15. Cleans up the original column givie a combined key to the result of activity and subject
16. Cleans up the feature names in the resulting table for better readability.
17. Writes a resultant summary file from the table to the working directory (summary_output.txt) which is space separated with the first row as the header names for the tidy data set.
