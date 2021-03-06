% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_pts.R
\name{get_pts}
\alias{get_pts}
\title{Fetch all river mile point coordinates}
\usage{
get_pts(.where = NULL)
}
\arguments{
\item{.where}{A SQL style WHERE statement}
}
\value{
A simple features dataframe
}
\description{
Fetch all river mile point coordinates
}
\examples{
get_pts(.where = "cd_rvr = 'PR'
                  AND rmi_nhd < 20")
}
