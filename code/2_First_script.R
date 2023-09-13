# ADF&G R Intro Workshop
# Justin Priest & Matt Tyers
# justin.priest@alaska.gov
# matt.tyers@alaska.gov


##### SCRIPT 2 ####
##### ABOUT R #####


### NOTE!! This script contains minimal coding. 
#          Most things won't be saved in this script but rather demonstrated in class

# In PowerPoint: 
#      R sales pitch 
#      R vs Excel / when to use, 
#      Difference between R & RStudio, 
# This script / demonstrate these actions:
#      How to open RStudio (close out and reopen several times)
#      .RProj, 
#      RStudio layout
#      RStudio settings (change to not save workspace)
#      running a line




# Welcome to R! 
# First off, you should know that a hashtag/pound sign means that every thing to the 
#  right of it is *not* code. R ignores this but we can leave notes to ourselves!


# You are reading this script in the "editor" pane of RStudio
# If you have the default setup, below this is the "console"
# This whole document in the editor is a "script" and can be edited and saved

# You can edit scripts and "run" them line by line. 
# "Running" code just means telling the computer to perform what is written, 
#  as opposed to writing it. In each line we write "functions". 


# R works by running functions which are a specific evaluation of data
# A package is a group of new functions that you load to access more features 
# You can evaluate your function to save it as an "object", most commonly a variable


# Let's try that now! Evaluate the following lines by clicking your cursor in 
# the line, then clicking "Run" in the upper right. Or you can type Ctrl+Enter 
myvariable = 1 
myvariable
# Note that this printed to your console AND it's saved in your "Environment" 
# Look at the pane in the upper right and you'll see "myvariable" there

# We can also write directly to the console itself. 
# But this isn't saved in a script to access and review later. 


# There are also more complicated objects. Let's make a vector by using the function c()
# Everything that we put inside the brackets will be separated by commas
# c is the concatenate function in R and squishes everything together
myvector = c(1, 3, 5, 7, 9)
myvector
c(2, 4, 6)   # Note that this prints to the console but doesn't save



# Don't worry! We'll cover more about functions in the next section. 
# For now, just note that we can save things (AKA variables) to access later
# Or we can evaluate them only in the console but they aren't saved. 

