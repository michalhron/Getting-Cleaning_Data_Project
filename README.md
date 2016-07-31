# Getting-Cleaning_Data_Project

##Procedure Desciption
The run_analysis file:
*  downloads and unzips raw data if not already in working directory
*  Creates vector with names
* Creates a vector to subset by (we are only interested in STD and MEAN data)
* Creates a vector of names to be added later to the data frame
* Reads and joins the test and train data, identifiers of subjects, and activities
* Adds names from step 2) and renames other columns
* Replaces activity codes with numbers
* Creates summary table with means by activity and subjects
* Write this into a file

##Data source:
Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
