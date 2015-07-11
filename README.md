# Getting and Cleaning Data Coursera Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

##    QUESTION 1:  Merges the training and the test sets to create one data set.
###Read Features
Features<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/features.txt",header=FALSE,sep="")

###Read Train_X
Train_X<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/train/x_train.txt",header=FALSE,col.names=Feature[,2],sep="")
Train_Y<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/train/y_train.txt",header=FALSE,col.names="Activity",sep="")
Subject_Train<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt",header=FALSE,col.names="Subject",sep="")

###Read Test_X
Test_X<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/test/x_test.txt",header=FALSE,col.names=Feature[,2],sep="")
Test_Y<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/test/y_test.txt",header=FALSE,col.names="Activity",sep="")
Subject_Test<-read.table("C:/Users/Vanguard/Google Drive/Coursera/Assigment Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt",header=FALSE,col.names="Subject",sep="")

###Combine Train_Merge + Test_Merge
Train_Merge<-cbind(Train_X,Train_Y,Subject_Train)
Test_Merge<-cbind(Test_X,Test_Y,Subject_Test)
Test_Train_Merge<-rbind(Train_Merge,Test_Merge)

###Wrap Test Train
Test_Train_Wrap<-tbl_df(Test_Train_Merge)

##    QUESTION 2:  Extracts only the measurements on the mean and standard deviation for each measurement.