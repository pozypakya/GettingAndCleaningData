
#Read Features
Features<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/features.txt",header=FALSE,sep="")

#Read Train_X
Train_X<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/train/x_train.txt",header=FALSE,col.names=Feature[,2],sep="")
Train_Y<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/train/y_train.txt",header=FALSE,col.names="Activity",sep="")
Subject_Train<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt",header=FALSE,col.names="Subject",sep="")

#Read Test_X
Test_X<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/test/x_test.txt",header=FALSE,col.names=Feature[,2],sep="")
Test_Y<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/test/y_test.txt",header=FALSE,col.names="Activity",sep="")
Subject_Test<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt",header=FALSE,col.names="Subject",sep="")

#Combine Train_Merge + Test_Merge
Train_Merge<-cbind(Train_X,Train_Y,Subject_Train)
Test_Merge<-cbind(Test_X,Test_Y,Subject_Test)
Test_Train_Merge<-rbind(Train_Merge,Test_Merge)
head(Test_Train_Merge,2)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
All_features <- Features[grep("(mean|std)\\(", Features[,2]),]
Mean_and_std <- Test_Train_Merge[,all_features[,1]]
head(Mean_and_std,2)

#Uses descriptive activity names to name the activities in the data set
Test_Y<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/test/y_test.txt",header=FALSE,col.names="Activity",sep="")
Train_Y<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/train/y_train.txt",header=FALSE,col.names="Activity",sep="")
Test_Train_Y <- rbind(Test_Y, Train_Y)
Labels <- read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/activity_labels.txt")
for (i in 1:nrow(Labels)) {
        code <- as.numeric(Labels[i, 1])
        name <- as.character(Labels[i, 2])
        Test_Train_Y[Test_Train_Y$activity == code, ] <- name
}