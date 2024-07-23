# Sample Analysis Script
#
# This script performs a simple 'analysis' to calculate summary statistics 
# on participant ages, stratified by state of residence.  
#
# Requires tidyverse:
# install.packages("tidyverse")
library(tidyverse)


# Read in the age csv.
my_data <- read_csv("ages.csv")

# Calculate summary statistics by state.
my_summary <- my_data %>% 
  group_by(state) %>%
  summarize(
    mean_age = mean(age_years),
    sd_age = sd(age_years),
    median_age = median(age_years),
    min_age = min(age_years),
    max_age = max(age_years),
    n_participants = n()
  )

# Write the results out to CSV.
write_csv(my_summary, "summary_stats.csv")