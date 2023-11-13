# ADF&G R Intro Workshop
# Justin Priest & Matt Tyers
# justin.priest@alaska.gov
# matt.tyers@alaska.gov


#####      SCRIPT 3      #####
##### PROGRAMMING BASICS #####


# Welcome back to R!

# It can feel reassuring to know that everything works as expected.  
# The Console, most likely the pane in the lower left, is where code gets
# evaluated and output gets printed.  Click inside the Console, type 1 + 1
# (or something equally exciting), and hit Enter.  

# There's nothing stopping you from running code directly in the Console, 
# but I recommend running it from the code pane (this one) instead.
# This is because:
# - you have a record of everything you did
# - it's MUCH easier to fix mistakes
# - you can easily leave notes using the # character
# - you can save it in a .R file, like this one!

# Click on the line below, and hit Ctrl+Enter (or "Run" in the upper right of this pane)
# Note that the code and output still appear in the Console.
2 * 3


# You can store numbers, results, etc. using "<-"
a <- 10
b <- 20
theAnswer <- a + b

# R didn't print anything to the Console, but if you click on the Environment
# tab, you will see some familiar names!
# Calling a variable name by itself will tell R to print the contents.
theAnswer


# An ordered set of numbers, etc. is referred to as a vector.  You can use the
# c() function to concatenate (stick) multiple elements together.
fibonacci <- c(1, 1, 2, 3, 5, 8, 13, 21)

# Mathematical operations will operate vector-wise, that is, on the whole vector.
fibonacci
fibonacci + 1


# Most mathematical functions will use vector input
x1 <- c(4, 6, 7, 9, 1, 4, 6)
sqrt(x1)
log(x1)
exp(x1)

# Some only make sense with vector input!
mean(x1)
median(x1)
sd(x1)
var(x1)
sd(x1)^2
sum(x1)
prod(x1)
length(x1)
summary(x1)


# Check out what happens if you do math with multiple vectors!
vector1 <- c(1, 2, 3, 4, 5)
vector2 <- c(10, 20, 30, 40, 50)
vector1 * vector2


# what happens if vectors aren't the same length?
c(1, 2, 3, 4) + c(10, 20, 30)   # when the longer length is not a multiple of the shorter
c(1, 2, 3, 4, 5, 6) + c(10, 20, 30)   # when the longer length IS a multiple of the shorter


# The : character can be used to create a regular sequence
x <- 1:10
x
y <- x^2  # vector math again
y
plot(x, y)  # preview of coming attractions!


# The seq() function can be used to create custom sequences
seq(from=10, to=100, by=10)
seq(from=234, to= 3485, length.out=17)  # these are basically random numbers, but R does it!


# You've probably noticed that the Console keeps printing numbers in square
# brackets [1] on the left of output.  
# You can also use square brackets to return subsets of output!
# We will discuss this more later.
fibonacci
fibonacci[4]
fibonacci[1:4]

fibonacci[1] <- 999  # can also use square brackets [ ] to assign values


# You can store text as well as numbers.
maturity_char <- c("Adult", "Juvenile", "Adult", "Adult", "Juvenile")

# Differences between character and factor?
maturity_factor <- as.factor(maturity_char)
maturity_char
maturity_factor

# Notice that summary() behaves differently depending on input
summary(maturity_char)
summary(maturity_factor)

maturity_char[5] <- "Geezer"       # R will do this
maturity_factor[5] <- "Geezer"     # R will NOT do this!



# There are two ways to get help on a function via code, and they do the same thing.
help("rep")
?rep

# Note that you can also search for a function name in the search bar in the help 
# pane, with the same result.





## SAFETY TOOLS ##
# You should know how to stop things. 
# Two common issues are incomplete code, or very long-running code.

  
  
# Long-running code

# Don't worry about the details of this code.
# - Actually, if you're curious, it starts x out with a value of 1 and then keeps
#   adding 1 to it until it's less than zero.  This will most likely not happen.
#   Therefore the code will keep running unless we stop it! 
# Look for a tiny stop sign at the top right of the console.  Esc might work too.
x <- 1
while(x > 0) {
  x <- x+1
  print(x)
}


# Incomplete code

# Look at the below line. It's missing the closing parenthesis. 
# If you click run, it will try to run but fail. Note the "+" in the console.
# This is telling you that it's waiting for you to finish typing a line.
# To escape this, click in the console, then press escape

c(1, 2, 3
  
  



