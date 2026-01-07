## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  screenshot.force = FALSE
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
data("eco2mix", package = "apexcharter")

apex(eco2mix, aes(datetime, production, fill = source), type = "area") %>% 
  ax_chart(animations = list(enabled = FALSE), stacked = TRUE) %>% 
  ax_stroke(width = 1) %>% 
  ax_fill(opacity = 1, type = "solid") %>% 
  ax_tooltip(x = list(format = "dd MMM, HH:mm")) %>% 
  ax_yaxis(labels = list(formatter = format_num("~", suffix = "MW"))) %>% 
  ax_colors_manual(
    list(
      "bioenergies" = "#156956",
      "fuel" = "#80549f",
      "coal" = "#a68832",
      "solar" = "#d66b0d",
      "gas" = "#f20809",
      "wind" = "#72cbb7",
      "hydraulic" = "#2672b0",
      "nuclear" = "#e4a701",
      "pumping" = "#0e4269"
    )
  ) %>% 
  ax_labs(
    title = "Electricity generation by sector in France",
    subtitle = "Data from \u00e9CO\u2082mix"
  )

## ----ribbon-------------------------------------------------------------------
data("temperatures", package = "apexcharter")

apex(
  temperatures, 
  aes(x = date, ymin = low, ymax = high), 
  type = "rangeArea", 
  serie_name = "Low/High (2018-2021)"
) %>% 
  add_line(aes(date, `2023`)) %>% 
  ax_chart(animations = list(enabled = FALSE)) %>% 
  ax_yaxis(tickAmount = 7, labels = list(formatter = format_num("~", suffix = "°C"))) %>% 
  ax_colors(c("#8485854D", "#FF0000")) %>%
  ax_stroke(width = c(1, 2)) %>% 
  ax_fill(opacity = 1, type = "solid") %>% 
  ax_labs(
    title = "Temperatures in 2023 with range from 2018 to 2021",
    subtitle = "Data from ENEDIS"
  )

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

## ----donut--------------------------------------------------------------------
apex(data = poll, type = "donut", mapping = aes(x = answer, y = n))

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

## ----boxplot------------------------------------------------------------------
data("mpg", package = "ggplot2")
apex(mpg, aes(hwy, class), "boxplot") %>% 
  ax_plotOptions(
    boxPlot = boxplot_opts(color.upper = "#8BB0A6", color.lower = "#8BB0A6" )
  ) %>% 
  ax_stroke(colors = list("#2A5769")) %>% 
  ax_grid(
    xaxis = list(lines = list(show = TRUE)),
    yaxis = list(lines = list(show = FALSE))
  )

## ----dumbbell-----------------------------------------------------------------
data("life_expec", package = "apexcharter")

apex(life_expec, aes(country, x = `1972`, xend = `2007`), type = "dumbbell") %>% 
  ax_plotOptions(
    bar = bar_opts(
      dumbbellColors = list(list("#3d85c6", "#fb6003"))
    )
  ) %>% 
  ax_colors("#BABABA") %>% 
  ax_labs(
    title = "Life expectancy : 1972 vs. 2007",
    subtitle = "Data from Gapminder dataset",
    x = "Life expectancy at birth, in years"
  )

## ----slope--------------------------------------------------------------------
data("life_expec_long", package = "apexcharter")

apex(
  life_expec_long,
  mapping = aes(x = year, y = lifeExp, fill = country),
  type = "slope",
  height = "700px"
) %>% 
  ax_chart(animations = list(enabled = FALSE)) %>% 
  # aurora nord12 = #d08770 / aurora nord14 = #a3be8c -> darken colorspace::darken(, amount = 0.3)
  ax_colors(ifelse(unique(life_expec_long[, c("country", "type")])$type == "decreased", "#955945", "#6A8354")) %>% 
  ax_labs(
    title = "Life expectancy : 1972 vs. 2007",
    subtitle = "Data from Gapminder dataset",
    x = "Life expectancy at birth, in years"
  ) %>% 
  # ax_dataLabels(enabled = FALSE) %>% # show or note the labels + values
  ax_xaxis(position = "bottom")

