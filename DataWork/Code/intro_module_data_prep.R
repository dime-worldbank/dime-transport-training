library(dplyr)
library(readr)

# Defining the path to the working directory
data_dir <- file.path("~", "Documents", "DIME - BRT", "GIS for Transport","gis-transport-training","DataWork","DataSets", "Final")

# Read in the schools data
schools_data <- read.csv(file.path(data_dir, "schools.csv"))

# Split the data into two files that will be later merged
# Data with the school names only
schools_df1 <- schools_data %>%
  select(osm_id,name, amenity)
# Write the data as a csv file
write.csv(schools_df1, file.path(data_dir, "school_names.csv"), row.names = F)

# Data with the gis coordinates
schools_df2 <- schools_data %>%
  select(osm_id, longitude, latitude)
# Write the data as a csv file
write.csv(schools_df2, file.path(data_dir, "school_coordinates.csv"), row.names = F)
# to delete
summ <- schools_data %>%
  group_by(name) %>%
  summarise(sum =n()) %>%
  arrange(sum)

