## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----message=FALSE, warning=FALSE---------------------------------------------
library(ggplot2)
library(scales)
library(dplyr)
library(apexcharter)

## ----column-------------------------------------------------------------------
data("mpg")
n_manufac <- count(mpg, manufacturer)

apex(data = n_manufac, type = "column", mapping = aes(x = manufacturer, y = n))

## ----bar----------------------------------------------------------------------
apex(data = n_manufac, type = "bar", mapping = aes(x = manufacturer, y = n))

## ----dodge-bar----------------------------------------------------------------
n_manufac_year <- count(mpg, manufacturer, year)

apex(data = n_manufac_year, type = "column", mapping = aes(x = manufacturer, y = n, fill = year))

## ----stacked-bar--------------------------------------------------------------
apex(data = n_manufac_year, type = "column", mapping = aes(x = manufacturer, y = n, fill = year)) %>% 
  ax_chart(stacked = TRUE)

## ----line---------------------------------------------------------------------
data("economics")
economics <- tail(economics, 100)

apex(data = economics, type = "line", mapping = aes(x = date, y = uempmed))

## ----lines--------------------------------------------------------------------
data("economics_long")
economics_long <- economics_long %>% 
  group_by(variable) %>% 
  slice((n()-100):n())

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

## ----heatmap------------------------------------------------------------------
txhousing2 <- txhousing %>% 
  filter(city %in% head(unique(city)), year %in% c(2000, 2001)) %>% 
  rename(val_med = median)

apex(
  data = txhousing2,
  type = "heatmap", 
  mapping = aes(x = date, y = city, fill = scales::rescale(val_med))
) %>% 
  ax_dataLabels(enabled = FALSE) %>% 
  ax_colors("#008FFB")

## -----------------------------------------------------------------------------
apex(
  candles, 
  aes(x = datetime, open = open, close = close, low = low, high = high),
  type = "candlestick"
)

