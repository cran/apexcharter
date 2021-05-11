## ---- include = FALSE---------------------------------------------------------
options(rmarkdown.html_vignette.check_title = FALSE)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(apexcharter)

spark_data <- data.frame(
  date = Sys.Date() + 1:20,
  var1 = round(rnorm(20, 50, 10)),
  var2 = round(rnorm(20, 50, 10)),
  var3 = round(rnorm(20, 50, 10))
)

## -----------------------------------------------------------------------------
spark_box(
  data = spark_data,
  title = mean(spark_data$var1), 
  subtitle = "Variable 1"
)

## -----------------------------------------------------------------------------
spark_box(
  data = spark_data,
  title = mean(spark_data$var1), 
  subtitle = "Variable 1",
  color = "#FFF", background = "#2E93fA",
  title_style = list(color = "#FFF"),
  subtitle_style = list(color = "#FFF")
)

## ---- eval=FALSE--------------------------------------------------------------
#  run_sparkbox_demo()

