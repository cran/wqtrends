% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/anlz_gam.R
\name{anlz_gam}
\alias{anlz_gam}
\title{Fit a generalized additive model to a water quality time series}
\usage{
anlz_gam(moddat, kts = NULL, ...)
}
\arguments{
\item{moddat}{input raw data, one station and paramater}

\item{kts}{optional numeric vector for the upper limit for the number of knots in the term \code{s(cont_year)}, see details}

\item{...}{additional arguments passed to other methods, i.e., \code{trans = 'log10'} (default) or \code{trans = 'ident'} passed to \code{\link{anlz_trans}}}
}
\value{
a \code{\link[mgcv]{gam}} model object
}
\description{
Fit a generalized additive model to a water quality time series
}
\details{
The model structure is as follows:

\describe{
 \item{model S:}{chl ~ s(cont_year, k = large)}
}
The \code{cont_year} vector is measured as a continuous numeric variable for the annual effect (e.g., January 1st, 2000 is 2000.0, July 1st, 2000 is 2000.5, etc.) and \code{doy} is the day of year as a numeric value from 1 to 366.  The function \code{\link[mgcv]{s}} models \code{cont_year} as a smoothed, non-linear variable. The optimal amount of smoothing on \code{cont_year} is determined by cross-validation as implemented in the mgcv package and an upper theoretical upper limit on the number of knots for \code{k} should be large enough to allow sufficient flexibility in the smoothing term.  The upper limit of \code{k} was chosen as 12 times the number of years for the input data. If insufficient data are available to fit a model with the specified \code{k}, the number of knots is decreased until the data can be modelled, e.g., 11 times the number of years, 10 times the number of years, etc.
}
\examples{
library(dplyr)
tomod <- rawdat \%>\% 
  filter(station \%in\% 34) \%>\% 
  filter(param \%in\% 'chl')
anlz_gam(tomod, trans = 'log10')
}
\concept{analyze}
