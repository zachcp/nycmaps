.onLoad <- function(lib, pkg){
  Sys.setenv("NY_MAPS"=paste(lib,pkg,"mapdata/",sep="/"))
}
nycMapEnv <- "NY_MAPS"
