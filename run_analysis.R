# This script create a tidy data as long as the Samsung data is in your working directory

# Merges the training and the test sets to create one data set.
## Create subject data.frame of single column named "Subject" and levels as Subject id
subject_test <- read.table("subject_test.txt") # Read subject_test
subject_train <- read.table("subject_train.txt") # Read subject_train
subject <- rbind(subject_test, subject_train) # Combine data
names(subject) <- "Subject" # Name variable
subject <- factor(subject$Subject) # convert in factor

## Create activity factor with named Activity and Uses descriptive activity names as levels
y_train <- read.table("y_train.txt") # Read Training labels
y_test <- read.table("y_test.txt") # Read Training labels
activity <- rbind(y_train, y_test)
names(activity) <- "Activity"
activity_labels <- read.table("activity_labels.txt") # Read activity labels
activity <- factor(activity$Activity) # convert in factor

activity <- mapvalues(activity, c("1","2", "3", "4", "5", "6"), c("WALKING","WALKING_UPSTAIRS", 
                                                      "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

## Create set data.frame  with 561 variables 
# label each variable with descriptive variable names stripped from dashes, coma and parenthese
x_train <- read.table("X_train.txt") # Read Training set
x_test <- read.table("X_test.txt") # Read Test set
set <- rbind(x_train, x_test)
features <- read.table("features.txt") # Read features
features <- features[,2] # Keep only activity column
features <- gsub("-", " ", features) # remove dash
features <- gsub("(", "", features, fixed="TRUE") # remove parenthese
features <- gsub(")", "", features, fixed="TRUE") # remove parenthese
features <- gsub(",", "", features, fixed="TRUE") # remove parenthese
features <- make.names(features, unique=TRUE) # validate column names
names(set) <- features # add variables names to data set

## Merge Subject, Activity and Set
data <- cbind(subject, activity, set)
# names(data)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
data <- select(data, subject, activity, contains("mean"), contains("std")) 

# Create an independent tidy data set with the average of each variable for each activity and each subject.
# Generating summary statistics by stratum
# split tidy data set in a list of dataframe for each variable for each activity and each subject.
list_data<- split(data, list(data$activity, data$subject))
# calculate mean for each variable for each activity and each subject. 
list_data <- lapply(list_data, function(x) colMeans(select(x, -(subject:activity))))
# combine  in a data frame
tidy_data <- t(data.frame(list_data))
tidy_data <- data.frame(tidy_data)
# Rename column
names(tidy_data) <- paste(rep("mean", times = length(names(tidy_data))), names(tidy_data), sep = ".")
# add a column for Subject and 1 column for activity
list <- strsplit(rownames(tidy_data),".", fixed = TRUE)
df <- ldply(list)
colnames(df) <- c("Activity", "Subject")
df$Activity <- factor(df$Activity)
df$Subject <- factor(df$Subject)
tidy_data <- cbind(df, tidy_data)

# Create a text file with the data set
write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE) 
print("the tidy_data.txt file has been created in your working directory")

