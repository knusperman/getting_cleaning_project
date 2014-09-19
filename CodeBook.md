# Coursera Course Project: Getting and Cleaning Data

## Wearables data set

### Script

Get the data needed into your working directory in the provided structure, i.e. with subfolders for train and test data. The units are the same as in the data. See the description of the raw data set for further details.

The script will import the files and perform the tasks specified in the assignment. It loads the plyr package.

#### 1. 
The first task in the assignment asks for one merged data set. 
It is named "fulldata" in the script.

#### 2.
The second task asks for only the means or the standard deviations in the data set
They are names "fulldata_means" and "fulldata_sds"
If you want to have them combined in one data.frame use "mean_sd_extract"

#### 3.-4.
Already in the "fulldata" data.frame from the first task.

##### 5.

The fifth task asks for the mean in the aggregation of the data set on the subject (column 1) and activity (column 2). This is called "aggregation" in the script. Note that the variables (column >2) have the prefix “mean_” to indicate the aggregation. 

