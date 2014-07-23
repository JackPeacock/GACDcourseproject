setwd("/Users/JackPeacock/datasciencecoursera/Getting\ and\ Cleaning\ Data/Course\ Project")
library(plyr)
## Get test data

testDf <- read.table("./UCI HAR Dataset/test/X_test.txt")
testSubjectsVector <- scan("./UCI HAR Dataset/test/subject_test.txt")
testActivityVector <- scan("./UCI HAR Dataset/test/y_test.txt")
featuresDf <-read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
testDf <- cbind(testSubjectsVector, testActivityVector, testDf)
colnames(testDf) <- c("Subject", "Activity", featuresDf$V2)

## Get train data

trainDf <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainSubjectsVector <- scan("./UCI HAR Dataset/train/subject_train.txt")
trainActivityVector <- scan("./UCI HAR Dataset/train/y_train.txt")
trainDf <- cbind(trainSubjectsVector, trainActivityVector, trainDf)
colnames(trainDf) <- c("Subject", "Activity", featuresDf$V2)

## According to David Hood (Community TA) - files in inertial folder are not
## required here. Now row binding the two frames

fullDf <- rbind(testDf, trainDf)

## Find the column names which end with "mean()" or "std()"

meanCols <- grep("-mean()", colnames(fullDf), fixed = TRUE)
sdCols <- grep("std()", colnames(fullDf), fixed = TRUE)

## These are the columns needed along with the first 2 which label subject and
## acitivity.

colsNeeded <- c(1, 2, meanCols, sdCols)

## Then select those columns out.

fullDf <- fullDf[,colsNeeded]

## Get the activity labels

activityLabels = read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

fullDf[,2] <- mapvalues(fullDf[,2], from = activityLabels[,1], to = activityLabels[,2])

## Step 5: The columns have already been appropriately labelled
## Column name descriptions will be available in the code book.

finalDf = data.frame(matrix(ncol = ncol(fullDf)-2, nrow = 30 + nrow(activityLabels)))
colnames(finalDf) <- c(colnames(fullDf)[c(3:ncol(fullDf))])

rowNames = vector()

for (i in c(1:30)) {
        rowNames <- c(rowNames, paste("Subject", toString(i)))
}

rownames(finalDf) <- c(activityLabels[,2], rowNames)

for (i in activityLabels[,2]) {
        subset <- fullDf[fullDf$Activity == i,c(3:ncol(fullDf))]
        finalDf[i,] = colMeans(subset)
}

for (i in c(1:30)) {
        subset <- fullDf[fullDf$Subject == i, c(3:ncol(fullDf))]
        finalDf[rowNames[i],] = colMeans(subset)
}

write.table(finalDf, "finaltable.txt")