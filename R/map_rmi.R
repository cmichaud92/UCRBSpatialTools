map_rmi <- function(.cd_rvr, .rmi_nhd) {
  mapview::mapviewOptions(basemaps = c("Esri.WorldImagery", "OpenTopoMap"))
  dat <- sf::st_read(system.file("extdata", "UCRB_spat.sqlite", package = "UCRBSpatialTools"),
          layer = "nhd_rmi_pts",
          stringsAsFactors = FALSE) %>%
    filter(cd_rvr == .cd_rvr &
             rmi_nhd %in% .rmi_nhd) %>%
    mapview()
}




