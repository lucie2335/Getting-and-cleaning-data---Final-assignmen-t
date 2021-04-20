# This script take the raw data and turn it into a tidy data set

#Type the emplacement of the raw data on your computer here
rawdata_place<-"HERE"

##Getting the names of the variable
place1<-paste(rawdata_place, "/features.txt")
file_with_variables<-read.table(place1)
list_variables<-file_with_variables$V2

##Getting and naming the TEST SET with the variables, activity, and subject
# get the raw file of measurement
place2<-paste(rawdata_place,"/test/X_test.txt")
filetest_raw<-read.table(place2) 
# names the variables
colnames(filetest_raw)<-list_variables
# get the activities
place3<-paste(rawdata_place, "/test/y_test.txt")
filetest_act<-read.table(place3, header=FALSE)
list_test_activities<-filetest_act$V1
#get the subjects
place4<-paste(rawdata_place,"/test/subject_test.txt")
filetest_subj<-read.table(place4, header=FALSE)
list_test_subject<-filetest_subj$V1
#create a file with all the data
filetest_compl<-cbind(list_test_activities, list_test_subject, filetest_raw)

##Getting and naming the TRAIN SET with the variables, activity, and subject
# get the raw file of measurement
place5<-"/PATH/TO/train/X_train.txt"
filetrain_raw<-read.table(place5) 
# names the variables
colnames(filetrain_raw)<-list_variables
# get the activities
place6<-paste(rawdata_place, "/train/y_train.txt")
filetrain_act<-read.table(place6, header=FALSE)
list_train_activities<-filetrain_act$V1
#get the subjects
place7<-paste(rawdata_place,"train/subject_train.txt")
filetrain_subj<-read.table(place7, header=FALSE)
list_train_subject<-filetrain_subj$V1
#create a file with all the data
filetrain_compl<-cbind(list_train_activities, list_train_subject, filetrain_raw)


##Merges the training and the test sets to create one data set.
library(dplyr)
colnames(filetest_compl)<-colnames(filetrain_compl)
file_compl<-bind_rows(filetrain_compl, filetest_compl)

##Extracts only the measurements on the mean and standard deviation 
##for each measurement. 
names_columns<-colnames(file_compl)
good<-grepl("mean|std", names_columns )
good<-grepl("list|mean|std", names_columns )
file_extract<-file_compl[good]

##Uses descriptive activity names to name the activities in the data set
new_column <-file_extract$list_train_activities
new_column <- gsub(1, "WALKING", new_column) 
new_column <- gsub(2, "WALKING_UPSTAIRS", new_column)  
new_column <- gsub(3, "WALKING_DOWNSTAIRS", new_column)
new_column <- gsub(4, "SITTING", new_column)
new_column<- gsub(5, "STANDING", new_column)
new_column <- gsub(6, "LAYING", new_column)
file_extract2<-cbind(new_column, file_extract)
file_extract2<-as_tibble(file_extract2)

##Appropriately labels the data set with descriptive variable names. 
file_named<-rename(file_extract2, activity = new_column )
file_named<-rename(file_named, subject_measured = list_train_subject)
tidy_data1 <- select(file_named, -list_train_activities)

##From the data set in step 4, creates a second, independent tidy data 
##set with the average of each variable for each activity and each subject.
data2<-group_by(tidy_data1, activity, subject_measured)
tidy_data2<-summarize_all(data2, mean)


