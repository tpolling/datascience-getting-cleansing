# Data Science / Getting and Cleaning Data
# Course Project

# File constants
rootPath <- "/Users/tpolling/data/a-pers/courses/coursera/data-science/DataGathering/w3/UCI\ HAR\ Dataset"
trainDataPath <- paste(rootPath, "train", sep="/")
testDataPath <- paste(rootPath, "test", sep="/")
oneDataPath <- paste(rootPath, "one", sep="/")

featuresFile <- paste(rootPath, "features.txt", sep="/")
oneTestDataFile <- paste(oneDataPath, "X_one.txt", sep="/")
activityLabelsFile <- paste(rootPath, "activity_labels.txt", sep="/")
activityMappingFile <- paste(oneDataPath, "y_one.txt", sep="/")
subjectFile <- paste(oneDataPath, "subject_one.txt", sep="/")

avgTestDataFile <- paste(oneDataPath, "avg_one.txt", sep="/")

# 1. Merge traiining and test sets into one data set
# Copies the training data set in "train" to "one" and appends "test" to "one"
if (!file.exists(oneDataPath)) {
    dir.create(oneDataPath)
    dir.create(paste(oneDataPath, "Inertial\ Signals", sep="/"))
}

# Copy train files to one
dataSetFiles <- list.files(trainDataPath, recursive=TRUE, full.names=TRUE)
for (i in 1:length(dataSetFiles)) {
    dataSetFile <- dataSetFiles[i]
    if (grep("train.txt", dataSetFile)) {
        oneDataSetFile <- gsub("train", "one", dataSetFile)
        file.copy(dataSetFile, oneDataSetFile, overwrite=TRUE)
    }
}
# Append test files to one
dataSetFiles <- list.files(testDataPath, recursive=TRUE, full.names=TRUE)
for (i in 1:length(dataSetFiles)) {
    dataSetFile <- dataSetFiles[i]
    if (grep("test.txt", dataSetFile)) {
        oneDataSetFile <- gsub("test", "one", dataSetFile)
        file.append(oneDataSetFile, dataSetFile)
    }
}


# 2. Extract only mean and standard deviation measurements
# 3. Add a column to describe the activities
# 4. Label the columns with names derived from the features file
# The test measurement features encoding values from features.txt
# mean features: example: 1 tBodyAcc-mean()-X
# standard deviation features: 4 tBodyAcc-std()-X
# Read features.txt and filter features by mean() and std() and get feature identifier
# Keep only columns from test data set (X_one.txt) matching feature identifier
activityMapping <- read.csv(activityMappingFile, header=FALSE, sep="")[,"V1"]
# Replace activity mapping with label
activityLabels <- read.csv(activityLabelsFile, header=FALSE, sep="")[,"V2"]
for (i in 1:length(activityLabels)) {
    activityMapping = gsub(i, activityLabels[i], activityMapping)
}
# Reading subjects
subjects <- read.csv(subjectFile, header=FALSE, sep="")[,"V1"]

# Reading features and adding activity column
features <- read.csv(featuresFile, header=FALSE, sep=" ", col.names=c("id", "feature"))
selectedFeatures <- features[grep("(mean|std)\\(\\)",features$feature),]

fullTestData <- read.csv(oneTestDataFile, header=FALSE, sep="", col.names=features$feature)
testData <- fullTestData[,selectedFeatures$feature]
testData$activity = activityMapping
testData$subject = subjects

# 5. Average of each variable for each activty and each subject
avgTestData <- aggregate(testData[,!(colnames(testData) %in% c("activity","subject"))], 
                         by=list(activity=testData$activity, subject=testData$subject), mean)

write.table(avgTestData, file=avgTestDataFile, row.names=FALSE)
