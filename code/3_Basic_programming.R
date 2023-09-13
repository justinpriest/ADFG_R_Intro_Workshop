# ADF&G R Intro Workshop
# Justin Priest & Matt Tyers
# justin.priest@alaska.gov
# matt.tyers@alaska.gov


#####      SCRIPT 3      #####
##### PROGRAMMING BASICS #####

### NOTE!! This script is mostly the old version of what JTP did.
#          Below is what we agreed should be in here. 
#          Lines 35+ are the old version, poach and re-arrange! 


# What is a function?
#     arguments
# What is a variable?
# Dataframe
# factor
# <- and =
# c()
# brackets[]
# tilde ~
# $
# pound/hash #

# R as a calculator! 
sqrt()
log()
mean()






mynewvector = c("Adult", "Juvenile", "Adult", "Adult")
mynewvector
# Now let's make a "factor" which is a categorical grouping
factor(c("Male", "Female", "Female"))

# Most commonly we'll use dataframes which are kind of like a bunch of vectors together
mydf = data.frame(col_name1 = c("Male", "Female", "Female"),
                  col_name2 = c(130, 115, 120))   
mydf
# It's OK to break to the next line. On the line above, press enter after a comma
# Line breaks MUST be after a comma or something equivalent
# Also, look to the "Environment" pane (top right), click on "mydf" over there. Very cool!
# I think of dataframes like a spreadsheet with columns and rows.

# But note that things need to be of equal lengths. Watch for the error message 
data.frame(new1 = myvector, new2 = mynewvector)
# myvector was 5 "units" long while mynewvector was 4 units long. 
# R doesn't let you make a mistake

# So far we've only set things using an equals sign. More commonly we use an arrow "<-"
# You can't use <- inside a function ever, so that's why we keep these separate 
myvector <- c(2, 4, 5, 8, 10)
myvector 
# Note that we've overwritten "myvector" now. This can be dangerous. 
# As such, it's considered poor practice to reuse variables, always make a new one

# Have you noticed so far that R is case sensitive? 
# What do you think will happen next? Make your predictions, then run the next 2 lines:
Myvector
Factor(c("Male", "Female", "Female"))

# Note that our script is sequential, but it doesn't *have* to be. 
# If you went above and changed myvector to Myvector, it would run. 
# You could also save variables in the console (BUT DON'T DO THIS)



# Now let's subset a part of a vector. Square brackets tell us to take a certain element
# For our vector, if we want the 4th element of it, we'd do the following:
myvector[4]

# What about for our dataframe? What do you predict will happen?
mydf[4]
# Because we have rows AND columns, there is no single 4th element
# We can specify by mydf[rownumber, columnnumber]
mydf[1,2]
mydf[,2]
# This shows the whole column
# For dataframes, an easier way to specify this is using $
mydf$col_name1


# Grammar to note for later: 
# - We use double equals "==" to check for equivalency (not the same as setting equal to, "=")
# - The exclamation point "!" means "not", ampersand "&" means "and", bar "|" means "or"

# To inspect the structure of a dataframe use str()
str(mydf)
# This is very useful to make sure that we've set the column types correctly


# Sometimes to clean things up we use rm() to remove an object
rm(myvector)
# Bye bye myvector. So long and thanks for all the fish





# This code randomizes the order of the items we tell it:
sample(c("Chris", "Bobette", "Erik", "Ulrich", "Sean", "Maureen", 
         "Keegan", "Elisa", "Matt", "William", "Philip", "Alisa",
         "Daphne", "Dawn", "Chandra", "Morgan", "Andy", "Wyatt", "Eric"))




myvector <- c(2, 4, 5, 8, 
              10, NA)

mean(myvector, na.rm = TRUE)



# Equals vs left arrow
x1 = c(10, 8, 10, 12)
x1
x2 <- c(10, 8, 10, 12)
x2
# They're the same! For now though, set variables and everything using the left arrow


## Simple Math ##
# We can calculate simple math of our items
mean(x1)
median(x1)
log(x1)
sqrt(x1)
sum(x1)
# Notice how R is "vectorized". This just means that in a vector, it performs the action
#  on all of the individual items inside it. sum() and mean() work on the whole vector


## Subsetting & Dataframes ##
# As we saw before, brackets subset data
x3 <- c(2,4,6,8,10)
x3[5]


myfirstdf <- data.frame(sex = c("Male", "Male", "Female", "Female"), 
                        species = c("coho", "coho", "pcod", "herring"),
                        length = c(110, 112, 90, 82), 
                        weight = c(3, 3.4, 2.4, 2.1),
                        age = c(2, 2, 1, 1))
myfirstdf
# Now look in the "Environment" Pane in the top right. You should see 'myfirstdf' up there
# Click on myfirstdf and it will open in a new tab! The same thing in code is:
View(myfirstdf)
# You can sort or filter it here without changing anything


## Object Types ##
str(myfirstdf)



## Learning about a function ##
# Type a question mark before the function or search in 'Help' in the right bottom pane
?seq()

# An "argument" is a way for us to specify certain criteria of the R function: 
#  below, we will give arguments for where to start ("from"), where to end ("to"),
#  and how often to increment. 

seq(from = 10, to = 40, by = 3)




## Things that fail ##
c("one", "two", "three", five) # Why did this fail? It's looking for an object named five
c(1,2,3,4,5)) # An out of place parenthesis stops the code

data.frame(variable1 = c(1, 2, 3, 4, 5), variable2 = c(A, B, C, D, E))

data.frame(variable1 = c(1, 2, 3, 4, 5), 
           variable2 = c("A", "B", "C", "D", "E", "F"))
# The above items fail because 1) variable2 calls object A, object B, etc and those don't exist
# and 2) because there are uneven columns 




## SAFETY TOOLS ##
# You should know how to stop things. 
# Two common issues are slow running code (e.g., complex model), or incomplete code.

# Slow code:
# Don't even try to read the following code. Run it and it will take forever.
# Just use this to practice getting out of a long running command. 
# Look for a tiny stop sign in the top right of the console
for(i in 1:10000){
  .z <- rnorm(5, i, 2)
  print(summary(lm(.z ~1)))
}

# Incomplete code
# Look at the below line. It's missing the closing parenthesis. 
# If you click run, it will try to run but fail. Note the "+" in the console.
# To escape this, click in the console, then press escape

c(1, 2, 3

  