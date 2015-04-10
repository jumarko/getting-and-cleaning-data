## JSON
## Example: https://api.github.com/users/jtleek/repos

# more info about jsonlite: http://www.r-bloggers.com/new-package-jsonlite-a-smarter-json-encoderdecoder/
library(jsonlite)
# get data fram 'jsonData'
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
names(jsonData$owner$login)


# writing adta frames to json
myjson <- toJSON(iris, pretty=TRUE)
cat(myjson)

iris2 <- fromJSON(myjson)
head(iris2)