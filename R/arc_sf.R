#' Title
#'
#' @param .dsn The path to the data resource (Living Atlas)
#' @param .query Tne quoted query to subset data
#'
#' @return a spatial data frame (sf)
#' @export
#'
#' @examples
arc_sf <- function(.dsn, .query = NULL) {
  if (is.null(.query)) {
    arcgisbinding::arc.open(path = .dsn) |>
      arcgisbinding::arc.select() |>
      arcgisbinding::arc.data2sf()
  } else {
    arcgisbinding::arc.open(path = .dsn) |>
      arcgisbinding::arc.select(where_clause = .query) |>
      arcgisbinding::arc.data2sf()
  }
}
