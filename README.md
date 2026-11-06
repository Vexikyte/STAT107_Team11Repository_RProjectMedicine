# STAT107_Team11Repository_RProjectMedicine

This GitHub Repo is dedicated for Team 11's STAT107 R Project. Team members are Ethan Ballada, Nitesh Kanathala and Muhammad Cheema.

[GitHub Usernames]

| Ethan Ballada is 'vexikyte'.
| Muhammad Cheema is 'mcheema2003'
| Nitesh Kanathala is 'knit715'

## Files

| File | Role |
|---|---|
| `data/ARQ_F.xpt` | NHANES 2009-2010 arthritis questionnaire |
| `data/ARX_F.xpt` | NHANES 2009-2010 arthritis body measures (spinal exam) |
| `data/DEMO_F.xpt` | NHANES 2009-2010 demographics and survey design variables |
| `data/BMX_F.xpt` | NHANES 2009-2010 body measures (height, weight, BMI) |
| `00_requirements.R` | Installs and loads the required packages |
| `01_funct_DataIntegration.R` | Function for merging the datasets |
| `02_funct_DataCleaning.R` | Functions for cleaning the data |
| `03_funct_EDA.R` | Functions for EDA, including grouping participants, calculating summary statistics, and generating visualizations |
| `11_DataCleaning.Rmd` | Merges and cleans the data, then creates `12_DataSaving.RData` |
| `12_DataSaving.RData` | Saved cleaned data, used by later files |
| `21_EDA.Rmd` | Performs EDA comparing spinal mobility measurements between participants with and without prolonged low-back symptoms. |
| `21_EDA.html` | Current Knitted HTML report containing missing-value checks, summary statistics, boxplots, and a histogram |
| `20_DemographicEDA.Rmd` | Performs demographic EDA on age, BMI, sex, and race/ethnicity. |
| `20_DemographicEDA.html` | Current Knitted HTML report containing missing-value checks, summary statistics, histograms, barcharts, and interpretations.  |

## How to Reproduce

1. Open `STAT107_Team11Repository_RProjectMedicine.Rproj` in RStudio.
2. Knit `11_DataCleaning.Rmd`. This loads the packages, cleans the data and creates `12_DataSaving.RData`.
