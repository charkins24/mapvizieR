% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/galloping_elephants.R
\name{galloping_elephants}
\alias{galloping_elephants}
\title{RIT distribution change (affectionately titled 'Galloping Elephants')}
\usage{
galloping_elephants(mapvizieR_obj, studentids, measurementscale,
  first_and_spring_only = TRUE, detail_academic_year = 2014,
  entry_grade_seasons = c(-0.8, 4.2))
}
\arguments{
\item{mapvizieR_obj}{a conforming mapvizieR object, which contains a cdf and a roster.}

\item{studentids}{which students to display?}

\item{measurementscale}{target subject}

\item{first_and_spring_only}{show all terms, or only entry & spring?  default is TRUE.}

\item{detail_academic_year}{don't mask any data for this academic year}

\item{entry_grade_seasons}{which grade_level_seasons are entry grades?}
}
\value{
a ggplot object.
}
\description{
\code{galloping_elephants} returns ggplot density distributions that show change
 in RIT over time
}

