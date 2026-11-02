
# ====================================

# 02_funct_DataCleaning.R
# Functions designed to support data cleaning for the NHANES datasets.

# ====================================

# recode_special_codes()
# Replaces the NHANES "Refused" and "Don't know" codes with NA.
# Inputs:
#   data  - data frame
#   cols  - names of the columns to recode, as text
#   codes - numeric codes to replace (default 7 = Refused, 9 = Don't know)
# Output:
#   The data frame, with those codes set to NA in the chosen columns.

recode_special_codes <- function(data, cols, codes = c(7, 9)) {
  data %>%
    mutate(across(all_of(cols), ~ replace(.x, .x %in% codes, NA)))
}

# label_yes_no()
# Turns a 1/2 survey column into a Yes/No factor.
# Input:
#   x - numeric vector where 1 = Yes and 2 = No
# Output:
#   A factor with levels "Yes" and "No". Any other value becomes NA.

label_yes_no <- function(x) {
  factor(x, levels = c(1, 2), labels = c("Yes", "No"))
}

# mark_pain_site()
# Shows whether a participant with back pain marked a body site on the
# pain diagram. A site column only holds a value if the site was marked.
# Inputs:
#   site_col  - raw site column (ARQ020A to ARQ020G)
#   back_pain - Yes/No factor showing who was shown the diagram
# Output:
#   TRUE if marked, FALSE if not marked, NA if the diagram was not shown.

mark_pain_site <- function(site_col, back_pain) {
  if_else(back_pain == "Yes", !is.na(site_col), NA)
}

# summarize_measures()
# Creates a table for checking the range of numeric columns.
# Inputs:
#   data - data frame
#   cols - names of the numeric columns to summarize, as text
# Output:
#   A data frame with one row per column: non-missing count, missing
#   count, minimum, median and maximum.

summarize_measures <- function(data, cols) {
  data %>%
    select(all_of(cols)) %>%
    pivot_longer(everything(), names_to = "measure", values_to = "value") %>%
    group_by(measure) %>%
    summarize(
      n       = sum(!is.na(value)),
      missing = sum(is.na(value)),
      min     = min(value, na.rm = TRUE),
      median  = median(value, na.rm = TRUE),
      max     = max(value, na.rm = TRUE)
    )
}
