packages <- c("haven", "tidyverse", "ggplot2")

new_packages <- packages[!packages %in% installed.packages()[, "Package"]]

if (length(new_packages) > 0) {
  install.packages(new_packages)
}

invisible(lapply(packages, library, character.only = TRUE))