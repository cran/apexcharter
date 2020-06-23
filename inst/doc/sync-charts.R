## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(apexcharter)
data("economics", package = "ggplot2")

## ----example-1, eval=FALSE----------------------------------------------------
#  apex(
#    data = tail(economics, 150),
#    mapping = aes(x = date, y = pce),
#    type = "line",
#    synchronize = "economics"
#  )
#  
#  apex(
#    data = tail(economics, 150),
#    mapping = aes(x = date, y = psavert),
#    type = "line",
#    synchronize = "economics"
#  )

## ----run-example-1, echo=FALSE, ref.label="example-1"-------------------------
apex(
  data = tail(economics, 150), 
  mapping = aes(x = date, y = pce),
  type = "line", 
  synchronize = "economics"
)

apex(
  data = tail(economics, 150), 
  mapping = aes(x = date, y = psavert),
  type = "line", 
  synchronize = "economics"
)

## ----shiny-example, eval=FALSE------------------------------------------------
#  run_sync_demo()

## ----example-2, eval=FALSE----------------------------------------------------
#  apex(
#    data = economics,
#    mapping = aes(x = date, y = psavert),
#    type = "line"
#  ) %>%
#    ax_chart(
#      id = "target-chart", # <-- define target id here
#      toolbar = list(
#        autoSelected = "pan",
#        show = FALSE
#      )
#    )
#  
#  apex(
#    data = economics,
#    mapping = aes(x = date, y = psavert),
#    type = "line",
#    height = "130px"
#  ) %>%
#    ax_chart(
#      brush = list(
#        target = "target-chart", # <-- use target id here
#        enabled = TRUE
#      ),
#      offsetY = -20,
#      selection = list(
#        enabled = TRUE, # <-- enable selection and define starting range
#        xaxis = list(
#          min = format_date(economics$date[1]),
#          max = format_date(economics$date[100])
#        )
#      )
#    ) %>%
#    ax_xaxis(labels = list(show = FALSE)) %>%
#    ax_yaxis(labels = list(show = FALSE))

## ----run-example-2, echo=FALSE, ref.label="example-2"-------------------------
apex(
  data = economics, 
  mapping = aes(x = date, y = psavert),
  type = "line"
) %>% 
  ax_chart(
    id = "target-chart", # <-- define target id here
    toolbar = list(
      autoSelected = "pan",
      show = FALSE
    )
  )

apex(
  data = economics, 
  mapping = aes(x = date, y = psavert),
  type = "line", 
  height = "130px"
) %>% 
  ax_chart(
    brush = list(
      target = "target-chart", # <-- use target id here
      enabled = TRUE
    ),
    offsetY = -20,
    selection = list(
      enabled = TRUE, # <-- enable selection and define starting range
      xaxis = list(
        min = format_date(economics$date[1]),
        max = format_date(economics$date[100])
      )
    )
  ) %>% 
  ax_xaxis(labels = list(show = FALSE)) %>% 
  ax_yaxis(labels = list(show = FALSE))

