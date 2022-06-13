#' Map Points
#'
#' @param .x The x coordinate(s). Use the combine operator (c) when supplying multiple values
#' @param .y The y coordinate(s). Use the combine operator (c) when supplying multiple values
#' @param .crs The EPSG code for the coordinates. Defaults to 4326 (WGS84)
#'
#' @return Mapview interactive web map
#' @export
#'
#' @examples
#' x <- c(-109, -109.5, -110)
#' y <- c(39, 39, 39)
#' map_pts(.x = x, .y = y)
map_pts <- function(.x, .y, .crs = 4326) {
  mapview::mapviewOptions(basemaps = c("Esri.WorldImagery", "OpenTopoMap"))
  data.frame(x = .x, y = .y) |>
    sf::st_as_sf(coords = c("x", "y"),
                 crs = .crs) |>
    (\(x) {mapview::mapview(x)}) ()

}
