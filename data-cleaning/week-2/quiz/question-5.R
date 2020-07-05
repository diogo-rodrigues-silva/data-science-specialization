## 5. Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
## https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
## Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for
## (Hint this is a fixed width file format)

# 1. Install packages
library(readr)

# 2. Read file
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
x <- read_fwf(file=fileurl, skip=4, fwf_widths(c(12, 7, 4, 9, 4, 9, 4, 9, 4)))

# 3. Count values from 4th column
sum(x$X4)