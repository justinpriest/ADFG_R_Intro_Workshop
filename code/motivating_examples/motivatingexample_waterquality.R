# R Intro AFS
# Justin Priest
# justin.priest@alaska.gov

#####  MOTIVATING EXAMPLE 2  #####
#####     Water Quality      #####

# Difficulty: Easy / Moderate 

# This script is to demonstrate some of the power of R.
# Below, we use real world data that we'll import and clean up.
# Next, we'll plot our data in several ways to visualize it.


### BACKGROUND:
# This dataset was provided by the Alaska Department of Environmental Conservation
# Annual measurements of water quality are taken at many locations to 
#  assess 


library(tidyverse)
library(lubridate)


waterquality2016 <- read_csv("data/DEC_waterquality_2016.csv", skip = 1) %>% # The skip argument tells us to skip 1 line
  rename("sampledate" =`Activity Start Date`, 
         "sampletime" = `Activity Start Time`,
         "location" = `Monitoring Location Name`,
         "lat" = `Monitoring Location Latitude`,
         "long" = `Monitoring Location Longitude`,
         "measurementtype" = `Characteristic Name`,	
         "value" = `Result Value`,
         "units" = `Result Unit`) %>%
  mutate(sampledate = ymd(as.POSIXct(sampledate, format = "%m/%d/%Y", tz = "US/Alaska")),
         samplemonth = month(sampledate))


# Let's plot the turbidity over time, by each location
waterquality2016 %>%
  filter(measurementtype == "Turbidity") %>%
  ggplot(aes(x = sampledate, y = value, color = location)) +
  geom_line() + 
  labs(y = "Turbidity") #+ facet_wrap(~location) # remove the comment to plot a "facet"


# Summarize the turbidity by month at Boulder Creek
waterquality2016 %>%
  filter(measurementtype == "Turbidity",
         location == "Boulder Creek") %>%
  group_by(samplemonth) %>%
  summarise(meanturbidity = mean(value),
            samplecount = length(value))




# For a hypothetical analysis, let's pretend that a water quality manager
#  would like to know whether the turbidity is significantly different 
#  between two streams, Boulder Creek and Deadwood Creek. 

# First let's create a subset of the data to work with
samplestreams <- waterquality2016 %>%
  filter(measurementtype == "Turbidity",
         location == "Boulder Creek" | location == "Deadwood Creek")

# Look at the means
samplestreams %>%
  group_by(location) %>%
  summarise(meanturbidity = mean(value, na.rm = TRUE))

samplestreams %>%
  ggplot(aes(x = location, y = value, fill = location)) +
  geom_boxplot() +
  theme_light()
# Boulder Creek has higher average mean turbidity. But is it significant?


# Test the significance using an ANOVA with the function aov()
# To learn more about the aov function, run this in the console:  ?aov
summary(aov(value ~ location, data = samplestreams))

# We conclude that though Boulder Creek has a higher mean turbidity, 
#  this difference is insignificant. 
# (Side note: always be cautious when interpreting "unbalanced" data,
#   where you might have more samples or different sample timing)

