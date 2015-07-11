##Read Dataset Online
onlineFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(onlineFile, "C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI-HAR-dataset.zip", method="auto")
setwd("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data");
unzip("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI-HAR-dataset.zip")

# 1. Merges the training and the test sets to create one data set.
features <- read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/features.txt")
test.x <- read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/test/X_test.txt", col.names=features[,2])
train.x <- read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/train/X_train.txt", col.names=features[,2])
X <- rbind(test.x, train.x)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- features[grep("(mean|std)\\(", features[,2]),]
mean_and_std <- X[,features[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
test.y <- read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/test/y_test.txt", col.names = c('activity'))
train.y <- read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/train/y_train.txt", col.names = c('activity'))
y <- rbind(test.y, train.y)

labels <- read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/activity_labels.txt")
for (i in 1:nrow(labels)) {
        code <- as.numeric(labels[i, 1])
        name <- as.character(labels[i, 2])
        y[y$activity == code, ] <- name
}

# 4. Appropriately labels the data set with descriptive activity names. 
labels.x <- cbind(y, X)
labels.mean_and_std <- cbind(y, mean_and_std)

# 5. Creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject. 
test.subject <- read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt", col.names = c('subject'))
train.subject <- read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt", col.names = c('subject'))
subject <- rbind(test.subject, train.subject)
averages <- aggregate(X, by = list(activity = y[,1], subject = subject[,1]), mean)
file.remove("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/result.txt")
write.csv(averages, file="C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/result.txt", row.names=FALSE)