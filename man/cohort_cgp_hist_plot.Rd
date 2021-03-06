% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cohort_cgp_hist.R
\name{cohort_cgp_hist_plot}
\alias{cohort_cgp_hist_plot}
\title{Shows a cohort's progress over time, in percentile space.}
\usage{
cohort_cgp_hist_plot(mapvizieR_obj, studentids, measurementscale,
  match_method = "no matching", first_and_spring_only = TRUE,
  entry_grade_seasons = c(-0.8, 4.2), school_norms = 2015,
  primary_cohort_only = TRUE, small_n_cutoff = 0.5, no_labs = FALSE)
}
\arguments{
\item{mapvizieR_obj}{conforming mapvizieR obj}

\item{studentids}{vector of studentids}

\item{measurementscale}{target subject}

\item{match_method}{do we limit to matched students, and if so, how?
no matching = any student record in the studentids.
UNIMPLEMENTED METHODS / TODO
strict = only kids who appear in all terms
strict after imputation = impute first, then use stritc method
back one = look back one test term, and only include kids who can be matched}

\item{first_and_spring_only}{show all terms, or only entry & spring?
default is TRUE.}

\item{entry_grade_seasons}{which grade_level_seasons are entry grades?}

\item{school_norms}{c(2012, 2015).  what school norms to use?  default
is 2012.}

\item{primary_cohort_only}{will determine the most frequent cohort and limit to 
students in that cohort.  designed to handle discrepancies in grade/cohort
pattern caused by previous holdovers.  default is TRUE.}

\item{small_n_cutoff}{any cohort below this percent will get filtered out.
default is 0.5, eg cohorts under 0.5 of max size will get dropped.}

\item{no_labs}{if TRUE, will not label x or y axis}
}
\value{
a ggplot object
}
\description{
Shows a cohort's progress over time, in percentile space.
}

