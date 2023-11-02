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

matrix1[1, ]  # row 1
matrix1[, 1]  # column 1
matrix1[1, 3]  # row 1, column 3
matrix1[c(1,3), ] # rows 1 and 3

matrix1[1, 1] <- 999


# you might need double brackets [[]] when dealing with lists
list1 <- list(matrix1, 42, c("raindrops on roses", "whiskers on kittens"))
list1
list1[[3]]

# the str() function shows the structure of any object
str(list1)



# Most often, you'll be working with data.frames...
day <- c(1,2,3,1,2,3)
operator <- c("A","A","A","B","B","B")
reading <- c(5,1,2,6,8,9)

# creating a data.frame - note that data.frames can have columns of different types
df1 <- data.frame(day, operator, reading)  
df1

summary(df1)
str(df1)  
names(df1)

df1$day  # extracting the day column by name
df1[, 1]  # can also extract by location, but this is less robust to changes

# fun with logical statements!
df1$day == 1   # we test equality with ==, not =
df1$day != 1   # not equals
!(df1$day == 1)  # ! by itself means "not"
df1$day >= 2     # greater than or equal to

df1$day == 2 & df1$operator == "B"  # & means "and"
df1$day == 2 | df1$operator == "B"  # | means "or"

# using logical statements for subsetting!
df1[df1$day != 1, ]
df1[df1$day == 1 & df1$operator == "A", ]

# using logical statements for assignment!
df1$operator[df1$operator == "A"] <- "Arthur" 
df1$operator[df1$operator == "B"] <- "Beverly" 

# introducing ifelse()... like Excel's =if()
# test, value if true, value if false
df1$day1 <- ifelse(df1$day == 1, "day 1", NA)   # adding a new column with $

# testing for NA
df1[is.na(df1$day1), ]    # cases where df is NA
df1[!is.na(df1$day1), ]   # cases where df is not NA



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



