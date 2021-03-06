##  1. The American Community Survey distributes downloadable data about United States communities.
##  Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
##
##  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
##
##  and load the data into R. The code book, describing the variable names is here:
##  
##  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
##
##  Apply strsplit() to split all the names of the data frame on the characters "wgtp".
##  What is the value of the 123 element of the resulting list?


# 1. Download file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
destFile <- './data/housing-survey-idaho-2006.csv'
download.file(fileUrl, destfile = destFile)

# 2. Read files
housing <- read.csv(destFile)

# 3. Slip columns name based in wgtp separator and show the 123th position
strsplit(names(housing), "wgtp")[123]
