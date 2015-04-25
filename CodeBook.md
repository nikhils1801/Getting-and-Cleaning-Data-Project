#Code Book

##Data

The data provided for this assignment was unzipped to the working directory. It contains the "train" and "test" folders each having three files, one with the subject id's (with the prefix "subject"), one with the sensor data (with the prefix "X") and one with the activity id's (with the prefix "y"); and one folder named "Inertial Signals". The activity labels are provided in the "activity_labels" file, in the original unzipped folder. Also present there is the "features" file which contains the column names for the sensor data (column names for the data in files inside "test" and "train" folders with the prefix "X"). The "features_info" file gives a description of all the variable names and how their significance.

The "README" file provided within the original unzipped data contains further information on the significance of the various other files and folders.


##Variables and Transformations on Data

The following variables and its associated transformations are used in the "run_analysis.R" script:

'subject_train', 'x_train', 'y_train', 'subject_test', 'x_test', 'y_test' contain data  from the "subject" (subject id), "X" (sensor data) and "y" (activity id) prefix files in the "train" and "test" folders (by read.table()).

'features' contains data from the "features" file (by read.table()) which holds column names of the sensor data.

'activity' contains the data from the "activity_labels" file (by read.table()). It holds information on the relation between activity id and the physical activity.

'x_traintest', 'y_traintest' and 'subject' contains data merged (by rbind()) from the corresponding "train" and "test", sensor data, activity id and subject id files respectively. In 'y_traintest' the activity id's are substituted by the names of the activity (by sub()). 

'traintest' contains data on mean and standard deviation variables extracted from 'x_traintest' by subseting and selecting only the column names with "mean()" and "std()".

'data' contains data merged (by cbind()) from 'subject', 'y_traintest' and 'traintest' (as required by the end of step 4 of the project assignment).

'groupdata' contains the 'data' variable grouped by its first two columns of "subject" and "activity" (by group_by() in dplyr package).

'tidy_data' summarizes the 'groupdata' to contain mean of each variable for each activity and each subject (by summarise_each() in dplyr package), and this 'tidy data' is then written on a text file by write.table() as output of the script.
