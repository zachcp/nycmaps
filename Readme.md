# nycmaps

This package provides New York City map data for use with the [maps](https://cran.r-project.org/web/packages/maps/index.html) package.

```
libary(nycmaps)
library(maps)
map(database="nyc")
```
<img src="README_figs/nyc.png" title="" alt="" width="672" />

```
#this should also work with ggplot and ggalt
nyc <- map_data("nyc")
gg  <- ggplot()
gg  <- gg + 
         geom_map(
           data=nyc, 
           map=nyc,
           aes(x=long, y=lat, map_id=region))
gg
```
