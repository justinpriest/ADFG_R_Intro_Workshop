# ADF&G R Intro Workshop
# Justin Priest & Matt Tyers
# justin.priest@alaska.gov
# matt.tyers@alaska.gov


#####         SCRIPT 4           #####
##### PROGRAMMING BASICS, PART 2 #####

### NOTE!! This script is mostly the old version of what JTP did.
#          Below is what we agreed should be in here. 
#          Lines 30+ are the old version, poach and re-arrange! 



# Things to cover in this script:

# RStudio autocomplete
# console output
# case sensitivity
# quotes (single vs double quotes)
# NAs
# vectors vs factors vs lists
# numeric vs character vs logical
# dataframes, data.frame(),
# ==, !=, %in%, 
# factor(), str()
# Packages, install.packages(), library()




## DATA STRUCTURE ##

exampledf <- data.frame(sex = c("Male", "Male", "Female", "Male", "Female", "Female", "Male", "Male", "Female"), 
                        length = c(110, 112, 90, 89, 107, 104, 98, 102, 92), 
                        weight = c(3, 3.4, 2.4, 2.5, 3.0, 2.9, 2.8, 2.8, 2.3),
                        age = c(2, 2, 1, 1, 2, 2, 2, 2, 1),
                        statarea = c(115, 115, 101, 115, 115, 101, 115, 115, 101))

exampledf
head(exampledf) # head() is a good way to see the data
head(exampledf, n=5) 
# by adding a comma, we can use an "argument" to head(), changing the default rows shown
?head

# It is also extremely helpful to know the structure of the dataframe
str(exampledf)
# We see that the sex column is a character and all others are numerical
# The "character" type is for comment strings. We will want to change this to be a "factor". 
# A factor is just a type of categorical variable (unordered)
# You might also notice that statarea probably should *not* be a numerical quantity as well
# So let's change statarea and sex to both be factors

as.factor(exampledf$sex)

exampledf$sex <- as.factor(exampledf$sex)
exampledf$statarea <- as.factor(exampledf$statarea)

str(exampledf)

# Now our data is organized with two categorical variables (sex, statarea) and
# three numerical variables(length, weight, age). Age could be also be a
# category, depending on analysis

# View the data again
exampledf
# We can see that each row is a specific individual fish and applies to only one observation
# This is an example of tidy data and will make analysis easier later
# To the extent possible, try to avoid using tabled or summarized data. 




## DATA TYPES ##
# It is *very* helpful to understand the different types of your data.
# This is something that we're all aware of, but don't often think about explicitly. 
# In general, most data are one of three types of variables: categorical, continuous, or discrete
# Categorical data are a non-numerical category (e.g., species, color, river)
# Continuous data are an number that isn't a count or only integers (e.g., length, time)
# Discrete data are like a hybrid: numbers that can't be split (e.g., count of fish)






## PACKAGES ##
# A package is just a group of functions/commands added together to add more usefulness
# With no extra packages loaded, R has a lot of usefulness but MANY more features are available

# For example, let's say that you want to perform non-linear modeling. Base R doesn't have this!
# So you research other packages for this and find that "mgcv" has the commands you want
# Once you install "mgcv", you can load it anytime you have a script. 
# Next, you'll load "mgcv". Now you can use gam() to fit a generalized additive model

# Remember, you install a package once. You load a package every time you restart R. 

# By convention, we add packages to the top of a script. 
# This makes your script more readable & others can see if they have all required packages 


# If you don't yet have a package, you can install it by running
install.packages("NewPackageName") # Replace NewPackageName with whichever package you want
# Once you install a package, you don't need to do this again (until you update R)
# After a package is installed, to use it, we need to call it every time we open R and want to use it
# To load the library, use:
library(NewPackageName)


# Notice that there are quotes around the package name for installing, but not required for library()
