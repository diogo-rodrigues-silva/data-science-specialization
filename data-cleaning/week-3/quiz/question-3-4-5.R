## 3. Load the Gross Domestic Product data for the 190 ranked countries in this data set:
## 
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
## 
## Load the educational data from this data set:
## 
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
## 
## Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last).
## What is the 13th country in the resulting data frame?
## 
## Original data sources:
## 
## http://data.worldbank.org/data-catalog/GDP-ranking-table
## 
## http://data.worldbank.org/data-catalog/ed-stats


# install.packages("dplyr")
# install.packages("Hmisc")

# 1. Import libraries
library(data.table)
library(dplyr)
library(Hmisc)

# 1. Download file 1
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
destfile1 <- './data/gross-domestic-product.csv'
download.file(fileUrl1, destfile = destfile1)

# 2. Download file 2
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
destfile2 <- './data/educational.csv'
download.file(fileUrl2, destfile = destfile2)

# 3. Read files
products <-read.csv('./data/gross-domestic-product.csv', skip = 4, nrows=190, stringsAsFactors = FALSE)
educational <-read.csv('./data/educational.csv', stringsAsFactors = FALSE)

# 4. Select only columns that matter
products <- select(products, c(1, 2, 4, 5))

# 5. Change column name
names(products)<-c("CountryCode", "Rank", "Economy", "Total")

# 6. Merge dataframes by CountryCode column
mergedData <-merge(products, educational, by = "CountryCode")

# 7. Sort merged dataframes in descending order by GDP rank 
mergedData <- arrange(mergedData, desc(Rank))

# 8. Show the 3th economy
mergedData[13, 3]

# 9. Show how many IDs matched
dim(mergedData)[1]


## 4. What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?

# 1. Show the average GDP ranking
tapply(mergedData$Rank, mergedData$Income.Group, mean, na.rm=TRUE)


## 5. Cut the GDP ranking into 5 separate quantile groups.
## Make a table versus Income.Group.
## How many countries are Lower middle income but among the 38 nations with highest GDP?

# 1. Cut the GDP ranking into 5 separate quantile groups 
mergedData$RankGroup <- cut2(mergedData$Rank, g=5)

# 2. Make a table versus Income.Group.  
tableRankVsIncome <- table(mergedData$RankGroup, mergedData$Income.Group)

# 3. Number of countries with Lower middle income among the 38 nations with highest GDP
tableRankVsIncome[4]

