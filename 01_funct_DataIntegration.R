
# ====================================

# 01_funct_DataIntegration.R
# Functions designed to support combining the NHANES datasets.

# ====================================

# merge_datasets()
# Combines two datasets, keeping only participants found in both.
# Inputs:
#   data1, data2 - data frames to combine
#   id_col       - name of the shared ID column, as text (e.g. "SEQN")
# Output:
#   A data frame with one row per participant found in both datasets.

merge_datasets <- function(data1, data2, id_col) {
  inner_join(data1, data2, by = id_col)
}
