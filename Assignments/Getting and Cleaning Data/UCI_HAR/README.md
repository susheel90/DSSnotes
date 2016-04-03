# UCI_HAR
###Purpose
The purpose of this repo is to provide a an R script, `run_analysis.R`, which will: download, clean, and present data from the UCI HAR Dataset.  The UCI HAR Dataset is composed of data collected from the accelerometer of Samsung Galaxy S II smartphone at a constant rate of 50Hz. The smartphones were used in a UCI research study to track the movement of 30 research subjects who performed 6 common daily activities.


###Data Source

* UCI
   * Overview: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
   * Data: http://archive.ics.uci.edu/ml/machine-learning-databases/00240/

###Data Description

Measurement Device:  
1. Samsung Galaxy S II smartphone  
  * Accelerometer
  * Gyroscope 

Activities performed by the 30 subjects (`Activity` column):  
1. Laying  
2. Sitting  
3. Standing  
4. Walking  
5. Walking Downstairs  
6. Walking Upstairs  

Axial directions measured:  
1. X  
2. Y  
3. Z  

###Data Files

There are two data files generated from the `run_analysis.R` script:

######Measurements
* Table of measurement data of both "tests" and "training" exercises
    * 81 variables
    * variables are the mean and standard deviation

######Summary
* Table of the mean of each activity per subject
    * each subject (participant) will have six rows
    * the six rows correspond to the average of each activity undertaken by the subject
