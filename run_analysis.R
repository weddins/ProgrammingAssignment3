# run_analysis.R
rm(list=ls())
#setwd("C:/coursera/DataScientist/3-GetCleanData/Project/UCI HAR Dataset")
#sessionInfo()
#You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, 
#    independent tidy data set with the average of each variable for each activity and each subject.
#
# 1. Merge training & test datasets
#
AppendIdsToMeasurement <- function(tmp, subjectid, activityid){
        tmp <- mutate(tmp, activityid)
        tmp <- sqldf("SELECT activityid, * FROM tmp")
        tmp <- tmp[,1:129]
        tmp <- mutate(tmp, subjectid)
        tmp <- sqldf("SELECT subjectid, * FROM tmp")
        tmp <- tmp[,1:130]
}

AppendIdsToFeatures <- function(tmp, subjectid, activityid){
        tmp <- mutate(tmp, activityid)
        tmp <- sqldf("SELECT activityid, * FROM tmp")
        tmp <- tmp[,1:80]
        tmp <- mutate(tmp, subjectid)
        tmp <- sqldf("SELECT subjectid, * FROM tmp")
        tmp <- tmp[,1:81]
        
}


#       # Following are meta data types of files
        dfActivityLabels <- read.table("./activity_labels.txt", stringsAsFactors = FALSE)
        #str(dfActivityLabels)
        #nrow(dfActivityLabels)

        dfFeatures <- read.table("./features.txt")
        #str(dfFeatures)
        #nrow(dfFeatures)

        # Following are 'test' datasets

        dfSubjTest <- read.table("./subject_test.txt")
        #str(dfSubjTest)

        dfSubjXtest <-  read.table("./X_test.txt")
        #str(dfSubjXtest)

        dfSubjYtest <-  read.table("./y_test.txt")
        #str(dfSubjYtest)

        # Following are 'Inertial Signals\test' datasets
        
        library(sqldf)
        library(dplyr)

        subjectid <- dfSubjTest[,1]
        activityid <- dfSubjYtest[,1]

        tmp <- read.table("./body_acc_x_test.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- tmp
        #nrow(dfMerged)

        tmp <- read.table("./body_acc_y_test.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)
        #nrow(dfMerged)

        tmp <- read.table("./body_acc_z_test.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)
        #nrow(dfMerged)

        tmp <- read.table("./body_gyro_x_test.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)

        tmp <- read.table("./body_gyro_y_test.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)

        tmp <- read.table("./body_gyro_z_test.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)

        tmp <- read.table("./total_acc_x_test.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)

        tmp <- read.table("./total_acc_y_test.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)

        tmp <- read.table("./total_acc_z_test.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)

        # Following are 'train' datasets
        
        dfSubjTrain <- read.table("./subject_train.txt")
        #str(dfSubjTrain)
        
        dfSubjXtrain <-  read.table("./X_train.txt")
        #str(dfSubjXtrain)
        
        dfSubjYtrain <-  read.table("./y_train.txt")
        #str(dfSubjYtrain)

        subjectid <- dfSubjTrain[,1]
        activityid <- dfSubjYtrain[,1]


        # Following are 'Inertial Signals\train' datasets
        
        tmp <- read.table("./body_acc_x_train.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)

        tmp <- read.table("./body_acc_y_train.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)

        tmp <- read.table("./body_acc_z_train.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)

        tmp <- read.table("./body_gyro_x_train.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)

        tmp <- read.table("./body_gyro_y_train.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)

        tmp <- read.table("./body_gyro_z_train.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)

        tmp <- read.table("./total_acc_x_train.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)

        tmp <- read.table("./total_acc_y_train.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)

        tmp <- read.table("./total_acc_z_train.txt")
        tmp <- AppendIdsToMeasurement(tmp, subjectid, activityid)
        dfMerged <- rbind(dfMerged, tmp)
        #nrow(dfMerged)
        #[1] 92691, which is equal to 2947 (test) x 9 (files) plus 7352 (train) x 9 (files)

        #write.csv(dfMerged, "Test & Train Dataset.csv")

# 2. Extracts only the measurements on the mean and standard deviation for each feature measurement.

        dfFeaturesAll <- read.table("./features.txt", stringsAsFactors = FALSE)
        dfFeaturesAll <- dfFeaturesAll[,2]
        colnames(dfSubjXtest) <- dfFeaturesAll
        colnames(dfSubjXtrain) <- dfFeaturesAll
        dfFeaturesAll <- read.table("./features.txt", stringsAsFactors = FALSE)
        dfFeaturesMeanStd <- filter(dfFeaturesAll, grepl('mean|std', V2))
        dfSubjXtest <- dfSubjXtest[, names(dfSubjXtest) %in% dfFeaturesMeanStd[,2]]
        dfSubjXtrain <- dfSubjXtrain[, names(dfSubjXtrain) %in% dfFeaturesMeanStd[,2]]

        subjectid <- dfSubjTest[,1]
        activityid <- dfSubjYtest[,1]

        dfTmp <- AppendIdsToFeatures(dfSubjXtest, subjectid, activityid)

        subjectid <- dfSubjTrain[,1]
        activityid <- dfSubjYtrain[,1]

        dfTmp1 <- AppendIdsToFeatures(dfSubjXtrain, subjectid, activityid)

        dfMergedMeansStd <- rbind(dfTmp, dfTmp1)
        #nrow(dfMergedMeansStd)
        #[1] 10299, which is equal to 2947 (rows in dfSubjXtest) plus 7352 (rows in dfSubjXtrain)

        rm(dfTmp)
        rm(dfTmp1)

        dfMergedMeansStds

# 3. Uses descriptive activity names to name the activities in the data set
        #str(dfActivityLabels)

        dfMergedActivityLabels <- dfMerged
        dfActivityLabels <- rename(dfActivityLabels,"activityid" = V1, "activitylabel" = V2)
        dfMergedActivityLabels <- (merge(dfActivityLabels, dfMergedActivityLabels, by = 'activityid'))
        dfMergedActivityLabels <- sqldf("SELECT subjectid, activityid, activitylabel, * FROM dfMergedActivityLabels")
        dfMergedActivityLabels <- dfMergedActivityLabels[-c(4,5,6)]

# 4. Appropriately labels the data set with descriptive variable names. 

#I am assuming that this requirement means V1, V2, V3 ... V128 in dfMergedActivityLabels, which
#may be invalid; however, I see no labels for the 128 vector of measurements. Therefore, I will
#name them measure1, measure2, measure3 ... measure128.

        #str(dfMergedActivityLabels)
        dfTidySet <- dfMergedActivityLabels
        vectorLabels <- paste("measure",1:128,sep="")
        vectorLabels <-c("subjectid", "activityid", "activitylabel", vectorLabels)
        names(dfTidySet) <- vectorLabels

# 5. From the data set in step 4, creates a second, 
#    independent tidy data set with the average of each variable for each activity and each subject.

#I am assuming that this requirement is to find the means of measure1, measure2, measure3 ... measure128
#for each activity and each subject.
        #str(dfTidySet)
        dfTidySet2 <- dfTidySet
        vectorLabels <- paste("measure",1:128,sep="")
        measuremean <- rowMeans(subset(dfTidySet2,select=vectorLabels))
        dfTidySet2$measuremean <- measuremean
        #mutate(dfTidySet2,measuremean=measuremean)
        dfTidySet2 <- sqldf("SELECT activityid, activitylabel, subjectid, measuremean, * FROM dfTidySet2")
        dfTidySet2 <- dfTidySet2[-c(5:7)]
        dfTidySet2 <- sqldf("SELECT * FROM dfTidySet2 ORDER BY activityid, subjectid")

        write.table(dfTidySet2, "TidySet2.txt", row.name = FALSE) 
