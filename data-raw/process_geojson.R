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

#
# #helpers to prune small, unneeded polygons
# plot_region <- function(region){
#   df = nyc[nyc$region == region,]
#   gplot <- ggplot() +
#     geom_map(data=df, map=df, aes(x=long, y=lat, map_id=region))
#   ggsave(gplot, file=paste0(region,".png"))
# }
# for (x in unique(nyc$region)) plot_region(x)
#
#
# smallny <- nyc[nyc$region %in% c(
#   "Brooklyn_26",
#   "Bronx_0","Bronx_1","Bronx_7", "Bronx_8", "Bronx_23",
#   "Manhattan_4", "Manhattan_6", "Manhattan_24", "Manhattan_25", "Manhattan_26",
#   "Manhattan_27", "Manhattan_28", "Manhattan_29", "Manhattan_31",
#   "Queens_7", "Queens_8", "Queens_10", "Queens_11", "Queens_12", "Queens_13",
#   "Queens_14", "Queens_17", "Queens_19",
#   "Staten Island_3"),]
# gg  <- ggplot()
# gg  <- gg +
#   geom_map(
#     data=smallny,
#     map=smallny,
#     aes(x=long, y=lat, map_id=region, color=region, fill=region))
#
# gg
