---
title: "Vocabulary Cheatsheet"
output: word_document
---

## Section 2

* **RStudio** runs **R (aka R Project)** in the background
  - You can run R Project by itself, but RStudio is nicer to work with and we recommend it
* **Panes** in RStudio:
  - **Script Editor** (probably top left): Where you can write code before evaluating it
  - **Console** (probably bottom left): Where code is evaluated and output is seen
  - **Environment** (probably top right): Where you can view variables/objects in R's memory
  - **Plot/Help** (probably bottom right)
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

## Section 3

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

## Section 4

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
-   **install.packages("tidyverse")** installs the tidyverse package for the first time (run this ONCE)
-   **library(tidyverse)** loads the tidyverse package when you need it


\pagebreak

## Section 6

-   The pipe operator **%\>%**
    -   **function1(x)** can be rewritten as **x %\>% function1**
    -   **function1(x, args1)** can be rewritten as **x %\>% function1(args1)**
-   Core tidyverse verbs:
    -   **select()** keep certain columns

        x %\>% select(column1, column2)

    -   **filter()** keep certain rows

        x %\>% filter(year==2023 & species=="Chinook")

    -   **mutate()** transform a column, or create a new one

        x %\>% mutate(CPUE = catch/hours)

    -   **rename()** rename columns

        x %\>% rename(NewCol1=OldCol1, NewCol2=OldCol2)
-   some more useful tidyverse verbs:
    -   **left_join()** join two data.frames with a matched column
    -   **group_by() %\>% summarise()** create a summary

        x %\>% group_by(species) %\>%

        summarise(mn_length=mean(length), sd_length=sd(length))

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
