In the getting and cleaning data course project, the data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone is given to extract the tidy data based on the specifications.

The Repo consists of four files:

1.  The tidy data text file.

2.  Actual run analysis r code used to get tidy data from the given data set.

3.  Code book which explains the meta data of the variables in the final project.

4.  Readme file to give the exact steps of how the script works.

The tidy_dataset.txt is the final product of the project.

The CodeBook.md file explains where the origin of the data is from , how to get the tidy data using the script, metadata about the variables and transformations used to get the required format of the data.

run_analysis.R is the R code which imports the data and unzips it into the working directory and performs the following steps to attain the required results:

1.  Merges the training and the test sets to create one data set.

2.  Extracts only the measurements on the mean and standard deviation for each measurement.

3.  Uses descriptive activity names to name the activities in the data set

4.  Appropriately labels the data set with descriptive variable names.

5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
