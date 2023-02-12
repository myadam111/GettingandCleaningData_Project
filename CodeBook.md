This is the last project in Getting and Cleaning Data Course.

The project tests the ability to collect, work with and clean the data set which can be later used in the data analysis.

**Information about experimental study design used:**

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

The more details of how the data was collected can be found here [Link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "Link").

The data set for the project is here [Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Data").

**Attribute Information:**

For each record in the data set it is provided:\
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.\
- Triaxial Angular velocity from the gyroscope.\
- A 561-feature vector with time and frequency domain variables.\
- Its activity label.\
- An identifier of the subject who carried out the experiment.

**How to get the Tidy Data text file which id tidy_dataset.txt:**

-Download the data from the link provided.

-Execute the run_analysis.R.

**Variables:**

The clean data has variable names in the first row, it has subject id and activity id followed by 79 measurement values.

[subject(Column 1)]{.underline} : The variable holds integer values between 1 and 30 which represents 30 volunteers who took part in the experimental study.

[activity(Column 2)]{.underline} : It is a character vector which show activities performed by the subjects (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

[Measurement(Column 3 to 81)]{.underline} : Features are normalized and bounded within [-1,1]. The measurements provides triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration along with triaxial angular velocity from the gyroscope. The units used for the accelerations (total and body) are 'g's (gravity of earth -\> 9.80665 m/seg2) and for gyroscope units are rad/seg.The measurements are classified in two domains, time and frequency in X, Y and z directions, and only the mean and standard deviation is extracted in the final clean data set.

Few Examples :

"TimeBodyAccelerometer-mean()-X","TimeBodyAccelerometer-mean()-Y","TimeBodyAccelerometer-mean()-Z"-\>time body acceleration mean in the X, Y and Z directions.

"TimeBodyGyroscopeJerk-mean()-X","TimeBodyGyroscopeJerk-mean()-Y" , "TimeBodyGyroscopeJerk-mean()-Z" -\> time body angular velocity from the gyroscope jerk mean in X,Y and Z directions.

**Transformations:**

-   The training and test sets were merged to create one data set.

-   In the tidy data, only the measurements on the mean and standard deviation are extracted in X,Y and Z directions.

-   Activity Id's were given names(description) of the activities in the data set.

-   Variable names in the data set are given descriptive variable names like

    "Acc" -\>"Accelerometer"

    "Gyro"-\> "Gyroscope"

    "BodyBody"-\> "Body"

    "Mag"-\> "Magnitude"

    "\^t"-\> "Time"

    "\^f"-\> "Frequency"

    "tBody"-\>"TimeBody"

    "-freq()"-\>"Frequency"

    "BodyBody"-\> "Body"

-   The average of each variable for each activity and each subject is calculated which has a total of 180 observations.
