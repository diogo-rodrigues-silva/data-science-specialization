##  2. Load the Gross Domestic Product data for the 190 ranked countries in this data set:
##
##  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
##
##  Remove the commas from the GDP numbers in millions of dollars and average them. What is the average?
## 
##  Original data sources:
## 
##  http://data.worldbank.org/data-catalog/GDP-ranking-table


# install.packages("dplyr")
# install.packages("Hmisc")

# 1. Import libraries
library(data.table)
library(dplyr)

# 2. Download file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
destFile <- './data/gdp-ranking.csv'
download.file(fileUrl, destfile = destFile)

# 3. Read files
ranking <- read.csv(destFile, skip = 4, nrows=190, stringsAsFactors = FALSE)

# 4. Select only columns that matter
ranking <- select(ranking, c(1, 2, 4, 5))

# 5. Change column name
names(ranking) <- c("CountryCode", "Rank", "Economy", "GDP")

# 6. Remove comma from values
millionsOfDollars <- gsub(",", "", ranking[, 4])

# 7. Select only numeric values
millionsOfDollars <- gsub("[^0-9]", "", millionsOfDollars)

# 8. Calculate the mean of the column selected
mean(as.numeric(millionsOfDollars))

##  3. In the data set from Question 2 what is a regular expression that would allow you
##  to count the number of countries whose name begins with "United"?
##  Assume that the variable with the country names in it is named countryNames.
##  How many countries begin with United?

# 1. Calculate how many countries begin with United
length(grep("^United", ranking$Economy))

