#' NYC BaseMap
#'
#' Provide a simple ggplot base on which to plot
#'
#' @export
#'
plot_nyc <- function() {
  nyc <- map_data("nyc")
  gg  <- ggplot(nyc,aes(x=long, y=lat, map_id=region))
  gg  <- gg +
    geom_map(
      data=nyc,
      map=nyc,
      aes(x=long, y=lat, map_id=region),
      fill="grey") +
    cowplot::theme_nothing()

  gg
}
