##  2.Pergunta 2
##  Using the jpeg package read in the following picture of your instructor into R
##   
##  https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg
##
##  Use the parameter native=TRUE.
##  What are the 30th and 80th quantiles of the resulting data?
##  (some Linux systems may produce an answer 638 different for the 30th quantile)

# 1. Import library
library(jpeg)

# 2. Download image
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl, destfile = './data/quiz2-photo.jpg', "curl")

# 3. Read imagem in native raster representation(8-bit RGBA)
image <- readJPEG('./data/quiz2-photo.jpg', native = TRUE)

# 4. Calculate the quantiles
quantile(image, probs = c(0.3, 0.8))