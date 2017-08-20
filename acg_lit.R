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

head(acg_lit_split$x, 1000)

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
acg_lit_split$varnum <- 0
acg_lit_split <- acg_lit_split %>% 
  mutate(varnum = ifelse(grep("Title", acg_lit_split$x), 1, 
                  ifelse(grep("Published", acg_lit_split$x), 2,
                  ifelse(grep("Authors", acg_lit_split$x), 3,
                  ifelse(grep("Country", acg_lit_split$x), 4,
                  ifelse(grep("Journal", acg_lit_split$x), 5,
                  ifelse(grep("URL", acg_lit_split$x), 6)))))))

str(acg_lit_split)
acg_lit_split$varnum <- 0
acg_lit_split$varnum <- ifelse(grep("Title", acg_lit_split$x), 1)

##-------------------------------------------------------
## create varnum for loop
##----------------------------------------------------

acg_lit_split[ grep("Title", acg_lit_split$x), ]$varnum <- 1
acg_lit_split[ grep("Published", acg_lit_split$x), ]$varnum <- 2
acg_lit_split[ grep("Authors", acg_lit_split$x), ]$varnum <- 3
acg_lit_split[ grep("Country", acg_lit_split$x), ]$varnum <- 4
acg_lit_split[ grep("Journal", acg_lit_split$x), ]$varnum <- 5
acg_lit_split[ grep("URL", acg_lit_split$x), ]$varnum <- 6

##-----------------------------------------------------
## citation loop for matrix of missingness
##--------------------------------------------------

# create variables: citenum, varnum, con, prev_con
citenum <- 0
varnum <- acg_lit_split$varnum
con <- (citenum *10) + varnum
prev_con <- 99

# create dataframe
citation <- as.data.frame(cbind(prev_con, con, citenum, varnum))
head(citation, 20)

# use shift function from data.table for prev_con
library(data.table)
citationDT <- as.data.table(citation)
citationDT <- citationDT[, prev_con := shift(con)]

# clean up data for citenum loop
citation <- as.data.frame(citationDT)
citation[1,1] <- 99

citation <- subset(citation, varnum == 1 | varnum == 2 | varnum == 3 | varnum == 4 | varnum == 5)
str(citation)

# citenum loop
for (i in 1:nrow(citation)){
  if (citation$con[i] <= citation$prev_con[i]) {
    if (i==1) citation$citenum[i] <- 1
    else citation$citenum[i] <- citation$citenum[i-1] + 1
  } 
  else {
    citation$citenum[i] <- citation$citenum[i-1]
  }
}

##----------------------------------------------------
## create dataframe of citations by varnum
##---------------------------------------------------

# limit citations to citenum and varnum
citlimit <- citation[ , c(3,4)]
head(citlimit, 20)

# create vectors 
titnum <- subset(citlimit, varnum == 1); names(titnum) <- c("citenum", "title") 
pubnum <- subset(citlimit, varnum == 2); names(pubnum) <- c("citenum", "publish")  
authnum <- subset(citlimit, varnum == 3); names(authnum) <- c("citenum", "author")  
counum <- subset(citlimit, varnum == 4); names(counum) <- c("citenum", "country") 
jounum <- subset(citlimit, varnum == 5); names(jounum) <- c("citenum", "journal")  

head(titnum, 30)

# create master key for join
citenum_master <- as.data.frame(unique(citation$citenum))
names(citenum_master) <- "citenum"
str(citenum_master)

# create a dataframe
library(dplyr)
missing <- left_join(citenum_master, titnum, by="citenum")
missing <- left_join(missing, pubnum, by="citenum")
missing <- left_join(missing, authnum, by="citenum")
missing <- left_join(missing, counum, by="citenum")
missing <- left_join(missing, jounum, by="citenum")

head(missing, 200)

# sum the number of missing values
sapply(missing, function(x) sum(is.na(x)))
