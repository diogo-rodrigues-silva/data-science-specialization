##  5. You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices for publicly traded companies on the NASDAQ and NYSE.
##  Use the following code to download data on Amazon's stock price and get the times the data was sampled.
##
##    library(quantmod)
##    amzn = getSymbols("AMZN",auto.assign=FALSE)
##    sampleTimes = index(amzn)
##
##  How many values were collected in 2012? How many values were collected on Mondays in 2012?


# install.packages("quantmod")
# install.packages("lubridate")

# 1. Import library
library(quantmod)
library(lubridate)

# 2. Download data on Amazon's stock price
amzn = getSymbols("AMZN", auto.assign=FALSE)

# 3. Get the times the data was sampled
sampleTimes = index(amzn)

# 4. Get index of values collected in 2012
index <- grep("^2012", sampleTimes)

# 5. Calculate how many values were collected in 2012
length(index)

# 6. Convert string to lubridate values
dates <- ymd(sampleTimes[index])

# 7. Calculate how many values were collected on "Segunda-feira" in 2012
sum(wday(dates, label=TRUE) == "seg")
