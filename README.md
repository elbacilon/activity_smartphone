---
title: "README"
author: "elbacilon"
date: "Wednesday, April 22, 2015"
output: html_document
---

# high-level purpose of the package.
From data collected with the accelerometers of a Samsung Galaxy S smartphone weared
by 30 subjects performing activities of daily living, the package create a tidy data 
set with the average by each activity and each subject of each mean and standard 
deviation of each measurement provided in the collected data.

# Installation instructions, 

Before starting instruction below set your working directory

```{r}


# if not alrady done install and load the package "dplyr"
# install.packages("dplyr")
# library(dplyr)

# Download Samsung data if does not already exist 
if(!file.exists("uci_har.zip")){  
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        download.file (fileUrl, destfile = "./uci_har.zip", mode='wb') 
        dateDownloaded <- date() # set date of the download
        }
# Create a directory and unzip the Samsung data if directory does not already exist 
if(!file.exists("./uci_har_data4")){
        dir.create("./uci_har_data4")
        unzip("uci_har.zip", exdir = "./uci_har_data4", junkpaths = TRUE)
        }
        
# set created directory as working directory
setwd("./uci_har_data4")

# download the script, load and execute it to create the tidy data_set in the directory
fileUrl <- "https://raw.githubusercontent.com/elbacilon/activity_smartphone/master/run_analysis.R"
download.file(fileUrl, destfile = "run_analysis.R")
source("run_analysis.R")

```

# Overview 
The repository includes the following files:
=========================================
- CodeBook.md: provide information about the variables contained in the tidy data set
- README.md: 
- run_analysis.R: the script that create the tidy data set as long as the Samsung data is in your working directory


The  run_analysis.R script performed the following operation:
1. Read subject_test.txt and subject_train.txt files to combine them in a "subject" factor 
levels as Subject id 1 to 30
2. Read y_train, y_test.txt  files to combine them in a "activity" factor levels as activity 
3. Read activity_labels.txt files to replace "activity" factor levels with descriptive 
activity names as value
4. Read x_train.txt and x_test.txt files to combine them in "set"" data.frame with 561 variables 
5. Read features.txt file and strip dashes, coma and parenthes to rename "set" column names 
with valid and descriptive variable names
6. Merge "subject"", "activity" and "Set" in a single data.frame named "data"
7. Subset "data" with only the measurements on the mean and standard deviation for each measurement in a data frame named "activity_subject_list"
8. split tidy "data" in a list of dataframe for each variable for each activity and each subject named "list_data"
9. Using "list_data" Calculate mean for each variable for each activity and each subject
10. Combine "list_data" in a data frame named "tidy_data"
11. Rename column by adding mean to each variable and add one column for Subject and one column for activity