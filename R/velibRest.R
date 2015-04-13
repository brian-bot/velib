## REST API CALLS
#####
## FOCUS ON GET CALLS ONLY FOR NOW - POSSIBLY EXTEND TO POST, PATCH, PUT, AND DELETE IN THE FUTURE
#####

velibRestGET <- function(uri, endpoint = .getVelibCache("velibEndpoint"), .opts=.getVelibCache("opts"), httpheader=.getVelibCache("httpheader"), ...){
  uri <- sub(endpoint, "", uri, fixed=T)
  if(substr(uri, 1, 1) == "/"){
    uri <- substr(uri, 2, nchar(uri))
  }
  
  apiKey <- .getVelibCache("apiKey")
  if( length(apiKey) == 0 ){
    stop("no api key provided")
  }
  
  if(grepl("?", uri, fixed=T)){
    url <- paste(endpoint, uri, "&apiKey=", apiKey, sep="")
  } else{
    url <- paste(endpoint, uri, "?apiKey=", apiKey, sep="")
  }
  .getVelibJSON(url, .opts=.opts, httpheader=httpheader, ...)
}

