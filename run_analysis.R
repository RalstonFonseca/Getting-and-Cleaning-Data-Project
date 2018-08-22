################################################################################
##              Getting and Cleaning Data Course Project
## Author       : Ralston Fonseca 
## Date         : 21 Aug 2018
## Version      : 1.0
## Description  : This script cleans and tidy's the data collected from the 
##                accelerometers from the Samsung Galaxy S smartphone. 
##                A full description is available in README.md
################################################################################


library(dplyr)

# Download the zip file if not present
zipFileName <- "UCI_HAR_Dataset.zip"
if (!file.exists(zipFileName)) { 
    # download in binary mode
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                  zipFileName, mode = "wb") 
}

# Create directory if not present
unzipdirectory <- "UCI HAR Dataset" 
if (!dir.exists(unzipdirectory)) { 
    unzip(zipFileName) 
} 

# 1) Merge Training and Test Data
trainingData_x <- read.table("UCI HAR Dataset/train/X_train.txt") # dim 7352  561
testData_x <- read.table("UCI HAR Dataset/test/X_test.txt") # dim 2947  561
mergedData_x <- rbind(trainingData_x,testData_x) # dim 10299 561

# 2) Merge Activity Labels
trainingLabel_y <- read.table("UCI HAR Dataset/train/y_train.txt") # dim  7352    1
testLabel_y <- read.table("UCI HAR Dataset/test/y_test.txt") # dim 2947    1
mergedLabel_y <- rbind(trainingLabel_y,testLabel_y) # dim 10299 1

#2) Merge Subject data
trainingSubject <- read.table("UCI HAR Dataset/train/subject_train.txt") # dim  7352    1
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt") # dim 2947    1
mergedSubject <- rbind(trainingSubject,testSubject) # dim 10299 1

# Replace the activity by descriptive names.
#[1] "walking" "walkingupstairs" "walkingdownstairs" "sitting" "standing" "laying"
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
mergedLabel_y[,1] <- activities[mergedLabel_y[,1],2]

# Load the Features
features <- read.table("UCI HAR Dataset/features.txt") # dim 561   2

# remove variables to save memory
rm(trainingData_x,trainingLabel_y,trainingSubject)
rm(testData_x,testLabel_y,testSubject)

# Give proper names to columns of merged variables/ Data
names(mergedSubject) <- "subject"
names(mergedLabel_y) <- "activity"
names(mergedData_x) <- features[,2]

# Extract only the measurements on the mean and standard deviation for each measurement
subsetData <- mergedData_x[,grep("-mean\\(\\)|-std\\(\\)", colnames(mergedData_x))] # 66 columns subsetted

## Tidying Column Names #####
# Remove Special characters ( and )
finalColumnNames <- gsub("\\(|\\)", "", colnames(subsetData))
# Replace abbreviation t with time 
finalColumnNames <- gsub("^t", "time", finalColumnNames)
# Replace abbreviation f with frequency 
finalColumnNames <- gsub("^f", "frequency", finalColumnNames)
# Replace abbreviation Acc with Accelerometer 
finalColumnNames <- gsub("Acc", "Accelerometer", finalColumnNames)
# Replace abbreviation Gyro with Gyroscope 
finalColumnNames <- gsub("Gyro", "Gyroscope", finalColumnNames)
# Replace abbreviation Mag with Magnitude 
finalColumnNames <- gsub("Mag", "Magnitude", finalColumnNames)
# Correct replication of name Body 
finalColumnNames <- gsub("BodyBody", "Body", finalColumnNames)

#Update columns in subset
names(subsetData) <- finalColumnNames

# Create a dataframe with tidy data
tidy_data1 <- cbind(mergedSubject,mergedLabel_y,subsetData) # dim 10299 68
# Create a file tidy_data1.csv on working directory
write.csv(tidy_data1, "tidy_data1.csv", row.names = FALSE, quote = FALSE)

# Create 2nd dataframe with the average of each variable for each activity and each subject
tidy_data2 <- tidy_data1 %>% group_by(subject, activity) %>% summarise_all(mean) #dim 180 68
# Create a file tidy_data2.csv on working directory
write.csv(tidy_data2, "tidy_data2.csv", row.names = FALSE, quote = FALSE)

############################## EOF #############################################

