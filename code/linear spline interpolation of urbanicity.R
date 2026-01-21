#title: "linear spline interpolation of urbanicity"
#date: "2025-05-20"

#R packages to be installed (if not already) and loaded
library(zoo)
library(tidyverse)

#Interpolating urbanicity
data <- read.csv(file.choose()) #select the .csv file "PRE_spline_interpolation urban_.csv" (file path: data/individual data files/(B) population heterogeneity index data/PRE_spline_interpolation_urban.csv)
data_long <- data.frame(data)
data_long <- data_long %>% gather(key = "Year", value = "Value", c(-X1), na.rm = FALSE)
head(data_long)
data_long_interpolated <- data_long %>%
  group_by(X1) %>%
  arrange(Year) %>%
  mutate(interpolated_value = zoo::na.spline(Value, na.rm = FALSE)) %>%
  ungroup() %>%
  arrange(X1, Year)
data_long_interpolated$Year <- as.numeric(sub("X", "", data_long_interpolated$Year))
write.csv(data_long_interpolated, file = "linear_spline_interpolation_urbanicity.csv")



