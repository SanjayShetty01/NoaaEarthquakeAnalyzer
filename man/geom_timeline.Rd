% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Geom_Timeline.R
\name{geom_timeline}
\alias{geom_timeline}
\title{Function to visualize of the timeline of the Earthquakes}
\usage{
geom_timeline(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  ...
)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link[ggplot2:aes]{aes()}} or
\code{\link[ggplot2:aes_]{aes_()}}. If specified and \code{inherit.aes = TRUE} (the
default), it is combined with the default mapping at the top level of the
plot. You must supply \code{mapping} if there is no plot mapping.}

\item{data}{A Dataframe}

\item{stat}{The statistical transformation to use on the data for this
layer, as a string.}

\item{position}{Position adjustment, either as a string, or the result of
a call to a position adjustment function.}

\item{na.rm}{specifies how default missing values are approached}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.
It can also be a named logical vector to finely select the aesthetics to
display.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. \code{\link[ggplot2:borders]{borders()}}.}

\item{...}{additional parameters}
}
\value{
A Plot of timeline of Earthquakes
}
\description{
Function to visualize of the timeline of the Earthquakes
}
\examples{
\dontrun{
data = system.file('extdata', 'earthquakesData.tsv', package ='masteringSoftwareDevelopmentinR') \%>\%
data = read_data(data) \%>\%
eq_clean_data() \%>\%
dplyr::filter(datetime >= "1980-01-01" & datetime <="2014-01-01" & COUNTRY == c("BRAZIL"))\%>\%
ggplot() +
geom_timeline(aes(x = datetime, size = EQ_MAG_ML, color = DEATHS, fill = DEATHS))
}

}
