#' Fetch all river mile point coordinates
#'
#' @param .where A SQL style WHERE statement
#'
#' @return A simple features dataframe
#' @export
#'
#' @examples
#' get_pts(.where = "cd_rvr = 'PR'
#'                   AND rmi_nhd < 20")
get_pts <- function(.where = NULL) {
  if (is.null(.where)) {
    sf::st_read(system.file("extdata", "UCRB_spat.sqlite", package = "UCRBSpatialTools"),
                layer = "nhd_rmi_pts",
                stringsAsFactors = FALSE) |>
      sf::st_set_crs(4326)
  } else {
    sf::st_read(system.file("extdata", "UCRB_spat.sqlite", package = "UCRBSpatialTools"),
                query = paste("SELECT * FROM nhd_rmi_pts WHERE",
                              .where),
                stringsAsFactors = FALSE) |>
      sf::st_set_crs(4326)
  }
}
