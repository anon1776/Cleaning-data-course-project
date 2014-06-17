# 1.Merges the training and the test sets to create one data set.
     train_X_train <- read.table("UCI\ HAR\ Dataset\\train\\X_train.txt",header=FALSE)
     train_subject_train <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt",header=FALSE)
     train_y_train <- read.table("UCI\ HAR\ Dataset/train/y_train.txt",header=FALSE)
     train <- cbind(train_X_train,train_subject_train,train_y_train)
     test_X_test <- read.table("UCI\ HAR\ Dataset\\test\\X_test.txt",header=FALSE)
     test_subject_test <- read.table("UCI\ HAR\ Dataset\\test\\subject_test.txt",header=FALSE)
     test_y_test <- read.table("UCI\ HAR\ Dataset/test/y_test.txt",header=FALSE)
     test <- cbind(test_X_test,test_subject_test,test_y_test)
     combined <- rbind(train,test)
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
     
      features <- read.table("UCI\ HAR\ Dataset\\features.txt",sep=" ",header=FALSE)
      features <- as.character(features[,2])
      colnames(combined) <- c(features, "student", "activity")
      dataset1 <- combined[,c(
 "tBodyAcc-mean()-X",
 "tBodyAcc-mean()-Y",
 "tBodyAcc-mean()-Z",
 "tGravityAcc-mean()-X",
 "tGravityAcc-mean()-Y",
 "tGravityAcc-mean()-Z",
 "tBodyAccJerk-mean()-X",
 "tBodyAccJerk-mean()-Y",
 "tBodyAccJerk-mean()-Z",
 "tBodyGyro-mean()-X",
 "tBodyGyro-mean()-Y",
 "tBodyGyro-mean()-Z",
 "tBodyGyroJerk-mean()-X",
 "tBodyGyroJerk-mean()-Y",
 "tBodyGyroJerk-mean()-Z",
 "tBodyAccMag-mean()",
 "tGravityAccMag-mean()",
 "tBodyAccJerkMag-mean()",
 "tBodyGyroMag-mean()",
 "tBodyGyroJerkMag-mean()",
 "fBodyAcc-mean()-X",
 "fBodyAcc-mean()-Y",
 "fBodyAcc-mean()-Z",
 "fBodyAcc-meanFreq()-X",
 "fBodyAcc-meanFreq()-Y",
 "fBodyAcc-meanFreq()-Z",
 "fBodyAccJerk-mean()-X",
 "fBodyAccJerk-mean()-Y",
 "fBodyAccJerk-mean()-Z",
 "fBodyAccJerk-meanFreq()-X",
 "fBodyAccJerk-meanFreq()-Y",
 "fBodyAccJerk-meanFreq()-Z",
 "fBodyGyro-mean()-X",
 "fBodyGyro-mean()-Y",
 "fBodyGyro-mean()-Z",
 "fBodyGyro-meanFreq()-X",
 "fBodyGyro-meanFreq()-Y",
 "fBodyGyro-meanFreq()-Z",
 "fBodyAccMag-mean()",
 "fBodyAccMag-meanFreq()",
 "fBodyBodyAccJerkMag-mean()",
 "fBodyBodyAccJerkMag-meanFreq()",
 "fBodyBodyGyroMag-mean()",
 "fBodyBodyGyroMag-meanFreq()",
 "fBodyBodyGyroJerkMag-mean()",
 "fBodyBodyGyroJerkMag-meanFreq()",
 "tBodyAcc-std()-X",
 "tBodyAcc-std()-Y",
 "tBodyAcc-std()-Z",
 "tGravityAcc-std()-X",
 "tGravityAcc-std()-Y",
 "tGravityAcc-std()-Z",
 "tBodyAccJerk-std()-X",
 "tBodyAccJerk-std()-Y",
 "tBodyAccJerk-std()-Z",
 "tBodyGyro-std()-X",
 "tBodyGyro-std()-Y",
 "tBodyGyro-std()-Z",
 "tBodyGyroJerk-std()-X",
 "tBodyGyroJerk-std()-Y",
 "tBodyGyroJerk-std()-Z",
 "tBodyAccMag-std()",
 "tGravityAccMag-std()",
 "tBodyAccJerkMag-std()",
 "tBodyGyroMag-std()",
 "tBodyGyroJerkMag-std()",
 "fBodyAcc-std()-X",
 "fBodyAcc-std()-Y",
 "fBodyAcc-std()-Z",
 "fBodyAccJerk-std()-X",
 "fBodyAccJerk-std()-Y",
 "fBodyAccJerk-std()-Z",
 "fBodyGyro-std()-X",
 "fBodyGyro-std()-Y",
 "fBodyGyro-std()-Z",
 "fBodyAccMag-std()",
 "fBodyBodyAccJerkMag-std()",
 "fBodyBodyGyroMag-std()",
 "fBodyBodyGyroJerkMag-std()",
		"student","activity")]
# 3.Uses descriptive activity names to name the activities in the data set
    dataset1$activity[dataset1$activity==1] <- "WALKING"
    dataset1$activity[dataset1$activity==2] <- "WALKING_UPSTAIRS"
    dataset1$activity[dataset1$activity==3] <- "WALKING_DOWNSTAIRS"
    dataset1$activity[dataset1$activity==4] <- "SITTING"
    dataset1$activity[dataset1$activity==5] <- "STANDING"
    dataset1$activity[dataset1$activity==6] <- "LAYING"
# 4.Appropriately labels the data set with descriptive variable names. 
#  done already in step 2 to facilitate subsetting
# 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    library(reshape2)
    datamelt <- melt(dataset1, id=c("student","activity"))
    dataset2 <- dcast(datamelt, student + activity ~ variable, mean)
# 6. Export tidy data set to a text file
    write.table(dataset2,file="tidydata2.txt",sep=" ")
