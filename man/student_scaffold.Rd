% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/growth_df_prep.R
\name{student_scaffold}
\alias{student_scaffold}
\title{student_scaffold}
\usage{
student_scaffold(processed_cdf, start_season, end_season, year_offset)
}
\arguments{
\item{processed_cdf}{a conforming processed_cdf data frame}

\item{start_season}{the start of the growth window ("Fall", "Winter", or "Spring")}

\item{end_season}{the end of the growth window ("Fall", "Winter", or "Spring")}

\item{year_offset}{start_year + ? = end_year.  if same academic_year (eg fall to spring)
this is 0  if spring to spring, this is 1}
}
\value{
a data frame to pass back generate_growth_df that has kids, and the relevant
student/test/seasons to calculate growth records on
}
\description{
which student/test/season rows have valid data?
}

