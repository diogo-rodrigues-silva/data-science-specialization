##  1. The American Community Survey distributes downloadable data about United States communities.
##  Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
##   
##  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
##  
##  and load the data into R. The code book, describing the variable names is here:
##   
##  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
##  
##  Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products.
##  Assign that logical vector to the variable agricultureLogical.
##  Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE.
##  
##  which(agricultureLogical)
##  
##  What are the first 3 values that result?


# 1. Download file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
destFile <- './data/housing-survey-idaho-2006.csv'
download.file(fileUrl, destfile = destFile)

# 2. Read the file to a dataframe
housing <- read.csv(destFile)

# 3. Identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products 
agricultureLogical <- housing$ACR %in% 3 & housing$AGS %in% 6

# 4. Index of the row which matched which the logical condition
households <- which(agricultureLogical)

# 5. The three first values
households[1:3]
