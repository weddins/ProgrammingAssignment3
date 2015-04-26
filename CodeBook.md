# CodeBook.md
## Description of the study
 Who: Bill, a student taking Getting and Cleaning Data
 Why: Part of the Data Science Certification
 How: Using R, R Studio, and the internet

## Sampling information
 Population: 30 volunteers ages 19-48 years (70% or 21 in train and 30% or 9 in test)
 Sample: subjects performed 6 activities wearing a smartphone with embedded accelerometer and gyroscope
 Response rate: sampled 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz

## Technical information about files
### The following table summarizes files which give the experimental design, file details (informational and data), and measurements taken from the smart phones.

|File folder             |File name          |Description
|:-----------------------|:------------------|:------------------------------------
|UCI HAR Dataset (root)  |activity_labels.txt|Gives descriptive labels for activities performed by the subjects
|UCI HAR Dataset         |features.txt       |Set of features/measurements made from the accelerometer and gyroscope readings
|UCI HAR Dataset         |features_info.txt  |Column description of the features/measurements taken
|UCI HAR Dataset         |README.txt         |Summarizes the experimental design, measurements and all data files

### The following table summarizes the data files in the 'UCI HAR Dataset' folder and includes R variables.

|File name          |Obs |# Vars|R Var (Possible values)
|:------------------|:--:|:----:|-------------------------------------------------
|activity_labels.txt|6   |2     |dfActivityLabels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
|features.txt       |561 |2     |dfFeatures (1 tBodyAcc-mean()-X, 2 tBodyAcc-mean()-Y, 3 tBodyAcc-mean()-Z, 4 tBodyAcc-std()-X)

### The following table summarizes the data files in the 'UCI HAR Dataset\test' folder and includes R variables.

|File name          |Obs |# Vars|R Var (Logical meaning)
|:------------------|:--:|:----:|------------------
|subject_test.txt   |2947|1     |dfSubjTest (Has subject id for each record)
|X_test.txt         |2947|561   |dfSubjXtest (Has vector of feature measurements for each subject id)
|y_test.txt         |2947|1     |dfSubjYtest (Has activity id for each activity a subject performed)

### The following summarizes the data files in the 'UCI HAR Dataset\test\Inertial Signals\' folder and includes R variables.

|File name           |Obs |# Vars|R Var
|:-------------------|:--:|:----:|----------------
|body_acc_x_test.txt |2947|128   |dfMerged
|body_acc_y_test.txt |2947|128   |dfMerged
|body_acc_z_test.txt |2947|128   |dfMerged
|body_gyro_x_test.txt|2947|128   |dfMerged
|body_gyro_y_test.txt|2947|128   |dfMerged
|body_gyro_z_test.txt|2947|128   |dfMerged
|total_acc_x_test.txt|2947|128   |dfMerged
|total_acc_y_test.txt|2947|128   |dfMerged
|total_acc_z_test.txt|2947|128   |dfMerged

### The following table summarizes the data files in the 'UCI HAR Dataset\train' folder and includes R variables.

|File name          |Obs |# Vars|R Var (Logical meaning)
|:------------------|:--:|:----:|-----------------------
|subject_train.txt  |7352|1     |dfSubjTrain  (Has subject id for each record)
|X_train.txt        |7352|561   |dfSubjXtrain (Has vector of features for each subject id)
|y_train.txt        |2947|1     |dfSubjYtrain (Has activity id for each activity a subject performed)

### The following summarizes the data files in the 'UCI HAR Dataset\train\Inertial Signals\' folder and includes R variables.

|File name            |Obs |# Vars|R Var
|:--------------------|:--:|:----:|-----------------
|body_acc_x_train.txt |7352|128   |dfMerged
|body_acc_y_train.txt |7352|128   |dfMerged
|body_acc_z_train.txt |7352|128   |dfMerged
|body_gyro_x_train.txt|7352|128   |dfMerged
|body_gyro_y_train.txt|7352|128   |dfMerged
|body_gyro_z_train.txt|7352|128   |dfMerged
|total_acc_x_train.txt|7352|128   |dfMerged
|total_acc_y_train.txt|7352|128   |dfMerged
|total_acc_z_train.txt|7352|128   |dfMerged


## Structure of the data (hierarchical, multiple cards, etc.)
The data is in a star format typical in data mining and data warehousing applications. See the following reference in wikipedia.org for more information.

https://en.wikipedia.org/wiki/Star_schema

The 'fact' table consists of observations of subject id's (subject_test.txt and subject_train.txt), and activity id's (y_test.txt and y_train.txt). The subject id's and activity id's logically link to the 'dimensions' in a star configuration. The dimensions are the features (X_test.txt and X_train.txt) and measurements (see the files in UCI HAR Dataset\test\Inertial Signals\ and UCI HAR Dataset\train\Inertial Signals\).

## Details about the data (columns in which specific variables can be found, whether they are character or numeric, and if numeric, what format)

Each R Variable below is a data frame.

Requirment #|R Variable              |Column\format        |Type |
|:---------:|:-----------------------|---------------------|:---:|
|1          |dfMerged                |subjectid            |int  |
|           |                        |activityid           |int  |
|           |                        |V1:V128              |num  |
|2          |dfMergedMeansStds       |subjectid            |int  |
|           |                        |activityid           |int  |
|           |                        |1:79 means & stds    |num  |
|3          |dfMergedActivityLabels  |subjectid            |int  |
|           |                        |activityid           |int  |
|           |                        |activitylabel        |chr  |
|           |                        |V1:V128              |num  |
|4          |dfTidySet               |subjectid            |int  |
|           |                        |activityid           |int  |
|           |                        |activitylabel        |chr  |
|           |                        |measure1:measure128  |num  |
|5          |dfTidySet2              |subjectid            |int  |
|           |                        |activityid           |int  |
|           |                        |activitylabel        |chr  |
|           |                        |measuremean          |num  |
|           |                        |measure1:measure128  |num  |




