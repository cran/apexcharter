% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/apex-utils.R
\name{ax_legend}
\alias{ax_legend}
\title{Legend properties}
\usage{
ax_legend(
  ax,
  show = NULL,
  position = NULL,
  showForSingleSeries = NULL,
  showForNullSeries = NULL,
  showForZeroSeries = NULL,
  horizontalAlign = NULL,
  fontSize = NULL,
  textAnchor = NULL,
  offsetY = NULL,
  offsetX = NULL,
  formatter = NULL,
  labels = NULL,
  markers = NULL,
  itemMargin = NULL,
  containerMargin = NULL,
  onItemClick = NULL,
  onItemHover = NULL,
  floating = NULL,
  ...
)
}
\arguments{
\item{ax}{An \code{\link[=apexchart]{apexchart()}} \code{htmlwidget} object.}

\item{show}{Logical. Whether to show or hide the legend container.}

\item{position}{Available position options for legend: \code{"top"}, \code{"right"}, \code{"bottom"}, \code{"left"}.}

\item{showForSingleSeries}{Show legend even if there is just 1 series.}

\item{showForNullSeries}{Allows you to hide a particular legend if it's series contains all null values.}

\item{showForZeroSeries}{Allows you to hide a particular legend if it's series contains all 0 values.}

\item{horizontalAlign}{Available options for horizontal alignment: \code{"right"}, \code{"center"}, \code{"left"}.}

\item{fontSize}{Sets the fontSize of legend text elements}

\item{textAnchor}{The alignment of text relative to legend's drawing position}

\item{offsetY}{Sets the top offset for legend container.}

\item{offsetX}{Sets the left offset for legend container.}

\item{formatter}{JS function. A custom formatter function to append additional text to the legend series names.}

\item{labels}{List with two items \code{"foreColor"} (Custom text color for legend labels)
and \code{"useSeriesColors"} (Logical, whether to use primary colors or not)}

\item{markers}{List.}

\item{itemMargin}{List with two items \code{"horizontal"} (Horizontal margin for individual legend item)
and \code{"vertical"} (Vertical margin for individual legend item).}

\item{containerMargin}{List with two items \code{"top"} (Top margin for the whole legend container)
and \code{"left"} (Left margin for the whole legend container).}

\item{onItemClick}{List with item \code{"toggleDataSeries"}, logical,
when clicked on legend item, it will toggle the visibility of the series in chart.}

\item{onItemHover}{List with item \code{"highlightDataSeries"}, logical,
when hovered on legend item, it will highlight the paths of the hovered series in chart.}

\item{floating}{Logical. The floating option will take out the legend from the chart area and make it float above the chart.}

\item{...}{Additional parameters.}
}
\value{
An \code{\link[=apexchart]{apexchart()}} \code{htmlwidget} object.
}
\description{
Legend properties
}
\note{
See \url{https://apexcharts.com/docs/options/legend/}
}
\examples{
data("mpg", package = "ggplot2")

# Legend position
apex(
  data = mpg,
  mapping = aes(x = manufacturer, fill = year)
) \%>\% 
  ax_legend(position = "right")

# hide legend
apex(
  data = mpg,
  mapping = aes(x = manufacturer, fill = year)
) \%>\% 
  ax_legend(show = FALSE)
}
