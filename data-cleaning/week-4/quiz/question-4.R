##  4. Load the Gross Domestic Product data for the 190 ranked countries in this data set:
##
##  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
##
##  Load the educational data from this data set:
##
##  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
##
##  Match the data based on the country shortcode.
##  Of the countries for which the end of the fiscal year is available, how many end in June?
##
##  Original data sources:
##
##  http://data.worldbank.org/data-catalog/GDP-ranking-table
##
##  http://data.worldbank.org/data-catalog/ed-stats


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

# 8. Show how many countries the fiscal year ends in June
length(grep("Fiscal year end: June", mergedData$Special.Notes))
