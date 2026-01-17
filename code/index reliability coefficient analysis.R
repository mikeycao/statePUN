#title: "index reliability coefficient analysis"
#date: "2025-05-20"
 
#R packages to be installed (if not already) and loaded
library(psych)

#calculating Cronbach's alpha for the poverty index 
df <- read.csv(file.choose()) #select the .csv file "combined_poverty_index_2000-2018.csv"
povindex <- df[, c("z1", "z2", "z3", "z4", "z5")]
alpha_result <- alpha(povindex, discrete = FALSE)
alpha_result$total

#calculating Cronbach's alpha for the population heterogeneity index 
df <- read.csv(file.choose()) #select the .csv file "combined_population_heterogeneity_index_with_urban_2000-2018.csv"
pophetindex <- df[, c("z1", "z2", "z3")]
alpha_result <- alpha(pophetindex, discrete = FALSE)
alpha_result$total


