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

