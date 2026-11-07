# All our functions for the Exploratory Data Analysis

get_dataset_info <- function(data) {
  print(dim(data))
  print(head(data))
  print(summary(data))
}


# Create groups based on prolonged low-back symptoms
create_low_back_group <- function(data) {
  group <- rep(NA_character_, nrow(data))
  group[data$back_pain == "No"] <- "No"
  
  group[data$back_pain == "Yes" & data$site_low_back %in% TRUE] <- "Yes"
  group[data$back_pain == "Yes" & data$site_low_back %in% FALSE] <- "No"
  data$low_back_group <- factor(group,levels = c("No", "Yes"))

  return(data)
}


# Calculate statistics for each group
summary_by_group <- function(data, variable) {
  groups <- levels(data$low_back_group)
  results <- lapply(groups, function(group) {
    values <- data[[variable]][data$low_back_group %in% group]
    values <- values[!is.na(values)]
    data.frame(
      Group = group,
      Count = length(values),
      Mean = if (length(values) > 0)
        round(mean(values), 2) else NA_real_,
      Median = if (length(values) > 0)
        round(median(values), 2) else NA_real_,
      SD = if (length(values) > 1)
        round(sd(values), 2) else NA_real_
    )
  })
  
  return(do.call(rbind, results))
}


# Create a boxplot for a measurement
plot_group_box <- function(data, variable, label) {
  boxplot(
    data[[variable]] ~ data$low_back_group,
    main = paste(label, "by Low-Back Symptoms"),
    xlab = "History of Low-Back Symptoms",
    ylab = label,
    col = c("lightblue", "lightgreen")
  )
}


# Create a histogram for a measurement
plot_histogram <- function(data, variable, label) {
  values <- data[[variable]]
  values <- values[is.finite(values)]
  hist(
    values,
    main = paste("Distribution of", label),
    xlab = label,
    col = "lightblue",
    breaks = 20
  )
}


# Show the counts and percentages for a category
get_category_info <- function(data, variable) {
  counts <- table(data[[variable]])
  print(counts)
  print(round(prop.table(counts) * 100, 1))
}


# Create a bar chart for a category
plot_category_bar <- function(data, variable, label, horizontal = FALSE) {
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
      col = "lightblue"
    )
    par(mar = old_mar)
  } else {
    barplot(
      counts,
      main = paste(label, "Distribution"),
      xlab = label,
      ylab = "Number of Participants",
      col = "lightblue"
    )
  }
}

# -----------------------------------------
# General dataset information
# -----------------------------------------

get_dataset_info <- function(data) {
  cat("Dataset dimensions:\n")
  print(dim(data))
  
  cat("\nFirst six observations:\n")
  print(head(data))
  
  cat("\nSummary statistics:\n")
  print(summary(data))
}


# -----------------------------------------
# Screening groups
# -----------------------------------------

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

# Categorical summaries and plots
get_category_info <- function(data, variable) {
  counts <- table(data[[variable]], useNA = "ifany")
  
  cat("Category counts:\n")
  print(counts)
  
  cat("\nCategory percentages:\n")
  print(round(prop.table(counts) * 100, 1))
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
