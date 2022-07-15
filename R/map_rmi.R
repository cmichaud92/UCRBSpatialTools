#' Specify locations by river code and mile and visualize them on map
#'
#' @param .cd_rvr A UCRB Program river code
#' @param .rmi_nhd A river mile based on NHD data
#'
#' @return An interactive map
#' @export
#'
#' @examples
#' map_rmi(.cd_rvr = "GR", .rmi_nhd = c(42, 52, 120))
map_rmi <- function(.cd_rvr, .rmi_nhd) {
  mapview::mapviewOptions(basemaps = c("Esri.WorldImagery", "OpenTopoMap"))
  dat <- sf::st_read(system.file("extdata", "UCRB_spat.sqlite", package = "UCRBSpatialTools"),
          layer = "nhd_rmi_pts",
          stringsAsFactors = FALSE) |>
    dplyr::filter(cd_rvr == .cd_rvr &
                    rmi_nhd %in% .rmi_nhd) |>
    (\(x) {mapview::mapview(x)}) ()
}




