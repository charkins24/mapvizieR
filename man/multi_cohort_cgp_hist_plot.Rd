% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cohort_cgp_hist.R
\name{multi_cohort_cgp_hist_plot}
\alias{multi_cohort_cgp_hist_plot}
\title{Multiple Cohort CGP histories}
\usage{
multi_cohort_cgp_hist_plot(mapvizieR_obj, studentids, measurementscale,
  match_method = "no matching", first_and_spring_only = TRUE,
  entry_grade_seasons = c(-0.8, 4.2), school_norms = 2015,
  small_n_cutoff = 0.5, min_cohort_size = -1, facet_dir = "wide")
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

\item{small_n_cutoff}{any cohort below this percent will get filtered out.
default is 0.5, eg cohorts under 0.5 of max size will get dropped.}

\item{min_cohort_size}{filter cohorts with less than this many students.
useful when weird enrollment patterns exist in your data.}

\item{facet_dir}{c('wide', 'long') facet the cohorts the wide way or the long way}
}
\value{
a list of ggplotGrobs
}
\description{
see cohort_cgp_hist_plot for use.  Pass a vector of studentids
of *all* desired cohorts.  Plot will facet one plot per cohort.
}

