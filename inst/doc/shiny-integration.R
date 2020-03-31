## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  eval = FALSE
)
library(apexcharter)

## ----setup--------------------------------------------------------------------
#  library(apexcharter)

## -----------------------------------------------------------------------------
#  apex(..., auto_update = TRUE)

## -----------------------------------------------------------------------------
#  apex(..., auto_update = FALSE)

## -----------------------------------------------------------------------------
#  apex(..., auto_update = config_update(update_options = TRUE))

## -----------------------------------------------------------------------------
#  output$my_chart <- renderApexchart({
#    apex(data = isolate(data_reactive()), ..., auto_update = FALSE)
#  })
#  
#  observeEvent(input$update, {
#    apexchartProxy("my_chart") %>%
#      ax_proxy_series(data_reactive())
#  })

## -----------------------------------------------------------------------------
#  observeEvent(input$update, {
#    apexchartProxy("my_chart") %>%
#      ax_proxy_options(list(
#        title = list(
#          text = "New title"
#        ),
#        xaxis = list(
#          max = NEW_VALUE
#        )
#      ))
#  })

## ---- eval=TRUE---------------------------------------------------------------
data.frame(
  month = month.abb,
  value = sample(1:100, 12)
) %>% 
  apex(aes(month, value), height = "250px") %>% 
  ax_title("Click a bar:") %>% 
  set_input_click("click")

## ---- eval=TRUE---------------------------------------------------------------
data.frame(
  month = month.abb,
  value = sample(1:100, 12)
) %>% 
  apex(aes(month, value), height = "250px") %>% 
  ax_title("Click several bars:") %>% 
  set_input_click(
    inputId = "click", 
    multiple = TRUE, 
    effect_value = 0.1
  )

## -----------------------------------------------------------------------------
#  run_input_demo("click")

## ---- eval=TRUE---------------------------------------------------------------
data("economics", package = "ggplot2")
apex(economics, aes(date, psavert), type = "line", height = "250px") %>% 
  set_input_zoom("zoom")

## ---- echo=FALSE, eval=TRUE---------------------------------------------------
list(
  x = list(
    min = "1981-10-24 15:41:16 UTC",
    max = "1992-01-24 06:40:22 UTC"
  ),
  y = list(
    min = NULL,
    max = NULL
  )
)

## -----------------------------------------------------------------------------
#  run_input_demo("zoom")

## ---- eval=TRUE---------------------------------------------------------------
apex(economics, aes(date, psavert), type = "line", height = "250px") %>% 
  set_input_selection("selection")

## ---- echo=FALSE, eval=TRUE---------------------------------------------------
list(
  x = list(
    min = "1981-10-24 15:41:16 UTC",
    max = "1992-01-24 06:40:22 UTC"
  )
)

## ---- eval=TRUE---------------------------------------------------------------
apex(economics, aes(date, psavert), type = "line", height = "250px") %>% 
  set_input_selection(
    inputId = "selection", 
    xmin = format_date("1980-01-01"), 
    xmax = format_date("1985-01-01")
  )

## ---- eval=TRUE---------------------------------------------------------------
apex(iris, aes(Sepal.Length, Sepal.Width), type = "scatter", height = "250px") %>% 
  set_input_selection("selection_scatter", type = "xy")

## ---- echo=FALSE, eval=TRUE---------------------------------------------------
list(
  x = list(
    min = 5.130187,
    max = 5.541228
  ),
  y = list(
    min = 2.959623,
    max = 3.860357
  )
)

## -----------------------------------------------------------------------------
#  run_input_demo("selection")

