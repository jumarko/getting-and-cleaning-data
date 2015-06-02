
install.packages("RMySQL")
 
# UCSC database - human genom
ucscDb <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases")
# It's important to disconnect at the end
dbDisconnect(ucscDb);

# hg19 database
hg19 <- dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

# Get dimensions of specific table
dbListFields(hg19, "affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

# Read from table
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

# Select a specific subset - whole table might be too big
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query)
quantile(affyMis$misMatches)
affyMisSmall <- fetch(query, n=10)
dim(affyMiSmall)
# Remember to clear the query from the remote server!
dbClearResult(query)

# and close the connection
dbDisconnect(hg19)
