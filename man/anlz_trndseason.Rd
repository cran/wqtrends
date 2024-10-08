% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/anlz_trndseason.R
\name{anlz_trndseason}
\alias{anlz_trndseason}
\title{Estimate rates of change based on seasonal metrics}
\usage{
anlz_trndseason(
  mod,
  metfun = mean,
  doystr = 1,
  doyend = 364,
  justify = c("center", "left", "right"),
  win = 5,
  nsim = 10000,
  yromit = NULL,
  useave = FALSE,
  ...
)
}
\arguments{
\item{mod}{input model object as returned by \code{\link{anlz_gam}}}

\item{metfun}{function input for metric to calculate, e.g., \code{mean}, \code{var}, \code{max}, etc}

\item{doystr}{numeric indicating start Julian day for extracting averages}

\item{doyend}{numeric indicating ending Julian day for extracting averages}

\item{justify}{chr string indicating the justification for the trend window}

\item{win}{numeric indicating number of years to use for the trend window, see details}

\item{nsim}{numeric indicating number of random draws for simulating uncertainty}

\item{yromit}{optional numeric vector for years to omit from the output}

\item{useave}{logical indicating if \code{anlz_avgseason} is used for the seasonal metric calculation, see details}

\item{...}{additional arguments passed to \code{metfun}, e.g., \code{na.rm = TRUE}}
}
\value{
A data frame of slope estimates and p-values for each year
}
\description{
Estimate rates of change based on seasonal metrics
}
\details{
Trends are based on the slope of the fitted linear trend within the window, where the linear trend is estimated using a meta-analysis regression model (from \code{\link{anlz_mixmeta}}) for the seasonal metrics (from \code{\link{anlz_metseason}}). Set \code{useave = T} to speed up calculations if \code{metfun = mean}.  This will use \code{\link{anlz_avgseason}} to estimate the seasonal summary metrics using a non-stochastic equation.

Note that for left and right windows, the exact number of years in \code{win} is used. For example, a left-centered window for 1990 of ten years will include exactly ten years from 1990, 1991, ... , 1999.  The same applies to a right-centered window, e.g., 1990 would include 1981, 1982, ..., 1990 (if those years have data). However, for a centered window, picking an even number of years for the window width will create a slightly off-centered window because it is impossible to center on an even number of years.  For example, if \code{win = 8} and \code{justify = 'center'}, the estimate for 2000 will be centered on 1997 to 2004 (three years left, four years right, eight years total). Centering for window widths with an odd number of years will always create a symmetrical window, i.e., if \code{win = 7} and \code{justify = 'center'}, the estimate for 2000 will be centered on 1997 and 2003 (three years left, three years right, seven years total).

The optional \code{yromit} vector can be used to omit years from the trend assessment. This may be preferred if seasonal estimates for a given year have very wide confidence intervals likely due to limited data, which can skew the trend assessments.
}
\examples{
library(dplyr)

# data to model
tomod <- rawdat \%>\%
  filter(station \%in\% 34) \%>\%
  filter(param \%in\% 'chl') \%>\% 
  filter(yr > 2015)

mod <- anlz_gam(tomod, trans = 'log10')
anlz_trndseason(mod, doystr = 90, doyend = 180, justify = 'center', win = 4)
}
\seealso{
Other analyze: 
\code{\link{anlz_sumtrndseason}()},
\code{\link{anlz_trans}()}
}
\concept{analyze}
