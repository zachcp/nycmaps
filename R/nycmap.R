#' NYC BaseMap
#'
#' Provide a simple ggplot base on which to plot
#'
#' @export
#' @importFrom cowplot theme_nothing
plot_nyc <- function() {
  nyc <- map_data("nyc")
  gg  <- ggplot(nyc,aes(x=long, y=lat, map_id=region))
  gg  <- gg +
    geom_map(
      data=nyc,
      map=nyc,
      aes(x=long, y=lat, map_id=region),
      fill="grey") +
    theme_nothing()

  gg
}

#' Lifted from Cowplot
#'
#' Create a completely empty theme
#'
#' The theme created by this function shows nothing but the plot panel. Unfortunately,
#' due to ggplot2 peculiarities, a little bit of padding remains to the left and bottom of
#' the panel. This can be removed by adding \code{labs(x = NULL, y = NULL)} to the plot, see examples.
#' @param base_size Overall font size. Default is 14.
#' @param base_family Base font family.
#' @return The theme.
#' @examples
#' # plot with small amount of remaining padding
#' qplot(1:10, (1:10)^2) + theme_nothing()
#' # remaining padding removed
#' qplot(1:10, (1:10)^2) + theme_nothing() + labs(x = NULL, y = NULL)
theme_nothing <- function(base_size = 12, base_family = ""){
  theme_grey(base_size = base_size, base_family = base_family) %+replace%
    theme(
      rect              = element_rect(fill = "transparent", colour = NA, color = NA, size = 0, linetype = 0),
      line              = element_blank(),
      text              = element_blank(),
      title             = element_blank(),
      # to debug, uncomment next line
      #plot.background   = element_rect(colour = "blue", fill = "cyan"),
      panel.background  = element_blank(),
      axis.ticks.length = grid::unit(0, "lines"),
      legend.position   = "none",
      panel.margin      = grid::unit(c(0, 0, 0, 0), "lines"),
      plot.margin       = grid::unit(c(0, 0, 0, 0), "lines")
    )
}
