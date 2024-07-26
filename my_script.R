# Sample Analysis Script
#
# This script performs a simple 'analysis' to calculate summary statistics 
# on participant ages, stratified by state of residence.  
#
# Requires tidyverse:
# install.packages("tidyverse")
# install.packages("ggplot2")
library(tidyverse)
library(ggplot2)


# Read in the age csv.
my_data <- read_csv("ages.csv")

# Print out a message
print("Here's a sample message")

# Write the head of this dataframe to a file.
write_csv(head(my_data), "ages_head.csv")

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

# Generate a boxplot showing the results.
my_data %>% 
  ggplot() +
  geom_boxplot(aes(x=state, y=age_years, fill=state), outlier.shape=NA) +
  scale_fill_brewer(palette="Set2")

# Save the results to a PNG.
ggsave("my_result_plot.png", width=6, height=5, unit="in")
