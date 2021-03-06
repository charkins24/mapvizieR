% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cgp_prep.R
\name{rit_to_npr}
\alias{rit_to_npr}
\title{rit_to_npr}
\usage{
rit_to_npr(measurementscale, current_grade, season, RIT, norms = 2015)
}
\arguments{
\item{measurementscale}{MAP subject}

\item{current_grade}{grade level}

\item{season}{c('fall', 'winter', 'spring')}

\item{RIT}{rit score}

\item{norms}{which school growth study to use.  c(2012, 2015).  default is
2015.}
}
\value{
a integer vector length one
}
\description{
given a RIT score, return the best match percentile rank.
(assumes the subject is a student, not a school/cohort.)
}

