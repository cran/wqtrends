#' Fit a mixed meta-analysis regression model of trends
#' 
#' Fit a mixed meta-analysis regression model of trends
#' 
#' @param metseason output from \code{\link{anlz_metseason}}
#' @param yrstr numeric for starting year
#' @param yrend numeric for ending year
#' @details Parameters are not back-transformed if the original GAM used a transformation of the response variable
#' 
#' @concept analyze
#' 
#' @return A list of \code{\link[mixmeta]{mixmeta}} fitted model objects
#' @export
#'
#' @examples
#' library(dplyr)
#' 
#' # data to model
#' tomod <- rawdat %>%
#'   filter(station %in% 34) %>%
#'   filter(param %in% 'chl') %>% 
#'   filter(yr > 2015)
#'
#' mod <- anlz_gam(tomod, trans = 'log10')
#' metseason <- anlz_metseason(mod, doystr = 90, doyend = 180)
#' anlz_mixmeta(metseason, yrstr = 2016, yrend = 2019)
anlz_mixmeta <- function(metseason, yrstr = 2000, yrend = 2019){

  # input
  totrnd <- metseason %>% 
    dplyr::mutate(S = se^2) %>% 
    dplyr::filter(yr %in% seq(yrstr, yrend))

  if(nrow(totrnd) != length(seq(yrstr, yrend)))
    return(NA)
  
  out <- try(mixmeta::mixmeta(met ~ yr, S = S, random = ~1|yr, data = totrnd, method = 'reml'), silent = TRUE)
  if(inherits(out, 'try-error'))
    return(NA)
    
  return(out)

}
