% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/apexcharter.R, R/spark-box.R
\name{apexcharter-shiny}
\alias{apexcharter-shiny}
\alias{apexchartOutput}
\alias{renderApexchart}
\alias{sparkBoxOutput}
\alias{renderSparkBox}
\title{Shiny bindings for apexcharter}
\usage{
apexchartOutput(outputId, width = "100\%", height = "400px")

renderApexchart(expr, env = parent.frame(), quoted = FALSE)

sparkBoxOutput(outputId, width = "100\%", height = "160px")

renderSparkBox(expr, env = parent.frame(), quoted = FALSE)
}
\arguments{
\item{outputId}{Output variable to read from.}

\item{width, height}{Must be a valid CSS unit (like \verb{100\%},
\verb{400px}, \code{auto}) or a number, which will be coerced to a
string and have \code{px} appended.}

\item{expr}{An expression that generates a calendar}

\item{env}{The environment in which to evaluate \code{expr}.}

\item{quoted}{Is \code{expr} a quoted expression (with \code{quote()})? This
is useful if you want to save an expression in a variable.}
}
\value{
Output element that can be included in UI. Render function to create output in server.
}
\description{
Output and render functions for using apexcharter within Shiny
applications and interactive Rmd documents.
}
\note{
To render a chart with facets (using \code{\link[=ax_facet_wrap]{ax_facet_wrap()}} or \code{\link[=ax_facet_grid]{ax_facet_grid()}}) in Shiny,
see \code{\link[=apexfacetOutput]{apexfacetOutput()}} (in UI) and \code{\link[=renderApexfacet]{renderApexfacet()}} (in Server).
}
\examples{
if (interactive()) {
  library(shiny)
  library(apexcharter)
  
  ui <- fluidPage(
    fluidRow(
      column(
        width = 8, offset = 2,
        tags$h2("Apexchart in Shiny"),
        actionButton("redraw", "Redraw chart"),
        apexchartOutput("chart")
      )
    )
  )
  
  server <- function(input, output, session) {
    
    output$chart <- renderApexchart({
      input$redraw
      apexchart() \%>\%
        ax_chart(type = "bar") \%>\%
        ax_series(
          list(
            name = "Example",
            data = sample(1:100, 5)
          )
        ) \%>\%
        ax_xaxis(
          categories = LETTERS[1:5]
        )
    })
    
  }
  
  shinyApp(ui, server)
}
}
