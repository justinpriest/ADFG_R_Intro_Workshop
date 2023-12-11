# ADF&G R Intro Workshop
# Justin Priest & Matt Tyers
# justin.priest@alaska.gov
# matt.tyers@alaska.gov

#####  MOTIVATING EXAMPLE  #####
#####      Pink Ratio      #####
# Difficulty: Moderate

# This script is to demonstrate some of the power of R.
# Below, we use real world data that we'll import and clean up.
# Next, we'll plot our data in several ways to visualize it.
# Finally, we'll do some modeling to make inferences and decisions!


### BACKGROUND:
# In Southeast Alaska, run timing of pink salmon can be inferred
#  using the sex ratio of males to females. 
# Earlier in the season there are more males. 
# Plotting and modeling these data gives us an indication of run timing



library(tidyverse)
library(lubridate)



pinkratio <- read_csv("data/OceanAK_PinkSalmonRatio_2000-2020.csv") %>% 
  rename("PercentMales" = "Percent Males",
         "SampleSize" = "Sample Size",
         "StatWeek" = "Stat Week",
         "CatchDate" = "Catch Date",
         "FishWeight_lbs" = "Fish Weight Pounds",
         "NumberFishWeighed" = "Number of Fish Weighed") %>%
  mutate(CatchDate = ymd(as.POSIXct(CatchDate, format = "%m/%d/%Y", tz = "US/Alaska")),
         CatchMonth = month(CatchDate),
         PercentMales_01 = PercentMales / 100) %>%
  filter(StatWeek < 40)
pinkratio


pinkratio %>%
  ggplot(aes(x=StatWeek, y=PercentMales)) +
  geom_point(alpha = 0.5) + 
  geom_smooth(formula = y ~ exp(x / (1 - x)), method = "lm") +
  geom_point(data = pinkratio %>% filter(Year == 2020), color = "orange") +
  scale_x_continuous(breaks = seq(from=25, to=37, by=2)) +
  theme_bw()


pinkratio %>%
  ggplot(aes(x=as.factor(District), y=PercentMales, fill = as.factor(District))) +
  geom_boxplot() +
  labs(fill = "District", x = "District", y = "Percent Males") +
  theme_minimal()



# The glm() function is a Generalized Linear Model which we can use for modeling percent males
# We'll construct a few binomial models, compare the output, and 
pinkmodelfull <- glm(PercentMales_01 ~ StatWeek + Year + District, 
                     family = "binomial", data = pinkratio)

pinkmodel1 <- glm(PercentMales_01 ~ StatWeek, 
                     family = "binomial", data = pinkratio)

pinkmodel2 <- glm(PercentMales_01 ~ StatWeek + Year, 
                     family = "binomial", data = pinkratio)

pinkmodelnull <- glm(PercentMales_01 ~ 1, 
                      family = "binomial", data = pinkratio)

summary(pinkmodelfull)
summary(pinkmodel1)
summary(pinkmodel2)
summary(pinkmodelnull)

AIC(pinkmodelfull, pinkmodel1, pinkmodel2, pinkmodelnull)





