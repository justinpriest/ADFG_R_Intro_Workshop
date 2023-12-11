---
title: "Vocabulary Cheatsheet"
output: word_document
---

## Section 2 - About R and RStudio

* **RStudio** runs **R** in the background
  - You can run R by itself, but RStudio is nicer to work with and we highly recommend it
* **Panes** in RStudio:
  - **Script Editor** (default top left): Where you can write code before evaluating it
  - **Console** (default bottom left): Where code is evaluated and output is seen
  - **Environment** (default top right): Where you can view variables/objects in R's memory
  - **Plot/Help** (default bottom right)
* Highly recommended setting: 
  - Settings > Tools > General Options
  - Then change "Save worksace to .RData on exit" to **Never**
* **RStudio Projects** (**.Rproj** files) are recommended because they:
  - help organize files associated with a specific work project
  - facilitate data import by automatically setting the working directory
* The **"Run"** button or **ctrl+enter** will send to the Console and evaluate:
  - Whatever line the cursor is on (in the Script Editor pane), or
  - Whatever is highlighted, which can be part of a line or multiple lines at once

\pagebreak

## Section 3 - Programming Basics I

-   **\<-** stores results to a variable or object
-   **c()** combines a set of numbers (or other input) into a vector
-   a **vector** is an ordered set (like a column in Excel)
-   vector operations use relative position
-   number1**:**number2 constructs an integer sequence between number1 and number2
-   **seq()** constructs a custom sequence
-   **?function1** or **help("function1")** accesses R Help for function1
-   math operators:
    -   **+, -, \*, /, \^, (, )**
    -   **sqrt(), log(), exp(), abs()**
    -   **sum(), prod()**
    -   **mean(), median(), quantile(), sd(), var()**
-   **NA** is a placeholder for an unknown value
-   classes of vectors (different types of information)
    -   **logical**: TRUE or FALSE
    -   **numeric**: numbers
    -   **factor**: categories
    -   **character**: text
-   **\#** lets you add notes to the end of a line
-   **\<esc\>** in console lets you escape incomplete lines
-   clicking the **red stop sign** lets you escape long-running code

\pagebreak

## Section 4 - Programming Basics II

-   for **vectors** (data in order)
    -   MyVector**[49]** selects the 49th element of MyVector
-   For **matrices** and **data.frames** (data in rows and columns)
    -   MyMatrix**[2, 3]** selects the element at row 2, column 3
    -   MyMatrix**[2, ]** selects all of row 2
    -   MyMatrix**[, 3]** selects all of column 3
-   For **data.frames**
    -   MyDataFrame**\$**ThisColumn selects the column named ThisColumn
-   For **lists**
    -   MyList**[[2]]** selects the 2nd piece of MyList
    -   MyList**\$**ThisPiece selects piece named ThisPiece
-   **str()** prints the complete structure of any object
-   You can also use logical statements inside square brackets
    -   year**[year \> 2014]** selects the subset of year that is greater than 2014
-   Logical operators:
    -   **==** and **!=** equal to and not equal to
    -   **\<, \<=, \>, \>=** less than (or equal to), greater than (or equal to)
    -   **&** and (intersection, TRUE if both sides are TRUE)
    -   **\|** or (union, TRUE if one side is TRUE)
    -   **!** not (flips TRUE to FALSE and FALSE to TRUE)
    -   **xor()** exclusive or (TRUE if exactly one side is TRUE)
    -   **%in%** is a member of (has value TRUE if LHS element is in RHS vector)
-   **is.na()** returns TRUE for elements of a vector that are NA, and FALSE otherwise
-   **!is.na()** returns TRUE for elements of a vector that are not NA, and FALSE otherwise
-   **ifelse()** constructs a vector based on a logical statement
    -   ifelse(LogicalStatement, WhatIfTRUE, WhatIfFALSE)
        -   ifelse(length \> 400, "Big fish", "Small fish") \# can use single values
        -   ifelse(units == "kg", weight, weight/2.2) \# can use vectors

\pagebreak

## Section 5 - Reading Real Data

-   A package is a group of new functions to extend your power! 
    -   **install.packages("tidyverse")** installs the tidyverse package for the first time (run this ONCE)
    -   **library(tidyverse)** loads the tidyverse package when you need it (each time you open the file)
- We recommend a **separate folder for each work project**, with subfolders for:
  - data
  - code 
  - output
  - etc, depending on project
- A **directory** is a location on your computer (which folder/subfolder)
- **getwd()** prints the folder that R is currently set to
  - its cousin **setwd()** sets R to a folder you specify, but you will not need this if you use RStudio Projects
- **file.choose()** prints the full location of a file!
- With RStudio Projects (.Rproj file) we can use **relative file paths**
  - full path: C:/Users/jtpriest/ADFG_R_Intro_Workshop/code/2_First_script.R
  - relative path: code/2_First_script.R
- Data should be:
  - **Machine Readable**: don't use color/formatting to convey info
  - **Unsummarized and Raw**: try not to edit it before importing into R
  - **Untabled**: use "long" format (lots of rows)
    - to see if you're using long format, think "where would a comment go?"
  - **Tidy**:
    - Every column is a variable
    - Every row is an observation
    - Every cell is a single value
- **read_csv()** "reads"" (AKA imports) a .csv file.  **read_csv() is in the tidyverse set of packages**.  If the file is in a subfolder, use one of:
  - `read_csv("folderlocation/filename.csv")`
  - `read_csv("folderlocation\\filename.csv")`
- Don't use the RStudio Import Wizard!  No one will know what you chose.
- **View()** views a data.frame by opening in a new tab 
- **summary()** prints a summary of all rows of a data.frame


\pagebreak

## Section 6 - Data Manipulation with tidyverse

-   The pipe operator **%\>%**
    -   **function1(x)** can be rewritten as **x %\>% function1()**
    -   **function1(x, args1)** can be rewritten as **x %\>% function1(args1)**
-   Core tidyverse verbs:
    -   **select()** keep certain columns  
        `x %>% select(column1, column2)`

    -   **filter()** keep certain rows  
        `x %>% filter(year==2023, species=="Chinook")`

    -   **mutate()** transform a column, or create a new one  
        `x %>% mutate(CPUE = catch/hours)`

    -   **rename()** rename columns  
        `x %>% rename(NewCol1=OldCol1, NewCol2=OldCol2)`

-   some more useful tidyverse verbs:
    -   **left_join()** join two data.frames with a matched column
    -   **group_by() %\>% summarise()** create a summary  
        `x %>% group_by(species) %>%`  
        `summarise(n = n(),`   
                   `mn_length = mean(length), sd_length = sd(length))`

    -   **pivot_longer()** and **pivot_wider()** go between wide and long format data
-   some useful summary functions from base R
    -   **names()** returns the names of an object (or column names in a data.frame)
    -   **str()** prints the complete structure of an object
    -   **summary()** prints a class-specific summary of an object
    -   **head()** and **tail()** prints the first (last) few rows of a data.frame
    -   **table()** returns a table of unique values
        -   Use argument **useNA='ifany'** to tabulate NA values also
-   some handy functions for dealing with next & names (note: **package::function()**)
    -   **str_trim()** and **str_squish()** standardizes whitespace in a char vector
        -   These are loaded with tidyverse (stringr package)
    -   **janitor::clean_names()** standardizes names of a data.frame
    -   **snakecase::to_snake_case()** standardizes a char vector to snake_case
        -   **snakecase::to_any_case()** standardizes a char vector to any case
    -   **tolower()** and **toupper()** takes a char vector to all lower (upper) case
        -   These are in base R



\pagebreak

## Section 7 - Amazing Charts with ggplot2

-   R includes the function **plot()** which helps for quick plotting
    -   `plot(mydataframe$xcolumn, mydataframe$ycolumn)`
-   One of the tidyverse packages (**ggplot2**) makes advanced plots very easy
-   Each ggplot contains 3 core functions: 
    -   **ggplot()** - set the data & aesthetics (see next bullet)
    -   **aes()** - usually _inside_ the ggplot function. Set the x column, y column, color variable (if wanted), and other dynamic (varying) items 
    -   **geom_()** - family of functions to set what kind of plot (e.g., `geom_point()` would make a scatterplot; `geom_line()` would make a line plot)
-   Each ggplot line is connected with the **+** symbol:
    -   `ggplot(data = mydataframe, aes(x = xcolumn, y = ycolumn)) +`   \
    `geom_point()`
-   The `scale_` family of functions are optional to modify your plot. Dozens of choices!
    -   `scale_y_continuous(breaks = c(5, 8, 10, 13, 15))` would manually set breaks (ticks) on the y-axis at 5, 8, 13, and 15
    -   `scale_color_manual(values = c("red", "lightblue"))` would manually set color for two items 
-   Dynamic vs static: items inside aes() are variables (changeable), outside are static
    -   `geom_point(color = "red")` sets all points to red
    -   `aes(x=xcol, y=ycol, color=species)` varies color by  species column
-   **labs()** can set axis labels, title, etc.
    -   `labs(x = "My x axis label", title = "Amazing plot title")`
-   Customize appearance elements with **theme()** arguments or pre-set themes
    -   Several options include `theme_minimal()` or `theme_bw()`
    -   The theme elements can be tricky; don't memorize, google them! 
-   **Fill** vs **Color**: use the arguments of fill and color correctly
    -   You **fill** in an area (e.g., bar column area or inside of boxplot),
    -   You **color** in a point or line (e.g., scatterplot point or bar outline)
-   **Facets** are a way to have several plots side by side varying by one variable
    -   `facet_wrap(~variable)` (usually better visually) or `facet_grid(~variable)`
    -   Can facet by two variables, for example: `facet_wrap(variable1 ~ variable2)`
-   ggplots are saved with **ggsave()** but first the plot must be saved to the environment
    -   `mysavedplot <- ggplot(data = mydataframe, aes(x = xcolumn, y = ycolumn)) +`   \
    `geom_point()`  \
    `ggsave(plot = mysavedplot, filename = "output/filesavename.png")`
    -   Other arguments specify size, resolution, etc (dpi, width, height, units)
-   Remember that you have to be internally consistent! 
    -   Can't manually set two colors if plot is expecting three
    -   Need to use categorical names if a category is expected
    -   




