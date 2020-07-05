## 4. How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
## http://biostat.jhsph.edu/~jleek/contact.html
## (Hint: the nchar() function in R may be helpful)


# 1. Open a connection, read lines from page, and close connection
connection = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(connection)
close(connection)

# 2. Count number of characters from lines 10th, 20th, 30th, and 100th
count10th <- nchar(htmlCode[10])
count20th <- nchar(htmlCode[20])
count30th <- nchar(htmlCode[30])
count100th <- nchar(htmlCode[100])

# 3. Print number of characters formatted
sprintf(fmt = "%s %s %s %s", count10th, count20th, count30th, count100th)

