## 3. Using the same data frame you created in the previous problem, what is the equivalent function to unique(acs$AGEP)
## Note: Install sqldf package install.packages("sqldf") if needed it

# 1. Install packages
library(sqldf)

# 2. Download the American Community Survey
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
destfile <- "./data-cleaning/week-2/quiz/data/acs.csv"
download.file(fileurl, destfile = destfile)

# 3. Read the csv file and create a data frame from it
acs <- read.csv(destfile)

# 4. Get distincts value from AGEP
unique(acs$AGEP)

# 5. Equivalent funtion
sqldf("select distinct AGEP from acs")