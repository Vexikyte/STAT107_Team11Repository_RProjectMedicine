# All our functions for the Exploratory Data Analysis

# General Dataset Information
# Input a dataset, and it returns its dimensions, its first few rows, and a summary of its data.
get_dataset_info <- function(data) {
  print(dim(data))
  print(head(data))
  print(summary(data))
}


# Classifies participants according to whether they reported lower-back pain.
# data: A dataset containing back_pain and site_low_back.
# Returns the dataset with a new low_back_group factor column
create_low_back_group <- function(data) {
  group <- rep(NA_character_, nrow(data))
  group[data$back_pain == "No"] <- "No"
  
  group[data$back_pain == "Yes" & data$site_low_back %in% TRUE] <- "Yes"
  group[data$back_pain == "Yes" & data$site_low_back %in% FALSE] <- "No"
  data$low_back_group <- factor(group,levels = c("No", "Yes"))

  return(data)
}

# -----------------------------------------
# Screening groups
# -----------------------------------------
# The function classifies participants based on their prolonged-symptom screening responses
# Input a dataset with the back_pain variable
# Outputs the dataset with a new symptom_group column
# Contains Yes/No Screening classifications

create_symptom_group <- function(data) {
  group <- rep(NA_character_, nrow(data))
  
  group[data$back_pain == "No"] <- "No"
  group[data$back_pain == "Yes"] <- "Yes"
  
  data$symptom_group <- factor(
    group,
    levels = c("No", "Yes")
  )
  
  return(data)
}


# -----------------------------------------
# Group summaries and missing values
# -----------------------------------------
# Insert a dataset, and the measurement you want to summarize.
# Symptom_group is defaulted as the categorical variable used to separate participants.
# Outputs a data frame with one row per group and columns for the group name, count, mean, median, and stdev

summary_by_group <- function(data, variable,
                             group_variable = "symptom_group") {
  
  groups <- levels(data[[group_variable]])
  
  results <- lapply(groups, function(group) {
    values <- data[[variable]][data[[group_variable]] == group]
    values <- values[!is.na(values)]
    
    data.frame(
      Group = group,
      Count = length(values),
      Mean = if (length(values) > 0) round(mean(values), 2) else NA_real_,
      Median = if (length(values) > 0) round(median(values), 2) else NA_real_,
      SD = if (length(values) > 1) round(sd(values), 2) else NA_real_
    )
  })
  
  return(do.call(rbind, results))
}

# Input a dataset, the variable with missing values to examine
# Symptom_group is defaulted for the grouping variable
# It'll output a data frame showing each group's missing-value count and missing-value percentage
missing_by_group <- function(data, variable,
                             group_variable = "symptom_group") {
  
  groups <- levels(data[[group_variable]])
  
  results <- lapply(groups, function(group) {
    values <- data[[variable]][data[[group_variable]] == group]
    
    data.frame(
      Group = group,
      Missing = sum(is.na(values)),
      Missing_Percent = round(mean(is.na(values)) * 100, 2)
    )
  })
  
  return(do.call(rbind, results))
}


# -----------------------------------------
# Basic plots
# -----------------------------------------

# Input a dataset, the variable to visualize, and  given the measurement a display name with label
# Grouping variable is defaulted to symptom_group
# Outputs a boxplot displayed in the plotting output

plot_group_box <- function(data, variable, label,
                           group_variable = "symptom_group") {
  
  boxplot(
    data[[variable]] ~ data[[group_variable]],
    main = paste(label, "by Symptom Screening Group"),
    xlab = "Prolonged Symptom Screening",
    ylab = label,
    col = c("lightblue", "lightgreen")
  )
}

# -----------------------------------------
# Categorical summaries and plots
# -----------------------------------------

# Purpose:
# Displays the frequency and percentage distribution of a categorical variable.
#
# Input:
# data: A dataset containing the variable to examine.
# variable: The name of the categorical variable as a string.
#
# Output:
# Prints a table of category counts and their corresponding percentages.
get_category_info <- function(data, variable) {
  counts <- table(data[[variable]], useNA = "ifany")
  
  cat("Category counts:\n")
  print(counts)
  
  cat("\nCategory percentages:\n")
  print(round(prop.table(counts) * 100, 1))
}

# Makes a bar plot revealing the frequency distribution of a categorical variable.
# data: Provide a dataset with the variable to visualize
# variable: Provide the name of the categorical variable as a string
# label: Provide a descriptive label for the plot title and axis
# horizontal: Defaulted to FALSE, determines if the bars should be vertical
# This will output a bar plot of the category frequencies.
plot_category_bar <- function(data, variable, label,
                              horizontal = FALSE) {
  
  counts <- table(data[[variable]])
  
  if (horizontal) {
    old_mar <- par("mar")
    par(mar = c(5, 12, 4, 2))
    
    barplot(
      counts,
      horiz = TRUE,
      las = 1,
      main = paste(label, "Distribution"),
      xlab = "Number of Participants",
      col = "darkred"
    )
    
    par(mar = old_mar)
    
  } else {
    barplot(
      counts,
      main = paste(label, "Distribution"),
      xlab = label,
      ylab = "Number of Participants",
      col = "darkblue"
    )
  }
}

# Makes a histogram for observing numerical frequency distributions of a given variable
# data: Provide a dataset with the variable to visualize
# variable: Provide the name of the categorical variable as a string
# label: Provide a descriptive label for the plot title and axis
plot_histogram <- function(data, variable, label) {
  values <- data[[variable]]
  values <- values[is.finite(values)]
  
  hist(
    values,
    main = paste("Distribution of", label),
    xlab = label,
    col = "darkred",
    breaks = 20
  )
}
