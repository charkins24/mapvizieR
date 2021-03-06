#' Percent of students above a given percentile, by cohort
#'
#' @param mapvizieR_obj a conforming mapvizieR object
#' @param studentids vector of studentids
#' @param measurementscale target subject
#' @param target_percentile what is the goal percentile for calcs (pct
#' of students at/above this percentile?)
#' @param first_and_spring_only logical, should we drop winter/fall scores?
#' @param entry_grade_seasons what seasons are entry grades?
#' @param small_n_cutoff any cohort below this percent will get filtered out.  
#' default is 0.5, eg cohorts under 0.5 of max size will get dropped.
#'
#' @return a ggplot object
#' @export

historic_nth_percentile_plot <- function(  
  mapvizieR_obj,
  studentids,
  measurementscale,
  target_percentile = 75,
  first_and_spring_only = TRUE,
  entry_grade_seasons = c(-0.8, 4.2),
  small_n_cutoff = .5
) {
  mv_opening_checks(mapvizieR_obj, studentids, 1)
  this_cdf <- mv_limit_cdf(mapvizieR_obj, studentids, measurementscale)
  
  #put cohort onto cdf
  if (! 'cohort' %in% names(this_cdf) %>% any()) {
    this_cdf <- roster_to_cdf(this_cdf, mapvizieR_obj, 'implicit_cohort') %>%
      dplyr::rename(
        cohort = implicit_cohort
      )
  }
  
  #only valid seasons
  this_cdf <- valid_grade_seasons(
    this_cdf, first_and_spring_only, entry_grade_seasons, 9999
  )
  
  #small_n_filter
  to_keep <- this_cdf %>%
    dplyr::group_by(cohort, grade_level_season) %>%
    dplyr::summarize(
      n = n()
    ) %>%
    dplyr::group_by(cohort) %>%
    #only per cohort that is above the small n cutoff
    dplyr::filter(
      n >= max(n) * small_n_cutoff
    ) %>%
    dplyr::mutate(
      cohort_season = paste(cohort, grade_level_season, sep = '_')      
    ) %>%
    as.data.frame()

  this_cdf <- this_cdf %>%
    dplyr::mutate(
      cohort_season = paste(cohort, grade_level_season, sep = '_')      
    ) %>%
    dplyr::filter(
      cohort_season %in% to_keep$cohort_season
    )

  cdf_sum <- this_cdf %>%
    dplyr::group_by(
      cohort, map_year_academic, grade_level_season
    ) %>%
    dplyr::summarize(
      pct_above = ifelse(consistent_percentile >= target_percentile, 1.0, 0.0) %>%
        mean() %>% multiply_by(100) 
    )
  
  out <- ggplot(
    data = cdf_sum,
    aes(
      x = grade_level_season,
      y = pct_above,
      group = cohort,
      label = pct_above %>% round(0)
    )
  ) +
  geom_text(
    size = 6,
    alpha = 0.5,
    vjust = 1
  ) +
  geom_point() +
  geom_line() +
  theme_bw() +
  theme(panel.grid = element_blank()) +
  facet_grid(. ~ cohort) +
  scale_x_continuous(
    breaks = cdf_sum$grade_level_season %>% unique(),
    labels = cdf_sum$grade_level_season %>% unique() %>%
      lapply(fall_spring_me) %>% unlist()
  ) +
  labs(
    x = 'Grade/Season',
    y = sprintf('Percent Above %s %%ile', target_percentile)
  )
  
  return(out)
}
