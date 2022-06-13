#' Map river(s)
#'
#' @param .where A SQL style WHERE statement
#' @param .points Do you want 10th river mile points mapped (TRUE) or centerlines (FALSE)
#'
#' @return A mapview interactive map
#' @export
#'
#' @examples
#' map_rvr(.where = "cd_rvr IN ('GU', 'CO')",  .points = FALSE)
#' map_rvr(.where = NULL, .points = FALSE)

map_rvr <- function(.where, .points = TRUE) {
  mapview::mapviewOptions(basemaps = "Esri.WorldImagery")
  if (.points == TRUE) {
    if (!is.null(.where)) {
      .dat <- sf::st_read(system.file("extdata", "UCRB_spat.sqlite", package = "UCRBSpatialTools"),
                          query = paste("SELECT * FROM nhd_rmi_pts WHERE",
                                         .where),
                          stringsAsFactors = FALSE)

    } else if (is.null(.where)) {
      .dat <- sf::st_read(system.file("extdata", "UCRB_spat.sqlite", package = "UCRBSpatialTools"),
                          layer = "nhd_rmi_pts",
                          stringsAsFactors = FALSE)

    }
  } else if (.points == FALSE) {
      if (!is.null(.where)) {
      .dat <- sf::st_read(system.file("extdata", "UCRB_spat.sqlite", package = "UCRBSpatialTools"),
                          query = paste("SELECT * FROM nhd_ctr_lns WHERE",
                                        .where),
                          stringsAsFactors = FALSE)

    } else if (is.null(.where)) {
    .dat <- sf::st_read(system.file("extdata", "UCRB_spat.sqlite", package = "UCRBSpatialTools"),
                        layer = "nhd_ctr_lns",
                        stringsAsFactors = FALSE)
    }
  }

  .dat |>
    sf::st_set_crs(4326) |>
    (\(x) {mapview::mapview(x, zcol = "cd_rvr", layer.name = "River Code")}) ()
}


