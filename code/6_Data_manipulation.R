# ADF&G R Intro Workshop
# Justin Priest & Matt Tyers
# justin.priest@alaska.gov
# matt.tyers@alaska.gov

#####         SCRIPT 6        #####
##### BASIC DATA MANIPULATION #####

# This script will walk you through the basics of data manipulation in R. 
# There are two examples to teach the same concepts: 
#   - Part 1 using sockeye ASL data
#   - Part 2 using groundfish length data


# This section will rely heavily on using the package "dplyr" in the tidyverse group of packages
# You can do everything that we'll cover using just base R but it's often more cumbersome
library(tidyverse)


## WHY MODIFY DATA IN R ##

# When first starting out, it is very tempting to fix everything in Excel, then import it in R
# This is certainly acceptable when you're new and gets you to start analysis earlier. 
# However, it makes things longer if you'll ever have to add new data and re-do all the same changes
# For example, if data always comes out of a database in a certain format and with different column names
# If you wanted to re-perform analysis when more data is available, doing these changes in R can save time




#### PART 1 - SOCKEYE ASL ####

# reading a messy real-life ASL dataset!
sockeye_raw <- read_csv("data/sockeyeASL.csv")  

# if you have problems importing the above file, uncomment and run the line below:
# sockeye_raw <- read_csv("https://raw.githubusercontent.com/justinpriest/ADFG_R_Intro_Workshop/main/data/sockeyeASL.csv")


# inspecting the data  
str(sockeye_raw)

# Impressions:
# - column names could be improved
# - probably don't need to keep all columns for this analysis
# - need to table Species and Sample Type to see how many values exist
# - need to tabulate Sex and AGE 
# - need to choose a length variable and plot it to check for wonky values



## THE PIPE ##
# One shortcut that comes with dplyr is the pipe operator. This is written as %>%
# The pipe passes the results of the object/function on the left to the function on the right
# This sounds complicated but makes code much more readable, and less repetitive



# Let's create a cleaned dataset!
# strategy: add one piece at a time to the pipeline, 
# then run the summaries below it, adding summaries as needed
# The pipe will "pass" the object on the left as the data argument to the right
sockeye <- sockeye_raw %>% 
  select(age, sex, length_me_fork, unique_sample_id) %>%
  rename(length = length_me_fork) %>%
  filter(length > 300,
         sex %in% c("F", "M"),
         !(age %in% c("E4", "E5")))

# What did the lines above do?
#  - Start with the raw dataset
#  - apply function clean_names() from the janitor package (this makes column names standard)
#  - Keep ("select") only columns age, sex, length_me_fork, and unique_sample_id
#  - Rename length_me_fork to just length
#  - filter to keep lengths above 300 mm, keep only M/F, exclude ages E4 & E5 


# Let's look at this again to inspect what we did
str(sockeye)
plot(sockeye$length)
table(sockeye$age, sockeye$sex, useNA = "ifany")
# Great! Our data looks a lot better!


# Now let's summarize our data to get  better understanding
#   - We can use the function summarise() to make this for us! 

# First ASL summary table: all samples pooled
sockeye %>%
  summarise(n = n(),                          # sample size
            mean_ln = mean(length),           # mean length
            sd_ln = sd(length),               # SD of length
            se_ln = sd(length) / sqrt(n()))   # SE of mean length
# Interesting results. But let's break apart by a group...


# The next function is group_by() combined with summarise()
# This makes almost a pivot table summary of our data! 

# Second ASL summary table: separated by sex
# Note: most of this is literally copy-pasted from the first!
# New additions are annotated
sockeye %>%
  group_by(sex) %>%          # now grouping by sex before summarising
  summarise(n = n(), 
            mean_ln = mean(length), 
            sd_ln = sd(length),
            se_ln = sd(length) / sqrt(n()))  %>% 
  ungroup() %>%                        # ungrouping to make sure proportions work
  mutate(p_hat = n / sum(n)) %>%       # adding a column: proportion
  mutate(se_p_hat = sqrt(p_hat * (1 - p_hat) / (sum(n) - 1)))  # adding a column: SE of prop
# NOTE: if we had taken out the steps to filter sex and age,
# we could add the sex filter here!!



# Third ASL summary table: separated by sex and age
# Almost all of this is copy-pasted from the second!
# Only one new addition!
sockeye %>%
  group_by(sex, age) %>%     # now grouping by sex and age, the rest is the same
  summarise(n = n(),
            mean_ln = mean(length),
            sd_ln = sd(length),
            se_ln = sd(length) / sqrt(n()))  %>%
  ungroup() %>%
  mutate(p_hat = n / sum(n)) %>%
  mutate(se_p_hat = sqrt(p_hat * (1 - p_hat) / (sum(n) - 1)))
# NOTE: if we had taken out the steps to filter sex and age, 
# we could add the both back here!!


# Linking to data from an external table:
# Origin information from otolith samples!

# first reading these:
sockeyeOrigin <- read_csv("data/sockeyeOrigin.csv")

# if you have problems importing the above file, uncomment and run the line below:
# sockeye_raw <- read_csv("https://raw.githubusercontent.com/justinpriest/ADFG_R_Intro_Workshop/main/data/sockeyeOrigin.csv")

# joining the two files!  Note that they both have a column named "unique_sample_id"
sockeye_with_origin <- sockeye %>% 
  left_join(sockeyeOrigin)
sockeye_with_origin
# Would ya look at that?! We have some amazing data here! 





#### PART 2 - GROUNDFISH ####
# This part will walk through similar concepts as above to solidify everything. 

## THE PIPE ##
# One shortcut that comes with dplyr is the pipe operator. This is written as %>%
# The pipe passes the results of the object/function on the left to the function on the right
# This sounds complicated but makes code much more readable, and less repetitive

# Here's our code from before, in Base R

# groundfish <- read_csv("data/OceanAK_GroundfishSpecimens_2000-2020.csv") # Read in file from folder "data"
groundfish <- read_csv("https://raw.githubusercontent.com/justinpriest/ADFG_R_Intro_Workshop/main/data/OceanAK_GroundfishSpecimens_2000-2020.csv") # Read in file from folder "data"

groundfish <- rename(groundfish,"length_mm" = "Length Millimeters", 
                     "weight_kg" = "Weight Kilograms") 
groundfish <- dplyr::select(groundfish, Year, Species, Sex, Age, length_mm, weight_kg) 
groundfish <- filter(groundfish, Species == "Sablefish")

# Here's the same results but with the pipe
# groundfish <- read_csv("data/OceanAK_GroundfishSpecimens_2000-2020.csv") %>% # Read in file from folder "data"
groundfish <- read_csv("https://raw.githubusercontent.com/justinpriest/ADFG_R_Intro_Workshop/main/data/OceanAK_GroundfishSpecimens_2000-2020.csv") %>% # Read in file from folder "data"
  rename("length_mm" = "Length Millimeters", 
         "weight_kg" = "Weight Kilograms") %>%
  dplyr::select(Year, Species, Sex, Age, length_mm, weight_kg) %>%
  filter(Species == "Sablefish")




# Notice how many more fewer times we had to write "groundfish"
# Another advantage is that all code is evaluated at once without running risk of lines being out of order

# When writing your own pipes, I HIGHLY recommend writing them line by line, one at a time. 
# This will let you know immediately which line isn't working

# One common mistake when first starting out is trying to pipe just one column. 
# The following will not work:
groundfish$Species %>% filter(Species == "Sablefish")



## KEEPING AND RENAMING COLUMNS  ##
# Often the first thing to do is to rename columns to be something more memorable and/or usable
# Use function rename() for this.
groundfish %>% rename("Species_common" = "Species")

# Another useful function allows you to keep or drop columns, using select()
groundfish %>% select(Species, Age, length_mm) # Keep only the columns listed
groundfish %>% select(-weight_kg) # Drop the columns listed, keep everything else



## FILTERING ##
# To remove extraneous data, we use the dplyr function filter() 
# We can use operators to keep (==), or remove (!=) rows that meet the conditions we set
groundfish %>% filter(Sex == "Female") # Single criteria
groundfish %>% filter(Sex == "Female", Age != 2, length_mm >= 200) # Multiple criteria
# The above row keeps groundfish data for only female fish that are not age 2, and greater than or equal to 200 mm


# One common issue is dealing with NAs
# Because an NA is essentially an unknown, we can't set a filter to be equal to an NA
# Here's an example: the sex of fish 1 and fish 2 is both unknown. 
# Is the sex of fish 1 equal to that of fish 2? It's unknown! 
# Therefore checking if something is equal to NA will always return an NA. 
# To get around this, we use the function is.na()

problemfish <- groundfish %>% filter(is.na(length_mm)) # Show rows where length is unknown
groundfish <- groundfish %>% filter(!is.na(length_mm)) # Remove rows where length is unknown


# We can also filter to a list of specified items using the shortcut "%in%"
# This helps keep your code much more readable if you have a long filter list!
keepyears <- c(2000, 2001, 2006, 2018)
keepyears
groundfish %>% filter(Year %in% keepyears)



## ADD A NEW COLUMN ## 
# We can also add new columns using mutate()
groundfish <- groundfish %>% mutate(weight_lb = weight_kg * 2.2) # Convert weight to pounds
groundfish

groundfish <- groundfish %>% mutate(comments = "Sample is good") # This makes the same comment in every row
groundfish

groundfish %>% mutate(grams_per_mm = (weight_kg * 1000) / length_mm)


# A slightly more complex approach can be to use an if else statement to conditionally set a value
groundfish <- groundfish %>% 
  mutate(biggie_smalls = ifelse(length_mm >= 600, "Big fish", "Small fish"))
groundfish
# This nested if statement checks if a fish is greater than or equal to 700 mm.
# If it is then it calls them "Big fish", otherwise they are "small fish"


# ifelse about NAs
# What about if we wanted to make a comment about whether the fish was aged?
groundfish <- groundfish %>% 
  mutate(comments = ifelse(is.na(Age), "Not aged", "Sample is good"))
View(groundfish)




## REPLACE A VALUE ##
# Commonly, we'll need to replace a character value with something else
# This is done using the function case_match() (case_when() is even more powerful!)
# case_match() using slightly different syntax than we've seen so far:
#  - The first argument is which column to look in
#  - Secondly, it looks for what to match on left side of tilde and 
#     replaces it with what we've written on the right side
#  - Lastly, if it can't find the phrase on the left side, default to something

groundfish %>% 
  mutate(biggie_smalls = case_match(biggie_smalls, 
                                    "Small fish" ~ "small and medium sized",
                                    .default=biggie_smalls))
# The above looks in column biggie_smalls for cells labeled "Small fish" and
#  replaces that with "small and medium sized". If it doesn't find a cell with
#  "Small fish", leave it alone and keep the orginal values in that column. 

groundfish %>% 
  mutate(biggie_smalls = ifelse(biggie_smalls == "Small fish", "small and medium sized", biggie_smalls))
# This is very similar behavior to an ifelse() statement

groundfish %>% mutate(Sex = case_match(Sex, "Female" ~ "F", "Male" ~ "M", .default=Sex))
groundfish

# Less commonly, previous biologists might have been slackers and used a blank to mean a zero
# That isn't true for this database (way to go ADF&G Groundfish Team!). 
# But for the sake of learning, we'll cover it
# Function "replace_na()" from library "tidyr" has a function made just for this

groundfish_altered <- groundfish %>% mutate(Age = replace_na(Age, 0))
groundfish_altered

mean(groundfish$Age, na.rm = TRUE)
mean(groundfish_altered$Age, na.rm = TRUE)


## OTHER USEFUL FUNCTIONS ## 

distinct()
# Useful by itself for listing unique values of a variable
# E.g., in a column of vessel names, list all vessel names
# Won't go through this now, but can check this out later



#### EXPORTING ####
# While typically we want to just keep everything *in* R and only work on here, 
# often its worthwhile to export the data.

# The easiest way to do this is to use the function write.csv()
#write.csv(groundfish, file = "data/sablefishexport.csv")
