## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  message = F, warning = F, 
  fig.align = "center", 
  echo = T
)

library(dplyr)
library(wqtrends)
library(plotly)
library(english)

## -----------------------------------------------------------------------------
head(rawdat)

## -----------------------------------------------------------------------------
tomod <- rawdat %>%
 filter(station %in% 34) %>%
 filter(param %in% "chl")
mod <- anlz_gam(tomod, trans = "log10")
mod

## -----------------------------------------------------------------------------
anlz_smooth(mod)
anlz_fit(mod)

## ----fig.height = 5, fig.width = 6--------------------------------------------
ylab <- "Chlorophyll-a"
show_prddoy(mod, ylab = ylab)

## ----fig.height = 4, fig.width = 6--------------------------------------------
show_prdseries(mod, ylab = ylab)

## ----fig.height = 4, fig.width = 6--------------------------------------------
show_prdseason(mod, ylab = ylab)

## -----------------------------------------------------------------------------
show_prd3d(mod, ylab = ylab)

## -----------------------------------------------------------------------------
anlz_perchg(mod, baseyr = 2006, testyr = 2017)

## ----fig.height = 4, fig.width = 9--------------------------------------------
show_perchg(mod, baseyr = 2006, testyr = 2017, ylab = "Chlorophyll-a (ug/L)")

## -----------------------------------------------------------------------------
metseason <- anlz_metseason(mod, metfun = max, doystr = 90, doyend = 180, nsim = 100)
metseason

## -----------------------------------------------------------------------------
anlz_mixmeta(metseason, yrstr = 2006, yrend = 2017)

## ----fig.height = 4, fig.width = 9, echo = T----------------------------------
show_metseason(mod, doystr = 90, doyend = 180, yrstr = 2006, yrend = 2017, ylab = "Chlorophyll-a (ug/L)")

## ----fig.height = 4, fig.width = 9, echo = T----------------------------------
show_metseason(mod, doystr = 90, doyend = 180, yrstr = NULL, yrend = NULL, ylab = "Chlorophyll-a (ug/L)")

## ----fig.height = 4, fig.width = 9, echo = T----------------------------------
show_metseason(mod, metfun = max, nsim = 100, doystr = 90, doyend = 180, yrstr = 2006, yrend = 2017, ylab = "Chlorophyll-a (ug/L)")

## -----------------------------------------------------------------------------
trndseason <- anlz_trndseason(mod, doystr = 90, doyend = 180, justify = 'left', win = 5)
head(trndseason)

## ----fig.height = 5, fig.width = 9, echo = T----------------------------------
show_trndseason(mod, doystr = 90, doyend = 180, justify = 'left', win = 5, ylab = 'Chl. change/yr, average')

## ----fig.height = 5, fig.width = 9, echo = T----------------------------------
show_trndseason(mod, metfun = max, nsim = 100, doystr = 90, doyend = 180, justify = 'left', win = 5, ylab = 'Chl. change/yr, maximum')

## ----fig.height = 5, fig.width = 9, echo = T----------------------------------
show_trndseason(mod, metfun = max, nsim = 100, doystr = 90, doyend = 180, justify = 'left', win = 5, ylab = 'Chl. change/yr, maximum', usearrow = T)

## ----fig.height = 7, fig.width = 9, echo = T----------------------------------
show_sumtrndseason(mod, doystr = 90, doyend = 180, justify = 'left', win = 5:15)

## ----fig.height = 5, fig.width = 9, echo = T----------------------------------
show_mettrndseason(mod, metfun = mean, doystr = 90, doyend = 180, ylab = "Chlorophyll-a (ug/L)", win = 5, justify = 'left')

## ----fig.height = 5, fig.width = 9, echo = T----------------------------------
show_mettrndseason(mod, metfun = mean, doystr = 90, doyend = 180, ylab = "Chlorophyll-a (ug/L)", win = 5, justify = 'left', cmbn = T)

