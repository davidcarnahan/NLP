install.packages("readtext")
library(readtext)

# read pdf into text using readtext package
acg_lit <- as.data.frame(readtext("~/Johns-Hopkins-ACG-System-Bibliography.pdf"), stringsAsFactors = FALSE)

# convert to dataframe
acg_lit <- as.data.frame(acg_lit)

##---------------------------------------------------
## tokenize categories (cut-points) using @ sympbol
##-------------------------------------------------

# add initial title
acg_lit_rpl <- gsub("applications.\n", "@Title: ", acg_lit)

# add published
acg_lit_rpl <- gsub("\nPublished", "@Published", acg_lit_rpl)
acg_lit_rpl <- gsub("\nAuthor", "@Author", acg_lit_rpl)
acg_lit_rpl <- gsub("Hospital\n", "@Author: ", acg_lit_rpl)
acg_lit_rpl <- gsub("Spanish\n", "@Author: ", acg_lit_rpl)
acg_lit_rpl <- gsub("\nLanguage", "@Language", acg_lit_rpl)
acg_lit_rpl <- gsub("\nType", "@Type", acg_lit_rpl)
acg_lit_rpl <- gsub("\nSettings", "@Settings", acg_lit_rpl)
acg_lit_rpl <- gsub("\nCountry", "@Country:", acg_lit_rpl)

# add demiliter for journal category
acg_lit_rpl <- gsub("United States\n", "United States @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("United Kingdom\n", "United Kingdom @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Canada\n", "Canada @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Spain\n", "Spain @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Israel\n", "Israel @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Taiwan\n", "Taiwan @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Chile\n", "Chile @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Sweden\n", "Sweden @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Australia\n", "Australia @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("New Zealand\n", "New Zealand @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Korea\n", "Korea @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Malaysia\n", "Malaysia @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Thailand\n", "Thailand @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Italy\n", "Italy @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("South Africa\n", "South Africa @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Germany\n", "Germany @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Lithuania\n", "Lithuania @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Brazil\n", "Brazil @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Denmark\n", "Denmark @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("France\n", "France @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Norway\n", "Norway @Journal:", acg_lit_rpl)
acg_lit_rpl <- gsub("Ireland\n", "Ireland @Journal:", acg_lit_rpl)

# add URL
acg_lit_rpl <- gsub("\nhttp", "@URL: http", acg_lit_rpl)
acg_lit_rpl <- gsub("http", "@URL: http", acg_lit_rpl)

# add other titles
acg_lit_rpl <- gsub(".pdf\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("[0-9]\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("[0-9].\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("\nUsing", "@Title: Using ", acg_lit_rpl)
acg_lit_rpl <- gsub ("[0-9][A-Z]\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub ("[0-9][a-z]\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("sicker\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("jhubiostat\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub('.pdf”\n', "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("printable\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("cf3fa\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub(".aspx\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("html\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("revis\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("print\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("[0-9]/\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("[a-z]/\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("south\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("htm\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("abstract\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("2333a\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("praksissektor_u\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("/VG\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("20d1b\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("disease\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("metis_pop\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("==.p\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("servic\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("sequence\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("text\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("sequen\n", "@Title: ", acg_lit_rpl)
acg_lit_rpl <- gsub("]\n", "@Title: ", acg_lit_rpl)

head(acg_lit_split, 1000)

# split into rows using @ delimiter
acg_lit_split <- as.data.frame(strsplit(acg_lit_rpl, "@"), stringsAsFactors = FALSE)

##------------------------------------------------
## data set clean up
##--------------------------------------------

# name factors & clean up header section
names(acg_lit_split) <- c("x", "pub")
acg_lit_split <- acg_lit_split[ -c(1:3), 2]
acg_lit_split <- as.data.frame(acg_lit_split)
names(acg_lit_split) <- "x"

##-----------------------------------------------
## data wrangling for crosstab dataset
##--------------------------------------------

# create vectors from different categories to evaluate for consistency
title <- acg_lit_split[ grep("Title", acg_lit_split$x), ]           # 800 - 857 - 858 - 925
published <- acg_lit_split[ grep("Published: ", acg_lit_split$x), ] # 905 - 905 - 
authors <- acg_lit_split[ grep("Authors: ", acg_lit_split$x), ]     # 788 - 788
country <- acg_lit_split[ grep("Country::", acg_lit_split$x), ]     # 893 - 893
journal <- acg_lit_split[ grep("Journal", acg_lit_split$x), ]       # 957 - 957
url <- acg_lit_split[ grep("URL", acg_lit_split$x), ]               # 1662 

head(url, 1000)

# combine dataset using cbind
acg_xtab <- cbind(title, published, authors, country, journal)

##------------------------------------------------------------
## visualization of data
##--------------------------------------------------------

## clean up datasets
# published
library(lubridate)
published <- gsub("Published: ", "", published)
published2 <- mdy(published)
published3 <- year(published2)
published3 <- as.data.frame(published3)
names(published3) <- "x"
published4 <- published3[ published3$x > 210, ]

# graph histogram of publications per year
hist(published4, 
     main = "Publications by Year",
     xlab = "Years",
     ylab = "Number of Publications",
     col = "blue")

# create table of publications by country
country <- gsub("Country:: : ", "", country)
country <- as.data.frame(country)
table(country)

# create a document term matrix of 

str(acg_lit_split)
library(dplyr)
acg_lit_split <- acg_lit_split %>% 
  mutate(varnum = if())