README for Getting and Cleaning Data Course Project
---------------------------------------------------

The objective of this project was to summarise the data from the Human Activity Recognition Using Smartphones Data Set. The data set can be found at this URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. For each activity the subjects performed, and for each subject, the average for the mean and standard deviation measurements has been calculated and stored in a table.

To perform the summary analysis, the data should be downloaded from the above URL, unzipped, and the unzipped folder placed inside the repo folder on your device.

This repo also contains the following files:
* .gitignore file &mdash; The data set is large and does not need to be synced with github. This file tells git to not track the original data set directory.
* finaltable.txt &mdash; This is the final data set produced by the analysis. This file can be read into R using the read.table() function.
* run_analysis.R &mdash; This is the script which turns the original dataset into finaltable.txt An explanation of how it works is provided below.
* CODEBOOK.md &mdash; This contains a brief overview of the row names and column names of finaltable.txt

## How the run_analysis.R script works.

The working directory should be set to the repo directory. This will be dependent on your machine. getwd() is called first for you to check this. Then the library plyr is called is the function mapvalues will be used later. If you do not have plyr installed you may need to call install.packages("plyr") before running the rest of the script.

The data for both the test data and training data is then read into a table using the read.table() function. As the subjects and activities data are located in different files, they are first read into vectors (these data sets are just one column) using the scan() function and the names of the different measurements are read into another data frame.

The data frames for the individual training and test data are put together using the column bind function and the column names are stated as the different measures that were read into featuresDF. "Subject" and "Activity" are needed as these have been added by the script and have not been read in to the featuresDf data frame. The two dataframes are then put together using the row bind function.

The inertial test data is not required and is ignored.

There are over 560 columns in the full data frame. Here we are only interested in the mean measurements and the standard deviation measurements. The grep command selects out the number of the columns which have a column name that contain the exact "mean()" or "std()" strings. Everything but these columns is then filtered out.

The activities are currently labelled 1-6. The numbers are switched to their corresponding label from the "activity_labels.txt" file using plyr's mapvalues function.

All that is left to do is subset the data for each subject or activity and then calculate the mean of the columns. finalDf is final data frame which will be exported. It is intialised with the number of columns according to the previous data frame (but without "Subject" and "Activity" headings) and has a number of rows equal to the number of participants (30) plus the number of activities.

The row names state the subset of data which the column means have been calculated. Numbers indicate the number of the participant. Column names are also cleaned up slightly to remove unneccesary symbols and properly capitalise. "For" loops then cycle over the full data frame, subsetting it accordingly, then calculating the mean of the columns.

Finally, the data.frame is written to a file using write.table(). It can be read back into R using the read.table() function.

