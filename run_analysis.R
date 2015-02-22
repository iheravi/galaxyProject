#This script downloads the Galaxy s individual activity data and provides a tidy data set of
#average of the mean and standard deviations of the time component of the 561-feature data set.
#Download the zip file from the class provided url
temp <- tempfile()
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, temp)

#Read data file for activity lables into al structure
al <- read.table(unz(temp, "UCI HAR Dataset/activity_labels.txt"))
#Read data file for features into f structure
f <- read.table(unz(temp, "UCI HAR Dataset/features.txt"))
#Read data files for training data set
st <- read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"))
yt <- read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"))
xt <- read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"))

#Convert the training activity structure to factor
ytfct <- factor(as.character(yt[[1]]), al[[1]], al[[2]])

#assign column names to training data using the feature structure
#charecters that are not allowed in column name are replaced by "_" in the provided feature names
#using gsub() function.
colnames(xt) <- paste( "avg", gsub("\\(|\\)|,|-", "_", f[[2]]) , sep="_")
#assemble the training data into a single data frame.
tData <- data.frame(ytfct,st,xt)
#name the first 2 columns of the data frame appropriately
colnames(tData)[1] <- "activity"
colnames(tData)[2] <- "subject"

#Read data files for test data set
stest <- read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"))
ytest <- read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"))
xtest <- read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt"))

#Convert the test activity structure to factor
ytestfct <- factor(as.character(ytest[[1]]), al[[1]], al[[2]])

#assign column names to test data using the feature structure
#charecters that are not allowed in column name are replaced by "_" in the provided feature names
#using gsub() function.
colnames(xtest) <- paste( "avg", gsub("\\(|\\)|,|-", "_", f[[2]]) , sep="_" )
#assemble the test data into a single data frame.
testData <- data.frame(ytestfct,stest,xtest)
#name the first 2 columns of the data frame appropriately
colnames(testData)[1] <- "activity"
colnames(testData)[2] <- "subject"

#put training and test data into a single data frame
paData <- rbind(tData, testData)
#filter the data only to the time measurements. The frequecy data is derived from time measurements
#so in this exercise I think it is reasonable to filter them out.
panData <- paData[, 1:267]
#narrow down the time measurements to the mean and standard deviation columns.
patData <- panData[,  c(1, 2, grep(".mean.", colnames(panData)), grep(".std.", colnames(panData)))]

#calculate the average of each measurement grouped by subject and activity - first 2 columns of the data frame
avgs <- data.frame(sapply(patData[, 3:42], function (x){lapply(split(x, patData[, 1:2]), mean)}))
#unfortunately the calculated columns in avgs are lists so we need to change them to numenic
#and create avgs2
avgs2 <- apply(avgs, 1:2, function(x){if(class(x)=="list"){ x <- x[[1]][1]}})
#create a data frame for subject and activity columns with 180 rows - 30 subjects X 6 acitivities
v <- data.frame(subject=1:180, activity=1:180)
#populate v using the row names of the avgs data frame
for ( i in 1:180){v[i, "subject"] <- strsplit(row.names(avgs[i,]), "\\.")[[1]][2]; v[i, "activity"] <- strsplit(row.names(avgs[i,]), "\\.")[[1]][1]}
#assemble the final tidy data set
avgs1 <- data.frame(v, avgs2)
#write the data set to the csv file
write.csv(avgs1, file = "PersonalActivity.csv",row.names=FALSE)

#release temp handle
unlink(temp)

