## Assignment
## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Start by specify your working directory using setwd(). The source data should be downloaded in to the same directory.

#Loading the Train data
trainDataSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainDataLabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainDataSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Loading the test data.
testDataSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
testDataLabels <- read.table("./UCI HAR Dataset/test/y_test.txt") 
testDataSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt") 

#Load feature information 
feature <- read.table("./UCI HAR Dataset/features.txt") 

#Processing (binding) the data sets
DataSubject <- rbind(testDataSubject, trainDataSubject)
names(DataSubject) <- "subject"

DataLabels <- rbind(testDataLabels, trainDataLabels)
names(DataLabels) <- "labels"

DataSet <- rbind(testDataSet, trainDataSet)
names(DataSet) <- feature$V2

data <- cbind(DataSubject, DataLabels, DataSet)

# Extract only the measurements on the mean and standard deviation for each measurement.
subsetDataNames <- feature$V2[grep("mean\\(\\)|std\\(\\)", feature$V2)]
data<-subset(data,select=c("subject", "labels", as.character(subsetDataNames)))

#Load and merge activity data
activity <-read.table("./UCI HAR Dataset/activity_labels.txt", header =FALSE)
names(activity) <- c("id", "activity")
data <- merge(activity, data, by.x="id", by.y="labels")
data <- data[, !(names(data) %in% c("id"))]

#Create the result
tidy_data <- aggregate(data[,3:68],by=list(data$subject,data$activity),FUN=mean)
names (tidy_data) <- c("subject", "activitiy", names(tidy_data[3:68]))
tidy_data <- tidy_data [order(tidy_data$subject), ]

write.table(tidy_data, file="tidy_data.txt", row.names=FALSE);
