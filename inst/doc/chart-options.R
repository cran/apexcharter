## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----message=FALSE, warning=FALSE---------------------------------------------
library(apexcharter)
library(dplyr)

data("diamonds", package = "ggplot2")
n_cut <- count(diamonds, cut)

## -----------------------------------------------------------------------------
apex(data = n_cut, type = "column", mapping = aes(x = cut, y = n)) %>%
  ax_labs(
    title = "Cut distribution",
    subtitle = "Data from ggplot2",
    x = "Cut",
    y = "Count"
  )

## -----------------------------------------------------------------------------
apex(data = n_cut, type = "column", mapping = aes(x = cut, y = n)) %>% 
  ax_title(text = "Cut distribution")

## -----------------------------------------------------------------------------
apex(data = n_cut, type = "column", mapping = aes(x = cut, y = n)) %>% 
  ax_title(
    text = "Cut distribution", 
    align = "center",
    style = list(fontSize = "22px", fontWeight = 700)
  )

## -----------------------------------------------------------------------------
apex(data = n_cut, type = "column", mapping = aes(x = cut, y = n)) %>% 
  ax_title(text = "Cut distribution") %>% 
  ax_subtitle(text = "Data from ggplot2")

## -----------------------------------------------------------------------------
apex(data = n_cut, type = "column", mapping = aes(x = cut, y = n)) %>% 
  ax_title(
    text = "Cut distribution", 
    align = "center",
    style = list(fontSize = "22px", fontWeight = 700)
  ) %>% 
  ax_subtitle(
    text = "Data from ggplot2", 
    align = "center",
    style = list(fontSize = "16px", fontWeight = 400, color = "#BDBDBD")
  )

## -----------------------------------------------------------------------------
apex(data = n_cut, type = "column", mapping = aes(x = cut, y = n)) %>% 
  ax_yaxis(title = list(text = "Count")) %>% 
  ax_xaxis(title = list(text = "Cut"))

## -----------------------------------------------------------------------------
apex(data = n_cut, type = "column", mapping = aes(x = cut, y = n)) %>% 
  ax_yaxis(title = list(
    text = "Count",
    style = list(fontSize = "14px", color = "#BDBDBD")
  )) %>% 
  ax_xaxis(title = list(
    text = "Cut", 
    style = list(fontSize = "14px", color = "#BDBDBD")
  ))

## ----message=FALSE, warning=FALSE---------------------------------------------
library(apexcharter)
library(dplyr)

## economics dataset from ggplot2
data("economics", package = "ggplot2")
economics <- tail(economics, 50)

data("economics_long", package = "ggplot2")
economics_long <- economics_long %>% 
  filter(variable %in% c("pce", "pop")) %>% 
  group_by(variable) %>% 
  slice(tail(row_number(), 20))

## -----------------------------------------------------------------------------
apex(data = economics, type = "line", mapping = aes(x = date, y = uempmed))

## -----------------------------------------------------------------------------
apex(data = economics, type = "line", mapping = aes(x = date, y = uempmed)) %>% 
  ax_stroke(curve = "smooth")

## -----------------------------------------------------------------------------
apex(data = economics, type = "line", mapping = aes(x = date, y = uempmed)) %>% 
  ax_stroke(curve = "stepline")

## -----------------------------------------------------------------------------
apex(data = economics, type = "line", mapping = aes(x = date, y = uempmed)) %>% 
  ax_fill(
    type = "gradient",
    gradient = list(
      shade = "dark",
      gradientToColors = list("#FDD835"),
      shadeIntensity = 1,
      type = "horizontal",
      opacityFrom = 1,
      opacityTo = 1,
      stops = c(0, 100, 100, 100)
    )
  )

## -----------------------------------------------------------------------------
apex(data = economics, type = "area", mapping = aes(x = date, y = uempmed)) %>% 
  ax_fill(type = "solid", opacity = 1)

## -----------------------------------------------------------------------------
apex(data = economics, type = "line", mapping = aes(x = date, y = uempmed)) %>% 
  ax_stroke(width = 1)

## -----------------------------------------------------------------------------
apex(data = economics, type = "line", mapping = aes(x = date, y = uempmed)) %>% 
  ax_stroke(dashArray = 6)

## -----------------------------------------------------------------------------
apex(data = tail(economics, 20), type = "line", mapping = aes(x = date, y = uempmed)) %>% 
  ax_markers(size = 6)

## -----------------------------------------------------------------------------
apex(data = tail(economics, 20), type = "line", mapping = aes(x = date, y = uempmed)) %>% 
  ax_markers(size = 6) %>% 
  ax_dataLabels(enabled = TRUE)

## -----------------------------------------------------------------------------
apex(data = economics_long, type = "line", mapping = aes(x = date, y = value01, group = variable)) %>% 
  ax_yaxis(decimalsInFloat = 2) %>% 
  ax_markers(size = c(3, 6)) %>% 
  ax_stroke(width = c(1, 3))

## -----------------------------------------------------------------------------
apex(data = economics_long, type = "line", mapping = aes(x = date, y = value01, group = variable)) %>% 
  ax_yaxis(decimalsInFloat = 2) %>% 
  ax_stroke(dashArray = c(8, 5))

