## Register an application with the Github API here https://github.com/settings/applications.
## Access the API to get information on your instructors repositories
## (hint: this is the url you want "https://api.github.com/users/jtleek/repos").
## Use this data to find the time that the datasharing repo was created. What time was it created?
  
## This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r).
## You may also need to run the code in the base R package and not R studio.

# Loading packages
library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below. (Get this info here https://github.com/settings/applications)
myapp <- oauth_app("github",
                   key = "your-client-id",
                   secret = "your-secret"
)

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API to get data about the repo
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
requestresult <- content(req)

# 5. Find datasharing repo info index from the request result
datasharingindex <- which(sapply(requestresult, FUN=function(X) "datasharing" %in% X))

# 6. Get the created_at info from requestresult using datasharing index
created_at <- requestresult[[datasharingindex]]$created_at

# 7. Print the time that the datasharing repo was created
print(created_at)
