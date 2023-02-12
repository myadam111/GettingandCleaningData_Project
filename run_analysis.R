library(dplyr)
# creating a directory to store the data set if it doesn't exist already
if (!file.exists("project_on_gettingandClenaingdata"))
{
  dir.create("project_on_gettingandClenaingdata")
}
#URL to download the zip file
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#downloading the zip file into the directory
download.file(url, "./project_on_gettingandClenaingdata/proj_dataset.zip")
#unzipping the data set into the current directory
unzip("./project_on_gettingandClenaingdata/proj_dataset.zip")
# reading the training data from the text files
Xtrain_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
Ytrain_data <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train_data <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#reading the test data from the text files
Xtest_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
Ytest_data <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test_data <- read.table("./UCI HAR Dataset/test/subject_test.txt")
#reading features text file
features_data <- read.table("./UCI HAR Dataset/features.txt")
#reading activity labels from text file
activity_data <- read.table("./UCI HAR Dataset/activity_labels.txt")
#renaming the column names with appropriate data
# train data
colnames(activity_data) <- c("activity_Id", "activity_Name")
colnames(subject_train_data) <-"subject_Id"
colnames(Ytrain_data) <- "activity_Id"
colnames(Xtrain_data) <- features_data[,2] 

#test data
colnames(subject_test_data) <-"subject_Id"
colnames(Ytest_data) <- "activity_Id"
colnames(Xtest_data) <- features_data[,2] 

#combining train data into one data set
training_data <- cbind(subject_train_data, Ytrain_data, Xtrain_data  )
#combining test data into one data set
testing_data <- cbind(subject_test_data, Ytest_data, Xtest_data )
# combining both into one big set of data frame
all_data <- rbind(training_data, testing_data)

#extracting mean and standard deviation from the measurements
#extracting column names
extract_colnames <- colnames(all_data)
# getting indices of mean and standard deviation columns
req_col_indices <- c(grep("mean",extract_colnames),grep("std",extract_colnames))
#getting the column names using the indices
req_col_names <- extract_colnames[req_col_indices]
# required data frame of mean and standard deviation data
mean_std_data <- all_data[,c("subject_Id","activity_Id",req_col_names)]

#adding activity names to the data set
mean_std_data$activity_Id[mean_std_data$activity_Id == 1] <- "WALKING"
mean_std_data$activity_Id[mean_std_data$activity_Id == 2]<- "WALKING_UPSTAIRS"
mean_std_data$activity_Id[mean_std_data$activity_Id == 3]<- "WALKING_DOWNSTAIRS"
mean_std_data$activity_Id[mean_std_data$activity_Id == 4]<- "SITTING"
mean_std_data$activity_Id[mean_std_data$activity_Id == 5]<- "STANDING"
mean_std_data$activity_Id[mean_std_data$activity_Id == 6]<- "LAYING"

#changing the variable names where necessary
names(mean_std_data)<-gsub("Acc", "Accelerometer", names(mean_std_data))
names(mean_std_data)<-gsub("Gyro", "Gyroscope", names(mean_std_data))
names(mean_std_data)<-gsub("BodyBody", "Body", names(mean_std_data))
names(mean_std_data)<-gsub("Mag", "Magnitude", names(mean_std_data))
names(mean_std_data)<-gsub("^t", "Time", names(mean_std_data))
names(mean_std_data)<-gsub("^f", "Frequency", names(mean_std_data))
names(mean_std_data)<-gsub("tBody", "TimeBody", names(mean_std_data))
names(mean_std_data)<-gsub("-freq()", "Frequency", names(mean_std_data), ignore.case = TRUE)
names(mean_std_data) <- gsub("BodyBody", "Body", names(mean_std_data))
#creating a new data set data set with the average of each variable for each activity and subject
#ordering the data frame by subject id and activity id
mean_std_data <- mean_std_data[order(mean_std_data$subject_Id,mean_std_data$activity_Id),]
#calculating the average by grouping subject id and activity id
req_dataset2 <- suppressWarnings(aggregate(mean_std_data,by = list(mean_std_data$subject_Id,mean_std_data$activity_Id),function (x) mean(as.numeric(as.character(x)),na.rm=T)))
#selecting required columns 
req_dataset2 <- req_dataset2%>%select(-c(subject_Id,activity_Id))
#renaming the column names in the final data set
colnames(req_dataset2)[which(names(req_dataset2) == "Group.1")] <- "subject_ID"
colnames(req_dataset2)[which(names(req_dataset2) == "Group.2")] <- "activity_ID"
#writing the tidy set into a text file in working directory
write.table(req_dataset2, "tidy_dataset.txt", row.name=FALSE)
unique(req_dataset2$activity_ID)
req_dataset2$`TimeBodyAccelerometer-mean()-X`
