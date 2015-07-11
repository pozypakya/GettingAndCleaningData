

Features<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/features.txt",header=FALSE,sep="")

#Read Train
Train_X<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/train/x_train.txt",header=FALSE,col.names=Feature[,2],sep="")
Train_Y<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/train/y_train.txt",header=FALSE,col.names="Activity",sep="")
Subject_Train<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt",header=FALSE,col.names="Subject",sep="")

#Read Test
Test_X<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/test/x_test.txt",header=FALSE,col.names=Feature[,2],sep="")
Test_Y<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/test/y_test.txt",header=FALSE,col.names="Activity",sep="")
Subject_Test<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt",header=FALSE,col.names="Subject",sep="")


Train_Merge<-cbind(Train_X,Train_Y,Subject_Train)
Test_Merge<-cbind(Test_X,Test_Y,Subject_Test)
Test_Train_Merge<-rbind(Train_Merge,Test_Merge)

MERGEDATA<-tbl_df(Test_Train_Merge)