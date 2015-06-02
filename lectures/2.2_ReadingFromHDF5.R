# HDF5 is used for storing large data sets
# Supports storing a range of data types
# Hierarchical data form
# Can be used to optimize reading writing from disc in R
# www.hdfgroup.org


# Installation
source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)

# Create HDF5 dataset
created <- h5createFile("example.h5")
created

# Create groups
created <- h5createGroup("example.h5", "foo")
created <- h5createGroup("example.h5", "baa")
created <- h5createGroup("example.h5", "foo/foobaa")
h5ls("example.h5")

# Write to groups
A = matrix(1:10, nr=5, nc=2)
h5write(A, "example.h5", "foo/A")
B = array(seq(0.1, 2.0, by = 0.1), dim = c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5", "foo/foobaa/B")
h5ls("example.h5")

# Write a data set
df = data.frame(1L:5:, seq(0,1,length.out=5), c("ab", "cde", "fghi","a","s"), stringsAsFactors = FALSE)
h5write(df, "example.h5", "df")
h5ls("example.h5")

# Reading data
readA = h5read("example.h5", "foo/A")
readB = h5read("example.h5", "foo/foobaa/B")
readddf = h5read("example.h5", "df")
readA

# Writing and reading chunks
# indeces - first 3 rows and first column
h5write(c(12,13,14), "example.h5", "foo/A", index=list(1:3,1))
h5read("example.h5", "foo/A")