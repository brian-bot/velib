## FUNCTION THAT WILL CHECK ALL CALLS FOR FAILURES AND CONVERT JSON RESPONSES
#####

.getVelibJSON <- function(url, .opts, httpheader, ...){
  
  tryGetURL <- getURL(url, .opts=.opts,
                      httpheader=httpheader, ...)
  tryGetURL <- fromJSON(tryGetURL)
#   if(is.character(tryGetURL)){
#     if(tryGetURL["message"] == "Not Found")
#       stop("velib api could not find specified URI", call.=F)
#   }
  
  return(tryGetURL)
}
