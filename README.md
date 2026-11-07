# STAT107_Team11Repository_RProjectMedicine

This GitHub repo is for Team 11's STAT107 R project. Team members are Ethan Ballada, Nitesh Kanathala and Muhammad Cheema.

[GitHub Usernames]

| Ethan Ballada is 'vexikyte'
| Muhammad Cheema is 'mcheema2003'
| Nitesh Kanathala is 'knit715'

## Project Question

| During the 2009-2010 NHANES survey cycle, among participants from ages 20-69, is reported prolonged pain or stiffness associated with differences observed in spinal mobility measurements?

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
| `21_DataProcessing.Rmd` | Performs EDA comparing spinal mobility measurements between participants with and without prolonged pain or stiffness symptoms | Demographic confounding variable considerations
| `21_DataProcessing.html` | Knitted report with missing-value checks, summary statistics, boxplots, and a histogram |
| `FinalReport.Rmd` | The written project report, using the cleaned data and EDA functions to create its tables and figures |
| `FinalReport.pdf` | Knitted PDF of the final report |

PDFs and HTMLs may exist with the files due to formatting tests.
The PDF in the submission however has figure issues, which we were unable to solve. We utilized the solution from announcements, but it was largely ineffective.
If you want to observe a cleaner version of the report without formatting problems, observe the HTML version of its knit.
Otherwise, we'll hear about it in the rubric report and hopefully find a solution for the final submission.

## How to Reproduce

1. Open `STAT107_Team11Repository_RProjectMedicine.Rproj` in RStudio, so the working directory is set to the repo folder.
2. Knit `11_DataCleaning.Rmd`. This installs and loads the packages, merges and cleans the four datasets, and creates `12_DataSaving.RData`.
4. Knit `21_DataVisualization.Rmd` to produce the spinal mobility comparisons between anatomic-region and demographic groups.
5. Knit `FinalReport.Rmd` to produce `FinalReport.pdf`. Knitting to PDF requires LaTeX. If it is not installed, run `install.packages("tinytex")` and then `tinytex::install_tinytex()` in the Console first.

All files read data using relative paths, so no file paths need to be changed.
For pictures and figures, all are generated within the DataVisualization markdown.
The figures were saved by PNGs.