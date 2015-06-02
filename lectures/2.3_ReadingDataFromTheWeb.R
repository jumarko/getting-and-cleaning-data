# Webscraping - programatically extracting data from the websites.
# E.g. "How Netflix reverse engineered Hollywood"
# In some cases this is against the terms of service for the website

# Example: Google scholar
# http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en

# More examples on http://www.r-bloggers.com?s=Web+Scraping

# get data
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode

# parsing with XML
library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes=T)

xpathSApply(html, "//title", xmlValue)
xpathSApply(html, "//td[@id='col-citedby']", xmlValue)

# GET command in httr package (can be very useful)
library(httr);
html2 = GET(url)
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2, asText=TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)
# with password
pg1 = GET("http://httpbin.org.basic-auth/user/passwd")
# 401 - Unauthorized
pg1
pg2 = GET("http://httpbin.org.basic-auth/user/passwd",
          authenticat("user", "passwd"))
pg2
names(pg2)

# Using handles - save authentication information across multiple requests
google = handle("http://gogle.com")
pg1 = GET(handle=google, path="/")
pg2 = GET(handle=google, path="search")