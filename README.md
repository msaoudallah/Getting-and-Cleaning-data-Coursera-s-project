# Getting and Cleaning data Coursera's project

this project was introduced to learn how to make a dataset tidy, we used data set from here 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# How run_analysis.R works : 
  first of all i assume you have downloaded the data and unzipped it to a folder called "UCI HAR Dataset" 
  and then you can follow this steps to understand how the script works
  1.  loading required libraries
  2.  reading the data using the amazing fread function
  3.  merging the train and data set into one dataset alongside with adding the activity and subject variable to them
  4.  grepping the mean and std variables from the dataset 
  5.  replacing the activity variable with the corresponding activity for each value 
  6.  naming the dataset variables
  7.  melting the dataset 
  8.  casting to acheive the requirment 
