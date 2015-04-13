## AUTHOR: BRIAN M. BOT
#####

setApiKey <- function(apiKey){
  stopifnot( length(apiKey)==1L & is.character(apiKey))
  
  ## IF PASS CHECK, THEN SET IN CACHE FOR FUTURE CALLS
  .setVelibCache("apiKey", apiKey)
  
  message("Velib API key successfully stored - will be used for all subsequent calls to the Velib API")
  return(invisible(NULL))
}

