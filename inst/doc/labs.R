## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----message=FALSE, warning=FALSE---------------------------------------------
library(apexcharter)
library(dplyr)

data("diamonds", package = "ggplot2")
n_cut <- dplyr::count(diamonds, cut)

## -----------------------------------------------------------------------------
apex(data = n_cut, type = "column", mapping = aes(x = cut, y = n)) %>% 
  ax_title(text = "Cut distribution")

## -----------------------------------------------------------------------------
apex(data = n_cut, type = "column", mapping = aes(x = cut, y = n)) %>% 
  ax_title(
    text = "Cut distribution", 
    align = "center",
    style = list(fontSize = "22px")
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
    style = list(fontSize = "22px")
  ) %>% 
  ax_subtitle(
    text = "Data from ggplot2", 
    align = "center",
    style = list(fontSize = "16px", color = "#BDBDBD")
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

