## Reading XMl files

# load XML library
install.packages("XML")
library(XML)

# parse XML file
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl, useInternal = TRUE)
rootNode <- xmlRoot(doc)

# Explore
xmlName(rootNode)
names(rootNode)
rootNode[1]
rootNode[[1]][[1]]

# or apply function - go through all the nodes recursively
xmlSApply(rootNode, xmlValue)

# or XPath
# /node top level node
# //node at any level
# node[@attr-name] node with an attribute name
# node[@attr-name='bob'] node with attribute name equal to 'bob'
xpathSApply(rootNode, "//name", xmlValue)
xpathSApply(rootNode, "//price", xmlValue)


# More complicated example
fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-orioles"
doc <- htmlTreeParse(fileUrl, useInternal = TRUE)
doc
# TODO: scores doesn't work for some reason
scores <- xpathSApply(doc, '//div[@class="score"]', xmlValue)
teams <- xpathSApply(doc, '//li[@class="team-name"]', xmlValue)
scores
teams

