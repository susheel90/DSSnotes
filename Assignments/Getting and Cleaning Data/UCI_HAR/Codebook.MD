#Codebook

###Overview

#####Raw Variables
The raw variables have been used to compose the filtered variables which are a part of the `run_analysis.R` dataset. The raw variables are tri-axial (x,y,z) signals:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

#####Filtered Variables
The `run_analysis.R` script produces filtered variables - estimates of the raw variables (signals). The following two functions were used to filter the individual tri-axial (x,y,z) signals:
* mean(): Mean value
* std(): Standard deviation

###Walk through

The following list detailst the core steps taken by the run_analysis.R script, and provides details of each step.  
##### 0. Load packages
* Loads the following necessary packages for the following functions:  
  * `magrittr` = `%>%`  
  * `dplyr` = `bind_cols()`, `bind_rows()`, `left_join()`  
  * `stringr` = `str_to_title()`  

##### 00. Download, unzip, and read the data  
* Specifies the url and the download destination (in the working directory)
* Unzips the downloaded file
* Reads specific files into R
  * Extracts two specific files (`x_test`) and applies a series of functions to remove `NA's` and convert the output into a data frame

##### 1. Merge files and union the `test` and `training` datasets  
* Assigns column names to  prevent naming conflicts (that way one column from one file does not overwrite the other)
* Create a `test` and a `training` dataset by merging the `x_test` (variables) with the two raw files which identify the `subject` and the `activity` undertaken by the `subject`
* Creates a 
* Union the two datasets into one large data set

##### 2. Extract only the mean and standard deviation measurements  
* Extracts only `mean()` and `std()` from a file containing all 561 variables
* This new index file is modified to reflect the two extra columns (from the merge in step 1)
* The index file is then used to subset the large dataset

##### 3. Give descriptive activity names  
* A file containing the activity names is used to replace the numerical representation of the activities with its descriptive name  

##### 4. Give descriptive variable names  

##### 5. GROUP BY average(*), activity -- and -- GROUP BY average(*), subject  
