
# ====================================
  
# 01_funct_DataIntegration.R
# Functions designed to support data cleaning for the NHANES datasets.

# ====================================

# For merging the two datasets in the first step, since we're using two covering the same patients

merge_datasets <- function(data1, data2, id_col) {
  inner_join(data1, data2, by = id_col)
}