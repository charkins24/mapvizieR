% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/goal_strand_plot.R
\name{goal_strand_plot}
\alias{goal_strand_plot}
\title{Plot MAP Goal Strand Results}
\usage{
goal_strand_plot(mapvizieR_obj, studentids, measurementscale, fws, year)
}
\arguments{
\item{mapvizieR_obj}{a \code{mapvizieR} object}

\item{studentids}{vector of student id numbers for students to plot}

\item{measurementscale}{measurementscale to plot}

\item{fws}{season (fall, winter, or spring) to plot}

\item{year}{academic year to plot}
}
\value{
a ggplot2 object
}
\description{
Plots a group of students' goal strand RIT scores, with each 
student ranked by overall RIT score.  Colors of points indicating goal strand RIT 
scores indicate deviation from overall RIT score; colors of overall RIT mark (|)
indicate national percentile rank of the overall RIT score.
}
\details{
Creates and prints a ggplot2 object showing both overall and goal strand RIT
scores for each student in a subets.
}
\examples{
\dontrun{
require(dplyr)

data("ex_CombinedStudentsBySchool")
data("ex_CombinedAssessmentResults")

map_mv <- mapvizieR(ex_CombinedAssessmentResults, ex_CombinedStudentsBySchool)

ids <- ex_CombinedStudentsBySchool \%>\% 
  dplyr::filter(
    Grade == 8,
    SchoolName == "Mt. Bachelor Middle School",
    TermName == "Spring 2013-2014") \%>\% select(StudentID) \%>\%
    unique()

goal_strand_plot(
  map_mv, 
  studentids = c(ids[1:49, "StudentID"]), 
  measurementscale = "Mathematics", 
  fws = "Spring", 
  year = 2013
)
}
}

