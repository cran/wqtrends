% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/anlz_pvalformat.R
\name{anlz_pvalformat}
\alias{anlz_pvalformat}
\title{Format p-values for show functions}
\usage{
anlz_pvalformat(x)
}
\arguments{
\item{x}{numeric input p-value}
}
\value{
p-value formatted as a text string, one of \code{p < 0.001}, \code{'p < 0.01'}, \code{p < 0.05}, or \code{ns} for not significant
}
\description{
Format p-values for show functions
}
\examples{
anlz_pvalformat(0.05)
}
\concept{analyze}
