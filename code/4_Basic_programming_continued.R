# ADF&G R Intro Workshop
# Justin Priest & Matt Tyers
# justin.priest@alaska.gov
# matt.tyers@alaska.gov


#####         SCRIPT 4           #####
##### PROGRAMMING BASICS, PART 2 #####



# How to take things apart & put things together
# We can use square brackets to retrieve or assign subsets
x1 <- c(1, 1, 2, 3, 5, 8, 13, 21)
x1
x1[4]
x1[1:4]
x1[5:length(x1)]  # remind ourselves what length(x1) does!

# negative indices exclude items
x1[-4]


# Indices with 2+ dimensions!
# first defining a matrix
matrix1 <- matrix(1:12, nrow=4, ncol=3)
matrix1

matrix1[1, ]  # row 1
matrix1[, 1]  # column 1
matrix1[1, 3]  # row 1, column 3
matrix1[c(1,3), ] # rows 1 and 3

matrix1[1, 1] <- 999
matrix1


# you might need double brackets [[]] when dealing with lists
list1 <- list(matrix1, 42, c("raindrops on roses", "whiskers on kittens"))
list1
list1[[3]]

# the str() function shows the structure of any object
str(list1)


# or, if list elements have names, you can also use $ to extract things with names
list1 <- list(amazingData=matrix1, 
              meaningOfLife=42, 
              myFavoriteThings=c("raindrops on roses", "whiskers on kittens"))
list1
list1$myFavoriteThings   # grabbing the last element by name
list1[[3]]               # and also by index!

# the str() function shows the structure of any object
str(list1)



# Most often, you'll be working with data.frames...
df1 <- data.frame(day = c(1, 2, 3, 1, 2, 3),
                  operator = c("A", "A", "A", "B", "B", "B"),
                  reading = c(5, 1, 2, 6, 999, 9))

summary(df1)  # summary() summarizes all columns using the appropriate methods!
str(df1)  
names(df1)  # names() just prints names

df1$day  # extracting the day column by name
df1[, 1]  # can also extract by location, but this is less robust to changes


# fun with logical statements!
df1$operator == "B"   # we test equality with ==, not =
df1$operator != "B"   # not equals
!(df1$operator == "B")  # ! means not

df1[df1$day == 2, ]  # subsetting for day==2
df1[df1$day != 2, ]  # subsetting for day NOT EQUALS 2
df1[!(df1$day == 2), ]  # subsetting for day NOT EQUALS 2, a different way

two_B <- df1[df1$day == 2 & df1$operator == "B", ]
not_two_B <- df1[!(df1$day == 2 & df1$operator == "B"), ]

# using logical statements for assignment!
df1$operator[df1$operator == "A"] <- "Arthur" 
df1$operator[df1$operator == "B"] <- "Beverly" 

# introducing ifelse()... like Excel's =if()
# test, value if true, value if false
df1$day1 <- ifelse(df1$day == 1, "day 1", NA)   # adding a new column with $

# testing for NA
df1[is.na(df1$day1), ]    # cases where df is NA
df1[!is.na(df1$day1), ]   # cases where df is not NA

# Challenge: Beverly's machine was malfunctioning on day 2!! 
# Recode the 999 as NA
df1
df1_fix1 <- df1 # so we keep the original intact
df1_fix1[5, 3] <- NA

df1_fix2 <- df1
df1_fix2$reading[5] <- NA

df1_fix3 <- df1
df1_fix3[df1_fix3$operator=="Beverly" & df1_fix3$day==2, 3] <- NA

df1_fix4 <- df1
df1_fix4$reading[df1_fix4$operator=="Beverly" & df1_fix4$day==2] <- NA

## discussion: all of these will work, but #4 is probably the best.  Why?
## - most robust to reordering of the dataset
## - guaranteed to be the right value (eliminates human error from mis-counting indices)


# Other ways of sticking things together
a <- 1:3
b <- 7:9
rbind(a, b)  # by row
cbind(a, b)  # by column
c(a, b)      # lengthwise



# Installing packages!
install.packages("recapr")   # installing a very simple package to your computer
help(vChapman)               # accessing the contents doesn't work yet ...
library("recapr")       # you have to load the package first
help(vChapman)          # ... now it works!

# This might take a few minutes, but we highly recommend this collection
# of packages...
install.packages("tidyverse")

# we'll start working with them soon!



