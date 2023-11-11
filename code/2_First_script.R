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



#### Section 2.1 - Welcome ####
# Welcome to R! 
# First off, you should know that a hashtag/pound sign means that every thing to the 
#  right of it is *not* code. R ignores this but we can leave notes to ourselves!

# You are reading this script in the "editor" pane of RStudio (top left)
# If you have the default setup, below this is the "console" (bottom left)
# This whole document in the editor is a "script" and can be edited and saved

# You can edit scripts and "run" them line by line. 
# "Running" code just means telling the computer to perform what is written, 
#  as opposed to writing it. In each line we write "functions". 



#### Section 2.2 - Settings Change ####
# Before we get started too much, let's make one change from the default settings.
# Click Tools -> Global Options. In that pop up, it'll default to General.
#  Midway down under "Workspace", uncheck "Restore .RData into workspace at startup"
#  Change "Save workspace to .RData on exit" to NEVER. 
# This will make your life easier going forward as it means R starts 
#  with a clean slate at every startup, nothing carries over (that's a good thing!)



#### Section 2.3 - "Running" Code ####

# R works by running functions which are a specific evaluation of data.
# A package is a group of new functions that you load to access more features. 
# You can evaluate lines of code to save the result as an "object", most 
# commonly a variable.


# Let's try that now! Evaluate the following lines by clicking your cursor in 
# the line, then clicking "Run" in the upper right. Or you can type Ctrl+Enter 
myvariable <- 1 
myvariable
# Note that this printed to your console AND it's saved in your "Environment" 
# Look at the pane in the upper right and you'll see "myvariable" there

# We can also write directly to the console itself. 
# But this isn't saved in a script to access and review later. 



#### Section 2.4 - Functions ####

# There are also more complicated objects. Let's make a vector by using the function c()
# Everything that we put inside the brackets will be separated by commas
# c is the concatenate function in R and squishes everything together
myvector <- c(1, 3, 5, 7, 9)
myvector
c(2, 4, 6)   # Note that this prints to the console but doesn't save

# Don't worry! We'll cover more about functions in the next section. 
# For now, just note that we can save things (AKA variables) to access later
# Or we can evaluate them only in the console but they aren't saved. 



#### Section 2.5 - Closing & Reopening ####

# Now try this! Let's first note what is in the top right pane labeled "Environment"
# We can see all the variables that we've saved so far. 
# This is a list of everything stored in R's memory of this session.
# OK now the scary part: click save in this script and let's close and reopen RStudio
# Note the line number that you'll want to return here to read the rest...

# You're back! Phew, not so scary was it? This script should have still been shown.
# But let's look at the pane at our Environment in the top right
# It's empty! Nothing we did last time is saved. 
# To re-create those variables, run all the same lines of code. 
# Voila! They're back baby!

