## GENERIC CLASS DEFINITIONS
##
## AUTHOR: BRIAN M. BOT
#####


## CREATE A CACHE THAT CAN BE WRITTEN TO IN ORDER FOR CLIENT TO ACCESS INFORMATION
setClass(
  Class = "VelibCache",
  representation = representation(env = "environment"),
  prototype = prototype(env = new.env(parent=emptyenv()))
)
