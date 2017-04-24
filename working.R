# install package RSocrata
install.packages("RSocrata")

# load package
library(RSocrata)
library(jsonlite)

df2 <- ls.socrata("http://opendata.cityofnewyork.us/")
df <- ls.socrata("https://data.cityofchicago.org/")

df <- ls.socrata("https://nycopendata.socrata.com/")


https://${SOCRATA_URL}/views/${viewid}.json,

fromJSON(txt, simplifyVector = TRUE, simplifyDataFrame = simplifyVector,
simplifyMatrix = simplifyVector, flatten = FALSE, ...)

dd <- fromJSON(txt="https://data.cityofnewyork.us/api/views/f4rp-2kvy.json")

############# REAL WORK STARTS HERE ###################################

# 1. download the list of datasets on portal
dat <- ls.socrata("https://nycopendata.socrata.com/")

# 2 loop over the list files and get, manipulate, and save approproate meta data

# set up the result object

# notes: need to correctly deal with dates.  
df <- data.frame(name=character(),
                 attribution=character(),
                 downloadcount=numeric(),
                 viewcount=numeric(), 
                 category=character(),
                 createdAt=numeric(),
                 indexUpdatedAt=numeric(),
                 description=character(),
                 stringsAsFactors=FALSE
                 )

for(i in 1:dim(dat)[1]){
# get name of json file
fn <- paste(dat[i,9],".json",sep="")

# get json file
dd <- fromJSON(txt=fn)

# extract data to be analyzed

df[i,1] <-ifelse(is.null(dd$name),NA,dd$name)
df[i,2] <- ifelse(is.null(dd$attribution),NA,dd$attribution)
df[i,3] <- ifelse(is.null(dd$downloadCount),NA,dd$downloadCount)
df[i,4] <- ifelse(is.null(dd$viewCount),NA,dd$viewCount)
df[i,5] <- ifelse(is.null(dd$category),NA,dd$category)
df[i,6] <- ifelse(is.null(dd$createdAt),NA,dd$createdAt)
df[i,7] <- ifelse(is.null(dd$indexUpdatedAt),NA,dd$indexUpdatedAt)
df[i,8] <- ifelse(is.null(dd$description),NA,dd$description)
}




# Q: what meta data do I want
times downloaded
name
owner
category
created date/time
description

    
########### some preliminary analysis
xx <- cmdscale(dist(ddf$downloadCount))
plot(xx[,1],xx[,2],xlim=c(0,100000),ylim=c(-.010,.001))

p <- princomp(ddf$downloadCount)
plot(p$loadings[,1],p$loadings[,2])

#### data analysis

dat <- readRDS("dataset.rda")

dim(dat)
dat[1,]

library(anytime)

library(mclust)
cl <- Mclust(dat[,3])

dc <- aggregate(df$downloadcount,by=list(df$category),FUN=sum,na.rm=T)
vc <- aggregate(df$viewcount,by=list(df$category),FUN=sum,na.rm=T)
