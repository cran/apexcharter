## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----packages, message=FALSE, warning=FALSE-----------------------------------
library(ggplot2)
library(scales)
library(apexcharter)

## ----column-------------------------------------------------------------------
data("mpg")

apex(data = mpg, type = "column", mapping = aes(x = manufacturer))

## ----bar----------------------------------------------------------------------
apex(data = mpg, type = "bar", mapping = aes(x = manufacturer))

## ----dodge-bar----------------------------------------------------------------
apex(data = mpg, type = "column", mapping = aes(x = manufacturer, fill = year))

## ----stacked-bar--------------------------------------------------------------
apex(data = mpg, type = "column", mapping = aes(x = manufacturer, fill = year)) %>% 
  ax_chart(stacked = TRUE)

## ----line---------------------------------------------------------------------
data("economics")

apex(data = economics, type = "line", mapping = aes(x = date, y = uempmed))

## ----lines--------------------------------------------------------------------
data("economics_long")

apex(data = economics_long, type = "line", mapping = aes(x = date, y = value01, group = variable)) %>% 
  ax_yaxis(decimalsInFloat = 2) # number of decimals to keep

## ----area---------------------------------------------------------------------
apex(data = economics_long, type = "area", mapping = aes(x = date, y = value01, fill = variable)) %>% 
  ax_yaxis(decimalsInFloat = 2) %>% # number of decimals to keep
  ax_chart(stacked = TRUE) %>%
  ax_yaxis(max = 4, tickAmount = 4)

## ----scatter------------------------------------------------------------------
apex(data = mtcars, type = "scatter", mapping = aes(x = wt, y = mpg))

## ----scatter-fill-------------------------------------------------------------
apex(data = mtcars, type = "scatter", mapping = aes(x = wt, y = mpg, fill = cyl))

## ----bubbles------------------------------------------------------------------
apex(data = mtcars, type = "scatter", mapping = aes(x = wt, y = mpg, z = scales::rescale(qsec)))

## ----pie----------------------------------------------------------------------
poll <- data.frame(
  answer = c("Yes", "No"),
  n = c(254, 238)
)

apex(data = poll, type = "pie", mapping = aes(x = answer, y = n))

## ----radial-------------------------------------------------------------------
apex(data = NULL, type = "radialBar", mapping = aes(x = "My value", y = 65))

## ----radial-mult--------------------------------------------------------------
fruits <- data.frame(
  name = c('Apples', 'Oranges', 'Bananas', 'Berries'),
  value = c(44, 55, 67, 83)
)

apex(data = fruits, type = "radialBar", mapping = aes(x = name, y = value))


## ----radar--------------------------------------------------------------------
mtcars$model <- rownames(mtcars)

apex(data = head(mtcars), type = "radar", mapping = aes(x = model, y = qsec))

## ----radar-mult---------------------------------------------------------------
# extremely complicated reshaping
new_mtcars <- reshape(
  data = head(mtcars), 
  idvar = "model", 
  varying = list(c("drat", "wt")),
  times = c("drat", "wt"),
  direction = "long",
  v.names = "value",
  drop = c("mpg", "cyl", "hp", "dist", "qsec", "vs", "am", "gear", "carb")
)

apex(data = new_mtcars, type = "radar", mapping = aes(x = model, y = value, group = time))

## ----polar-area---------------------------------------------------------------
apex(mtcars, aes(rownames(mtcars), mpg), type = "polarArea") %>% 
  ax_legend(show = FALSE) %>% 
  ax_colors(col_numeric("Blues", domain = NULL)(mtcars$mpg)) %>% 
  ax_fill(opacity = 1) %>% 
  ax_stroke(width = 0) %>% 
  ax_tooltip(fillSeriesColor = FALSE)

## ----heatmap------------------------------------------------------------------
# create some data
sales <- expand.grid(year = 2010:2020, month = month.name)
sales$value <- sample(-10:30, nrow(sales), TRUE)

apex(
  data = sales,
  type = "heatmap", 
  mapping = aes(x = year, y = month, fill = value)
) %>% 
  ax_dataLabels(enabled = FALSE) %>% 
  ax_colors("#008FFB")

## ----treemap------------------------------------------------------------------
data("mpg", package = "ggplot2")

apex(mpg, aes(x = manufacturer), "treemap")

## ----candlestick--------------------------------------------------------------
data("candles", package = "apexcharter")

apex(
  candles, 
  aes(x = datetime, open = open, close = close, low = low, high = high),
  type = "candlestick"
)

