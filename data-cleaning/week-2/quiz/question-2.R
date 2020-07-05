## 2. The sqldf package allows for execution of SQL commands on R data frames.
## We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL.
## Download the American Community Survey data and load it into an R object called
##  acs
## Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?
## Note: Install sqldf package install.packages("sqldf") if needed it

# 1. Install packages
library(sqldf)

# 2. Download the American Community Survey
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
destfile <- "./data-cleaning/week-2/quiz/data/acs.csv"
download.file(fileurl, destfile = destfile)

# 3. Read the csv file and create a data frame from it
acs <- read.csv(destfile)

# 4. Select only the data for the probability weights pwgtp1 with ages less than 50
sqldf("select pwgtp1 from acs where AGEP < 50")
