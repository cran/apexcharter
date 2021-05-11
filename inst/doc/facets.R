## ---- include = FALSE---------------------------------------------------------
options(rmarkdown.html_vignette.check_title = FALSE)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(apexcharter)

## ----facet-wrap---------------------------------------------------------------
library(apexcharter)
data("mpg", package = "ggplot2")

apex(mpg, aes(displ, cty), type = "scatter") %>%
  ax_xaxis(labels = list(formatter = format_num(".0f"))) %>% 
  ax_labs(
    title = "Facet wrap example",
    subtitle = "mpg data from ggplot2",
    x = "engine displacement, in litres",
    y = "city miles per gallon"
  ) %>% 
  ax_facet_wrap(vars(drv), ncol = 2)

## ----facet-wrap-sync----------------------------------------------------------
library(apexcharter)
data("economics_long", package = "ggplot2")

apex(economics_long, aes(date, value), type = "line", synchronize = "sync-it") %>% 
  ax_yaxis(
    decimalsInFloat = 0,
    labels = list(
      formatter = format_num("~s"),
      minWidth = 40
    )
  ) %>%
  ax_tooltip(x = list(format = "yyyy")) %>% 
  ax_facet_wrap(vars(variable), scales = "free_y")

## ----facet-grid---------------------------------------------------------------
library(apexcharter)
data("mpg", package = "ggplot2")

apex(mpg, aes(displ, cty), type = "scatter") %>% 
  ax_xaxis(labels = list(formatter = format_num(".0f"))) %>% 
  ax_labs(
    title = "Facet grid example",
    subtitle = "mpg data from ggplot2",
    x = "engine displacement, in litres",
    y = "city miles per gallon"
  ) %>% 
  ax_facet_grid(rows = vars(drv), cols = vars(year))

## ----apex-grid----------------------------------------------------------------
library(apexcharter)
data("mpg", package = "ggplot2")

# Construct 3 charts
a1 <- apex(mpg, aes(manufacturer), type = "bar")
a2 <- apex(mpg, aes(trans), type = "column")
a3 <- apex(mpg, aes(drv), type = "pie")

# Assemble them in a grid
apex_grid(
  a1, a2, a3, 
  grid_area = c("1 / 1 / 3 / 2", "1 / 2 / 2 / 4", "2 / 2 / 3 / 4"),
  ncol = 3, 
  nrow = 2,
  height = "600px"
)

