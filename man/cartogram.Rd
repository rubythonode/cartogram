% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cartogram.R
\name{cartogram}
\alias{cartogram}
\title{Calculate cartogram boundaries}
\usage{
cartogram(shp, weight, itermax = 15, maxSizeError = 1.0001,
  prepare = "adjust", threshold = 0.05)
}
\arguments{
\item{shp}{SpatialPolygonDataFrame}

\item{weight}{Name of the weighting variable in shp}

\item{itermax}{Maximum iterations for the cartogram transformation, if maxSizeError ist not reached}

\item{maxSizeError}{Stop if meanSizeError is smaller than maxSizeError}

\item{prepare}{Weighting values are adjusted to reach convergence much earlier. Possible methods are 
"adjust", adjust values to restrict the mass vector to the quantiles defined by threshold and 1-threshold (default),
"remove", remove features with values lower than quantile at threshold,
"none", don't adjust weighting values.}

\item{threshold}{Define threshold for data preperation.}
}
\value{
SpatialPolygonDataFrame with distorted polygon boundaries
}
\description{
Construct a continuous area cartogram by a rubber sheet distortion algorithm (Dougenik et al. 1985)
}
\examples{

library(maptools)
library(cartogram)
library(rgdal)
data(wrld_simpl)

afr <- spTransform(wrld_simpl[wrld_simpl$REGION==2 & wrld_simpl$POP2005 > 0,], 
                    CRS("+init=epsg:3395"))
par(mfcol=c(1,2))
plot(afr)
plot(cartogram(afr, "POP2005", 3))

}
\references{
Dougenik, Chrisman, Niemeyer (1985): An Algorithm To Construct Continuous Area Cartograms. In: Professional Geographer, 37(1), 75-81.
}

