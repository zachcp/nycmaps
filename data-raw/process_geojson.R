library(maps)
library(dplyr)
library(mapMaker)
library(ggplot2)
library(ggalt)

nyc_triplet <- read.csv("nyc_triplet.csv",
                        header = FALSE,
                        stringsAsFactors = FALSE)

nycmap <- list(x=nyc_triplet$V1,
               y=nyc_triplet$V2,
               names=unique(nyc_triplet$V3))

nycmap <- nycmap %>%  map.make()
nycmap %>% map.export.ascii("nyc")
nycmap %>% map.export.bin("../inst/mapdata/nyc")
