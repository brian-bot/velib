## CREATE AND MANAGE A GLOBAL CACHE FOR THE CLIENT TO ACCESS
#####
## AUTHOR: BRIAN M. BOT
#####

.setVelibCache <- function(key, value){
  cache <- new("VelibCache")
  cache@env[[key]] <- value
  
  ## IF ONE OF THESE PARAMS THEN ADD TO opts
  validOpts <- c("low.speed.time", "low.speed.limit", "connecttimeout", "followlocation", "ssl.verifypeer", "verbose", "cainfo")
  if(key %in% validOpts){
    opts <- .getVelibCache("opts")
    opts[[key]] <- value
    .setVelibCache("opts", opts)
  }
  
  ## IF ONE OF THESE PARAMS THEN ADD TO httpheader
  validHeaders <- c("Authorization", "User-Agent", "Accept")
  if(key %in% validHeaders){
    httpheader <- .getVelibCache("httpheader")
    httpheader[[key]] <- value
    .setVelibCache("httpheader", httpheader)
  }
  
  return(NULL)
}

.inVelibCache <- function(key){
  cache <- new("VelibCache")
  return(key %in% ls(cache@env))
}

.getVelibCache <- function(key){
  if( !.inVelibCache(key) ){
    return(NULL)
  } else{
    cache <- new("VelibCache")
    return(cache@env[[key]])
  }
}

