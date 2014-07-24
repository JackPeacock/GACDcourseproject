CodeBook for Getting and Cleaning Data Course Project
---------------------------------------------------

I advise that this codebook is used in conjunction with the "features_info.txt" file located in the root directory of the downloaded data set. Here I will describe the what the row and column names mean in the "finaltable.txt" data set.

This data set has taken subsets of the original downloaded data according to the activity carried out or the subject. The activity or subject which has been subsetted is stated in the row name. For each subset, the mean of the measurements of each variable has then been calculated. The measurements for which the mean has been calculated is stated in the column names.

The row names are "Subject" + 1,2,3,...,28,29,30. These indicated the number of the participant according to the original data. The data are the mean of the measurements for each subject (each subject doing all acitivities).

Also as row names are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING. These correspond to the activities being done by the subjects while measurements were being taken. The data are the mean for the measurements for each activity (each activity being performed by all subjects).

The column names are left in the same form, apart from symbols removed and some change in capitalisation for readability, as they are listed in the "features_info.txt" of the original data. For a detailed understanding of what they mean, I advise you study this file. As a quick guide:
* Column names that begin with a "t" are measurements taken in the time domain.
* Column names that begin with an "f" are measurements which have been Fourier tranformed into the frequency domain.
* Std measurements are measurements of standard deviation of that variable. (Which the mean is then taken of)
* Mean measurements are measure of the mean of that variable. (Which the mean is then taken of.)
* X,Y,Z refer to different axes.