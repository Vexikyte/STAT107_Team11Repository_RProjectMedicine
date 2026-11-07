# STAT107_Team11Repository_RProjectMedicine

This GitHub repo is for Team 11's STAT107 R project. Team members are Ethan Ballada, Nitesh Kanathala and Muhammad Cheema.

[GitHub Usernames]

| Ethan Ballada is 'vexikyte'
| Muhammad Cheema is 'mcheema2003'
| Nitesh Kanathala is 'knit715'

## Project Question

Is reported back pain associated with differences in spinal mobility measurements among NHANES participants aged 20 to 69?

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
| `11_DataCleaning.html` | Knitted output of the data cleaning steps and checks |
| `12_DataSaving.RData` | Saved cleaned data, used by all later files |
| `20_DemographicEDA.Rmd` | Performs demographic EDA on age, BMI, sex, and race/ethnicity |
| `20_DemographicEDA.html` | Knitted report with missing-value checks, summary statistics, histograms, bar charts, and interpretations |
| `21_EDA.Rmd` | Performs EDA comparing spinal mobility measurements between participants with and without prolonged low-back symptoms |
| `21_EDA.html` | Knitted report with missing-value checks, summary statistics, boxplots, and a histogram |
| `FinalReport.Rmd` | The written project report, using the cleaned data and EDA functions to create its tables and figures |
| `FinalReport.pdf` | Knitted PDF of the final report |

## How to Reproduce

1. Open `STAT107_Team11Repository_RProjectMedicine.Rproj` in RStudio, so the working directory is set to the repo folder.
2. Knit `11_DataCleaning.Rmd`. This installs and loads the packages, merges and cleans the four datasets, and creates `12_DataSaving.RData`.
3. Knit `20_DemographicEDA.Rmd` to produce the demographic summaries and plots.
4. Knit `21_EDA.Rmd` to produce the spinal mobility comparisons between low-back symptom groups.
5. Knit `FinalReport.Rmd` to produce `FinalReport.pdf`. Knitting to PDF requires LaTeX. If it is not installed, run `install.packages("tinytex")` and then `tinytex::install_tinytex()` in the Console first.

All files read data using relative paths, so no file paths need to be changed.

