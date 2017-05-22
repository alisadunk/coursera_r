#setwd('Data Science with R/FProject/UCI HAR Dataset/')
##analysis of FitBit Data
##Activities: 
activities <- c('WALKING','WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')
##Activity Labels (activity_lables.txt)
#1 WALKING
#2 WALKING_UPSTAIRS
#3 WALKING_DOWNSTAIRS
#4 SITTING
#5 STANDING
#6 LAYING


setwd('../../FProject/')
#read files
x<-read.table("UCI HAR Dataset/features.txt")
a<-read.table("UCI HAR Dataset/activity_labels.txt")

#measure std...

std_x<-grep(".*mean.*|.*std.*",x[,2])
std<-x[std_x,2]
std=gsub('-mean','-Mean',std)
std=gsub('-std','Std',std)
std<-gsub('[-()]','',std)

#load data
test<-read.table("UCI HAR Dataset/test/X_test.txt")[std_x]
test_activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
tsub <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(tsub, test_activities, test)
train<-read.table("UCI HAR Dataset/train/X_train.txt")[std_x]
ta<-read.table("UCI HAR Dataset/train/Y_train.txt")
ts<-read.table("UCI HAR dataset/train/subject_train.txt")
train <- cbind(ts, ta, train)


#Merge 
ad <- rbind(train, test)
colnames(ad) <- c("subject", "activity", std)

#assign correct values
ad$activity <- factor(ad$activity
                      , levels = a[,1]
                      , labels = a[,2])
ad$subject <- as.factor(ad$subject)

#result output
write.table(ad
            , "UCI HAR Dataset/test/tidy_result.txt"
            , row.names = FALSE
            , quote = FALSE)

