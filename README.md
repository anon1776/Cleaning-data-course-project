Cleaning-data-course-project
============================

Project for course Getting and Cleaning Data
## First the data must be downloaded
   from 
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
   and unzipped into your working directory, which will create a 
   directory UCI\ HAR\ Dataset containing the data.  The data used will be
   from
       activity_labels.txt      (contents hard-wired into run_analysis.R)
       features.txt
       test/X_test.txt
       test/subject_test.txt
       test/y_test.txt
       train/X_train.txt
       train/subject_train.txt
       train/y_train.txt
## Second you must source the analysis file run_analysis.R.
   This file produces several intermediate files on the way to producing
   the desired text file dataset2.txt.
       The data frame "combined" combines the test and train data sets.
       Names for the variables are obtained from the data file features.txt.
       Then all variables whose name does not contain "mean" or "std" are
         purged from the data frame, and the activities are replaced with
	 their descriptive names from activity_labels.txt.
       At this point we have dataset1, a tidy data set with 81 variables
        (including "student" and "activity") all pertaining to mean or std.
        Note that as permitted by the assignment we have chosen to retain
	variables whose name includes "meanfreq".
       Finally, using library(reshape2), we melt and dcast the data frame
        to summarize each of the variables as a mean for each combination of
	student and activity.   Thus we have a wide data frame dataset2
        with 180 rows (30 students times 6 activities).
        We export dataset2 by using write.table to produce a text file.
