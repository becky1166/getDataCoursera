---
title: "readme.md"
output: html_document
---

This repository is for the getting and cleaning data coursera course project.

1. Download the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the file using a standard unzipper such as WinRAR
3. Place the run_analysis.r file in the created directory 
4. Run the run_analysis.r function from within RStudio (or equivalent)

The run_analysis.r function loads in all of the required files, assigns sensible column headers, merges the data into a single dataset, selects the requested columns, assigns the activities meaningful names then outputs the mean of each column to a file.
