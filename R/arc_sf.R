#' Title
#'
#' @param .dsn
#' @param .query
#'
#' @return
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
