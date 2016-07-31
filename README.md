# Getting-Cleaning_Data_Project

The run_analysis file:
1) downloads and unzips raw data if not already in working directory
2) Creates vector with names
3) Creates a vector to subset by (we are only interested in STD and MEAN data)
4) Creates a vector of names to be added later to the data frame
5) Reads and joins the test and train data, identifiers of subjects, and activities
6) Adds names from step 2) and renames other columns
7) Replaces activity codes with numbers
8) Creates summary table with means by activity and subjects
9) Write this into a file
