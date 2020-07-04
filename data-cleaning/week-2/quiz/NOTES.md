# About the question 1 - quiz

I faced some problems using the httr library to access the github API. When the script opens the browser and redirects to a page that allows the application to use the API and obtain the authorization code, a redirection failure occurred. So, I researched and found this link https://stackoverflow.com/questions/30819293/authorization-code-for-github-api-used-in-r, which explains how to deal with this problem. I followed the steps for installing the httpuv library on this link https://github.com/rstudio/httpuv and, finally, it worked well for me.
