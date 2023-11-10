# ADF&G R Intro Workshop
# Justin Priest & Matt Tyers
# justin.priest@alaska.gov
# matt.tyers@alaska.gov


#####        SCRIPT 5        #####
##### WORKING WITH REAL DATA #####




## DIRECTORIES ##
# Before we import any data, we need to know where on our computer R thinks we are. 
# This location is called the "working directory". 
# It is the folder where R starts looking for files 
# Note that if you're using an RProject, your directory is set automatically

getwd() # Show which working directory we're in

# Note that if your friends don't use an RProject, you will likely have to 
#  manually set your working directory using the function setwd()
setwd("C:/Users/username/Desktop") 
# Use this to set your working directory (if needed) changing to correct folder
# Note that R uses a forward slash instead of the backslash you might be used to 
# If you want to use a backslash, add two of them together
# "C:/Users/username" becomes "C:\\Users\\username"

# We won't cover it today but I recommend using package "here" to find your files
# Never, ever just paste data into R if you want to reproduce it! 



## FOLDER STRUCTURE ##
# It is STRONGLY recommended that you organize all of your RProjects the same
# The typical layout is to have one folder for each RProject with a 
#  standard set of subfolders underneath that named "code", "data", "output", etc.
# That way, you can always find your files and makes sharing easy! 


## DATA CHECK ##
# Before importing your data, you will want to check that it is ready.
# Although we can import data in any file format, it is much easier to use CSV
# If your data is an Excel file, save as CSV. Or re-download from database as CSV

# Next, make sure that you're using data that is:
#  - RAW: Unsummarized and straight from a database
#  - UNTABLED: Does it look like a pivot table? That makes assessment tricky
#  - TIDY: Each column is a variable; each row an observation; every cell a single value



## DATA IMPORT ##
# OK phew! We're ready to import your data! We do this with function read.csv()
# To "read" a file just means to import it; R will "read" it into its memory

read.csv("data/OceanAK_GroundfishSpecimens_2000-2020.csv") 
# Read in file named OceanAK_GroundfishSpecimens_2000-2020.csv from folder "data"
# But this isn't saved!! So let's assign this a name

groundfish <- read.csv("data/OceanAK_GroundfishSpecimens_2000-2020.csv") 
# We save this as a variable named groundfish so that we can access it 

groundfish
# View your data!

# You might notice that there are some things that should be cleaned up in your data.
# We will focus on that in the next major section!


# A better function is available from the tidyverse called read_csv()
library(tidyverse)
read_csv("data/OceanAK_GroundfishSpecimens_2000-2020.csv") 



## ERROR SOLVING ##
# Recall that errors are not problems but rather puzzles to solve! 
# Each error message has a little clue in it to point you in the right direction

# The likely culprits for errors are:
#  Grammar (syntax): Forgetting a comma, parenthesis
#  Misspelling: Misspelling a function, variable, or file will mean R can't find it
#  Package Needs Loading: Running a function from a package will mean that R won't
#                         know what to do! 
# Wrong Directory: R is looking for a file in the wrong location

## Grammar
c(1, 2 4)
summary(c(1, 2, 4) digits = 2) 

## Misspelling
readcsv() # Error in readcsv() : could not find function "readcsv"

## Package Needs Loading
clean_names(groundfish) # Error in clean_names(groundfish) : could not find function "clean_names"

## Wrong Directory 
read.csv("data/whiterussians.csv") # cannot open file 'data/whiterussians.csv': No such file or directory





