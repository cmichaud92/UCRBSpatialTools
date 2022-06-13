#' Fetch spatial lines from the UCRB rivers dataset
#'
#' @param .where A SQL style WHERE statement
#'
#' @return A simple features dataframe
#' @export
#'
#' @examples
#' get_lns(.where = "cd_rvr IN ('GR', 'PR', 'WH')") |>
#' (\(x) {mapview::mapview(x)}) ()
get_lns <- function(.where = NULL) {
  if (is.null(.where)) {
    sf::st_read(system.file("extdata", "UCRB_spat.sqlite", package = "UCRBSpatialTools"),
                layer = "nhd_ctr_lns",
                stringsAsFactors = FALSE) |>
      sf::st_set_crs(4326)
  } else {
    sf::st_read(system.file("extdata", "UCRB_spat.sqlite", package = "UCRBSpatialTools"),
                query = paste("SELECT * FROM nhd_ctr_lns WHERE",
                              .where),
                stringsAsFactors = FALSE) |>
      sf::st_set_crs(4326)
  }
}
