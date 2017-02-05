require(plyr) ## loading required library


## Step 1 - Merge de two data sets into one ------------------------------------------------

unzip("getdata%2Fprojectfiles%2FUCI HAR Dataset.zip") # Unzip

list.files()                    # Explore folders and files
dir("UCI HAR Dataset/")
dir("UCI HAR Dataset/")

# Loading all data

xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/Y_train.txt")
subject_train <- read.table("train/subject_train.txt")

xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Create xdata and ydata datasets

xdata <- rbind(xtrain, xtest)
ydata <- rbind(ytrain, ytest)

# Subject data frame

subjectdata <- rbind(subject_train, subject_test)

## Step 2 Extract only the mean and SD measurements  ---------------------------------------

features <- read.table("features.txt")
str(features)
head(features)

# Get only columns with mean and sd values on it 

mean_SD <- grep("-(mean|std)\\(\\)", features[,2])
xdata <- xdata[, mean_SD]

# Fixing names

names(xdata) <- features[mean_SD, 2]

## Step 3 - Use descriptive activity names to name the activities in the data set ---------

activities <- read.table("activity_labels.txt") # load file labels
ydata[, 1] = activities[ydata[, 1], 2] 
names(ydata) <- "activity" # fix column name

## Step 4 - Appropriately labels the data set with descriptive variable names --------------

names(subjectdata) <- "subject"
all_data <- cbind(xdata, 
                  ydata,
                  subjectdata) # merging data 

head(all_data, 3)
colnames(all_data)

## Step 5 - From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject --------------------





















