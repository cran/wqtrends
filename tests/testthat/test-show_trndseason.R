test_that("Checking show_trndseason class", {
  
  result <- show_trndseason(mod, doystr = 90, doyend = 180, justify = 'left', win = 5, ylab = 'Slope chlorophyll-a (ug/L)')
  
  expect_is(result, 'ggplot')
  
})

test_that("Checking show_trndseason class, type = approx", {
  
  result <- show_trndseason(mod, doystr = 90, doyend = 180, type = 'approx', justify = 'left', win = 5, ylab = 'Slope chlorophyll-a (ug/L)')
  
  expect_is(result, 'ggplot')
  
})

test_that("Checking show_trndseason class, model ident", {
  
  result <- show_trndseason(modident, doystr = 90, doyend = 180, justify = 'left', win = 5, ylab = 'Slope chlorophyll-a (ug/L)')
  
  expect_is(result, 'ggplot')
  
})

test_that("Checking show_trndseason nms inputs", {
  
  expect_error(show_trndseason(modident, doystr = 90, doyend = 180, justify = 'left', win = 5, ylab = 'Slope chlorophyll-a (ug/L)', nms = 'error'), 'Three names, fills, or colors must be provided')
  
})
