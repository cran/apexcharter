% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/facets.R
\name{apexcharter-shiny-facets}
\alias{apexcharter-shiny-facets}
\alias{apexfacetOutput}
\alias{renderApexfacet}
\title{Shiny bindings for faceting with apexcharter}
\usage{
apexfacetOutput(outputId)

renderApexfacet(expr, env = parent.frame(), quoted = FALSE)
}
\arguments{
\item{outputId}{output variable to read from}

\item{expr}{An expression that generates a apexcharter facet with \code{\link[=ax_facet_wrap]{ax_facet_wrap()}} or \code{\link[=ax_facet_grid]{ax_facet_grid()}}.}

\item{env}{The environment in which to evaluate \code{expr}.}

\item{quoted}{Is \code{expr} a quoted expression (with \code{quote()})? This
is useful if you want to save an expression in a variable.}
}
\value{
An Apexcharts output that can be included in the application UI.
}
\description{
Output and render functions for using apexcharter faceting within Shiny
applications and interactive Rmd documents.
}
\examples{

library(shiny)
library(apexcharter)

data("unhcr_ts")
refugees <- unhcr_ts \%>\% 
  subset(
    population_type == "Refugees (incl. refugee-like situations)"
  ) \%>\% 
  transform(date = as.Date(paste0(year, "-01-01")))


ui <- fluidPage(
  
  tags$h2("Apexcharts Facets Example"),
  
  apexfacetOutput("myfacet")
  
)

server <- function(input, output, session) {
  
  output$myfacet <- renderApexfacet({
    apex(refugees, aes(date, n), type = "column") \%>\% 
      ax_yaxis(tickAmount = 5) \%>\% 
      ax_facet_wrap(
        vars(continent_origin), 
        scales = "free"
      )
  })
  
}

if (interactive())
  shinyApp(ui, server)
}
\seealso{
\code{\link[=ax_facet_wrap]{ax_facet_wrap()}}, \code{\link[=ax_facet_grid]{ax_facet_grid()}}
}
