#This program assumes that the data files exists in the working directory 

#1: merge all test and train datasets

# Actual data (x_train and x_test)
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt" ) 
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt" )    
x<-rbind(X_train,x_test)              

#Activity (y_train and y_test)
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt" ) 
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt" )    
y<-rbind(y_train,y_test)      

#subject (subject_train and subject_test)
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt") 
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt") 
subject<-rbind(subject_train,subject_test)

#2:collect mean and std variables

features<-read.table("./UCI HAR Dataset/features.txt" ) 

var<-features[,"V2"]

colnames(x)<-var       
mc<-as.character(features[grep("mean", var),"V2"])
x_mean<-x[,mc]

sc<-as.character(features[grep("std", var),"V2"]) 
x_std<-x[,sc]

ms_mzr<-cbind(x_mean,x_std)
                     
#3: Add meaningful names to the variable

#act_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
var_names<-read.table("./UCI HAR Dataset/activity_labels.txt")
m<-match(y$V1, var_names$V1)

y$Activity<-as.character(var_names$V2[m]) 

ms_mzr$Activity<-y$Activity 

#-----------------------------------
#Task4: Makes the variable names valid
#-----------------------------------

colnames(ms_mzr)<-make.names(colnames(ms_mzr), unique=TRUE)

#-----------------------------------
#Task5: creates a second, independent tidy data set with the average of each variable for each activity and each subject
#-----------------------------------

mean_df<-ms_mzr[,c(make.names(mc),"Activity")]  #extract only mean data

mean_df$Subject<-subject[,"V1"]               #add subject variable

