.onAttach <- function(lib,pkg) {
  packageStartupMessage("\n",
                        #      " ############################################################\n",
                        " # NYC Map active. This resets the default map directory. To access #\n",
                        " # map data you must detach and reattach the maps package.          #\n",
                        #      " ############################################################\n")
                        "\n")
}

.onLoad <- function(lib, pkg) {
  if (Sys.getenv("R_MAP_DATA_DIR") == "")
    Sys.setenv("R_MAP_DATA_DIR" = paste(lib, pkg, "mapdata/", sep="/"))
  ## temporarily, we add the possibility of changing for "world" only,
  ## to point at the /legacy subdirectory
  if (Sys.getenv("R_MAP_DATA_DIR_WORLD") == "") {
    if(Sys.getenv("R_MAP_DATA_LEGACY")=="TRUE") Sys.setenv("R_MAP_DATA_DIR_WORLD" = paste(Sys.getenv("R_MAP_DATA_DIR"), "legacy_",sep=""))
    else Sys.setenv("R_MAP_DATA_DIR_WORLD" = Sys.getenv("R_MAP_DATA_DIR"))
  }

  #include map libraries
  library.dynam("maps", "maps", lib)

  # set the environment to allow access to maps.
  # this is a bit clunky. is there a better way?
  Sys.setenv("NY_MAPS"= paste(lib, pkg, "mapdata/", sep="/"))
  Sys.setenv("nycMapEnv"="NY_MAPS")
  assign("nycMapEnv","NY_MAPS", envir = .GlobalEnv)
}

