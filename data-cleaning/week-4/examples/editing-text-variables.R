if(!file.exists("./data")) { dir.create("./data") }
fileUrl <- "https://data.baltimorecity.gov/resource/aqgr-xx9h.csv"
download.file(fileUrl, destfile = './data/cameras.csv', method = "curl")

cameras <- read.csv("./data/cameras.csv")
names(cameras)
cameras <- cameras[, 1:6]

# Fixing character vector - strsplit()
splitedNames <- strsplit(names(cameras), "\\_")

# quick aside  - lists
myList <- list(letters = c("a", "b", "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(myList)

myList$letters
myList[1]
myList[[1]]

# Fixing character vector - sapply()
# Applies a function to each element in a vector or list
splitedNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitedNames, firstElement)


# Fixing character vector - sub()
reviews <- read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")

sub("_", "", names(reviews),)

# Fixing character vector - gsub()
testName <- "this_is_a_test"
sub("_", "", testName)

testName <- "this_is_a_test"
gsub("_", "", testName)

# Fixing character vector - greb, grebl
grep("Alameda", cameras$intersection)

table(grepl("Alameda", cameras$intersection))

cameras2 <- cameras[grepl("Alameda", cameras$intersection), ]
cameras2 <- cameras[-grep("Alameda", cameras$intersection), ]

# More on grep
grep("Alameda", cameras$intersection, value = TRUE) # return the values

grep("DiogoStreet", cameras$intersection)

length(grep("DiogoStreet", cameras$intersection))

#More usefull string functions
library(stringr)

nchar("Diogo Rodrigues")

substr("Diogo Rodrigues", 1, 5)

paste("Diogo", "Rodrigues")

paste0("Diogo", "Rodrigues")

str_trim("Diogo      ")