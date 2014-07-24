README for Getting and Cleaning Data Course Project
---------------------------------------------------

The objective of this project was to summarise the data from the Human Activity Recognition Using Smartphones Data Set. The data set can be found at this URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

To perform the summary analysis the data should be downloaded from the above URL, unzipped, and the unzipped folder placed inside the repo folder on your device.

This repo also contains the following files:
* .gitignore file &mdash; The data set is large and does not need to be synced with github. This file tells git to not track the original data set directory.
* finaltable.txt &mdash; This is the final data set produced by the analysis. This file can be read into R using the read.table() function.
* run_analysis.R &mdash; This is the script which turns the original dataset into finaltable.txt An explanation of how it works is provided below.
* CODEBOOK.md &mdash; The column headings of finaltable.txt are slightly abbreviated. This file explains all the variable names.

## How the run_analysis.R script works.