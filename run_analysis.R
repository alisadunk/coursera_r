#code for the run
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


labels = 1:6
names(labels) <- activities

#subject - person taking part in the study

measurement