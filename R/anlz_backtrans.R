#' Back-transform response variable
#' 
#' Back-transform response variable after fitting GAM
#' 
#' @param dat input data with \code{trans} argument
#'
#' @return \code{dat} with the \code{value} column back-transformed using info from the \code{trans} column
#' @export
#' 
#' @details \code{dat} can be output from \code{\link{anlz_trans}} or \code{\link{anlz_prd}}
#' 
#' @concept analyze
#' 
#' @examples
#' library(dplyr)
#' 
#' tomod <- rawdat %>% 
#'   filter(station %in% 34) %>% 
#'   filter(param %in% 'chl')
#' dat <- anlz_trans(tomod, trans = 'log10')
#' backtrans <- anlz_backtrans(dat)
#' head(backtrans)
#' 
#' mod <- anlz_gam(tomod, trans = 'log10')
#' dat <- anlz_prd(mod)
#' backtrans <- anlz_backtrans(dat)
#' head(backtrans)
anlz_backtrans <- function(dat){
  
  if(!'trans' %in% names(dat))
    stop('trans info not found in dat')
  
  trans <- unique(dat$trans)

  # log
  if(trans == 'log10')
    dat <- dat %>% 
      dplyr::mutate_if(grepl('value', names(.)), ~10 ^ .)
  
  return(dat)
  
}