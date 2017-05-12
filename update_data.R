update_data <- function() {
# get list of datasets available 
dlist <- RSocrata::ls.socrata("https://nycopendata.socrata.com/")

# create empty data frame to store data
ddf <- data.frame(name=character(),
                 attribution=character(),
                 downloadcount=numeric(),
                 viewcount=numeric(), 
                 category=character(),
                 createdAt=numeric(),
                 indexUpdatedAt=numeric(),
                 description=character(),
                 stringsAsFactors=FALSE
                 )

# loop over list of datasets and extract data
for(i in 1:dim(dlist)[1]){
  # get name of json file
  fn <- paste(dlist[i,9],".json",sep="")

  # get json file
  dd <- jsonlite::fromJSON(txt=fn)

  # extract data to be analyzed
  ddf[i,1] <- ifelse(is.null(dd$name),NA,dd$name)
  ddf[i,2] <- ifelse(is.null(dd$attribution),NA,dd$attribution)
  ddf[i,3] <- ifelse(is.null(dd$downloadCount),NA,dd$downloadCount)
  ddf[i,4] <- ifelse(is.null(dd$viewCount),NA,dd$viewCount)
  ddf[i,5] <- ifelse(is.null(dd$category),NA,dd$category)
  ddf[i,6] <- ifelse(is.null(dd$createdAt),NA,dd$createdAt)
  ddf[i,7] <- ifelse(is.null(dd$indexUpdatedAt),NA,dd$indexUpdatedAt)
  ddf[i,8] <- ifelse(is.null(dd$description),NA,dd$description)
}
return(ddf)
}
