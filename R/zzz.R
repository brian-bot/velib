## Startup functions and global constants
###############################################################################

kCertBundle <- "certificateBundle/cacert.pem"

.onLoad <- function(libname, pkgname){
  
  ## SET ESPN VELIB AND START OPTIONS
  .setVelibCache("opts", list())
  .setVelibCache("velibEndpoint", "https://api.jcdecaux.com/vls/v1/")
  .setVelibCache("httpheader", character())
  .setVelibCache("Accept", "application/json")
  .setVelibCache("User-Agent", .userAgent())
  .setVelibCache("low.speed.time", 60)
  .setVelibCache("low.speed.limit", 1)
  .setVelibCache("connecttimeout", 300)
  .setVelibCache("followlocation", TRUE)
  .setVelibCache("ssl.verifypeer", TRUE)
  .setVelibCache("verbose", FALSE)
  .setVelibCache("cainfo", file.path(libname, pkgname, kCertBundle))
}

.userAgent <- function(){
  return(paste("velib", utils::packageDescription("velib", fields="Version"), sep="/"))
}
